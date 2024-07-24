#! /bin/bash
# eg of mount.sh script; needs to run as superuser.  (sudo <path>/mount.sh)
mount -t cvmfs cvmfs-config.cern.ch /cvmfs/cvmfs-config.cern.ch
mount -t cvmfs sw.hsf.org /cvmfs/sw.hsf.org
mount -t cvmfs sw-nightlies.hsf.org /cvmfs/sw-nightlies.hsf.org
mount -t cvmfs ilc.desy.de /cvmfs/ilc.desy.de
mount -t cvmfs clicdp.cern.ch /cvmfs/clicdp.cern.ch
mount -t cvmfs sft.cern.ch /cvmfs/sft.cern.ch
mount -t cvmfs geant4.cern.ch /cvmfs/geant4.cern.ch
mount -t cvmfs sft-nightlies.cern.ch /cvmfs/sft-nightlies.cern.ch
