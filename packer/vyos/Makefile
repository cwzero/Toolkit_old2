vyos.ova: output/vyos/vyos.ovf output/vyos/vyos-disk001.vmdk
	ovftool output/vyos/vyos.ovf vyos.ova

output/vyos/vyos.ovf: vyos.pkr.hcl cleanup.sh
	packer build vyos.pkr.hcl