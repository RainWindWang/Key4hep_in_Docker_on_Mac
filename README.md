Here're some instructions and convenient macros for running key4hep from CernVM-FS (especially graphic interface) in an el9 container on MacOS.

#CernVM-FS client on Mac

Reference: [CernVM-FS documentation](https://cvmfs.readthedocs.io/en/stable/cpt-quickstart.html) and [TWiki](https://twiki.cern.ch/twiki/bin/view/AtlasComputing/Cvmfs21).

##Installation
CVMFS is based on [macFUSE](https://osxfuse.github.io/). Download an install macFUSE4 for MacOS 11, the installation will tell you to:
* enable [kernel extensions](https://support.apple.com/guide/mac-help/change-security-settings-startup-disk-a-mac-mchl768f7291/mac)
* allow updates to software from Benjamin Fleischer (System Preferences -> Privacy)
* reboot

Verify that fuse is available with:
```
kextstat | grep -i fuse
```
