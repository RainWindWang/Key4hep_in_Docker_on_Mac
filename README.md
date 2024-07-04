Here're some instructions and convenient macros for running key4hep from CernVM-FS (especially graphical interface) in an el9 container on MacOS.

# CernVM-FS client on Mac

Reference: CernVM-FS [documentation](https://cvmfs.readthedocs.io/en/stable/cpt-quickstart.html) and [TWiki](https://twiki.cern.ch/twiki/bin/view/AtlasComputing/Cvmfs21).

## Installation
### macFUSE
CVMFS is based on [macFUSE](https://osxfuse.github.io/). Download an install macFUSE4 for MacOS 11, the installation will tell you to:
* enable [kernel extensions](https://support.apple.com/guide/mac-help/change-security-settings-startup-disk-a-mac-mchl768f7291/mac) (recovery mode -> Startup Security Utility)
* allow updates to software from Benjamin Fleischer (System Preferences -> Privacy)
* reboot system

You can verify that fuse is available with:
```
kextstat | grep -i fuse
```
### CVMFS
Then, download CernVM-FS client package:
```
curl -o ~/Downloads/cvmfs-2.11.3.pkg https://ecsft.cern.ch/dist/cvmfs/cvmfs-2.11.3/cvmfs-2.11.3.pkg
```
Alternatively, a native package for Apple Silicon M1/M2... processors is available as well:
```
curl -o ~/Downloads/cvmfs-2.11.2-applesilicon.pkg https://ecsft.cern.ch/dist/cvmfs/cvmfs-2.11.2/cvmfs-2.11.2-applesilicon.pkg
```
* open the `.pkg` file and install it
* reboot after installing
  
## Configuration
The following configuration needs to be done as superuser.
* for the basic setup, run `sudo cvmfs_config setup`
* copy `default.local` to `/etc/cvmfs/default.local`

Then, mount each of the individual repositories in `default.local`.
* create the mount points:
```
sudo mkdir -p /cvmfs/cvmfs-config.cern.ch
sudo mkdir -p /cvmfs/sw.hsf.org
sudo mkdir -p /cvmfs/sw-nightlies.hsf.org
sudo mkdir -p /cvmfs/clicdp.cern.ch
sudo mkdir -p /cvmfs/sft.cern.ch
sudo mkdir -p /cvmfs/geant4.cern.ch
sudo mkdir -p /cvmfs/sft-nightlies.cern.ch
```
* make `mount/mount.sh` and `mount/unmount.sh` executable (and put them somewhere you can access as `sudo`):
```
chmod +x mount/mount.sh
chmod +x mount/unmount.sh
```
* mount/unmount CVMFS by doing:
```
sudo mount/mount.sh
sudo mount/unmount.sh
```
You can check if CVMFS mounts your repositories by `cvmfs_config probe`.

# Docker and Xquartz
* Download and install [Docker desktop](https://www.docker.com/products/docker-desktop).
* Download and install [Xquartz](https://www.xquartz.org) (or `brew install xquartz`).

## Configure X11
* open Xquartz, go into Xquartz -> Settings -> Security.
* check `Allow connections from network clients`.
* open Terminal, enter the following command to enable OpenGL rendering:
```
defaults write org.xquartz.X11 enable_iglx -bool true
```
* reboot Xquartz.

Everytime you start Mac, enter the following command in Terminal (it's already in `docker-macos.sh`)
```
xhost +localhost
```

# Use el9 docker image
The docker image we're using is `ghcr.io/aidasoft/el9:latest`. Change `docker_tag` in `docker-macos.sh` if you want to use a different image.
* Create your `/workarea`, copy `docker-macos.sh` and `warm-up.sh` inside.
* Make sure docker desktop is running. To run a docker container of el9, from `/workarea`:
```
./docker-macos.sh
```
By doing so, `/tmp/.X11-unix` (read only), `/cvmfs` (shared) and `$PWD` (your current working area) are mounted. The container will be automatically deleted when it exits.
* Now you can setup key4hep of any version from CVMFS. Note that ROOT (or anyother software from CVMFS) will be slow for the first time you run it. Warm it up right after running the docker container by doing something like this:
```
source /cvmfs/sw-nightlies.hsf.org/key4hep/setup.sh
./warm-up.sh
```
Then running a ROOT graphical interface will be just as fast as running it locally. You can try it with LUXE tracker TGeo file `LUXETrackerAsEndcap.root`:
```
root
// once root is running:
TGeoManager::Import("LUXETrackerAsEndcap.root")
gGeoManager->GetTopVolume()->Draw("ogl")
```

Enjoy!
