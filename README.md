# Toolkit

- This repository contains a set of tools for building a kubernetes cluster.
- We simulate our cluster by using packer to build a set of virtualbox images in packer/. These are then set up and booted using python scripts in python/.
- We then use a set of ansible roles to bootstrap kubernetes, found in ansible/.
- The python scripts boot a vyos router and a set of ubuntu control/worker nodes.
- We have a private network controlled by the vyos router that can use nat to access our actual network.
- We use addons for kubernetes including MetalLB for load balancing, and rook for storage.
