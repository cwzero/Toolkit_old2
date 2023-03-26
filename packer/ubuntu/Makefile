ubuntu.ova: output/ubuntu/ubuntu.ovf output/ubuntu/ubuntu-disk001.vmdk
	ovftool output/ubuntu/ubuntu.ovf ubuntu.ova

output/ubuntu/ubuntu.ovf: ubuntu.pkr.hcl http/user-data
	packer build ubuntu.pkr.hcl