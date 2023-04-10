# Toolkit
This repository contains a set of tools for building a kubernetes cluster.
We simulate our cluster by using packer to build a set of virtualbox images in packer/. These are then set up and booted using python scripts in python/.
We then use a set of ansible roles to bootstrap kubernetes, found in ansible/.
