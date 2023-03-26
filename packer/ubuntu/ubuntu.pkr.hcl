variable "box_out_dir" {
  type    = string
  default = "./dist/"
}

variable "cpu" {
  type    = string
  default = "4"
}

variable "disk_size" {
  type    = string
  default = "40000"
}

variable "iso_checksum_type" {
  type    = string
  default = "sha256"
}

variable "iso_checksum_url" {
  type    = string
  default = "https://releases.ubuntu.com/22.04/SHA256SUMS"
}

variable "iso_url" {
  type    = string
  default = "https://releases.ubuntu.com/22.04/ubuntu-22.04.2-live-server-amd64.iso"
}

variable "keyboard_layout" {
  type    = string
  default = "us"
}

variable "locale" {
  type    = string
  default = "en_US.UTF-8"
}

variable "output_directory" {
  type    = string
  default = "./output/ubuntu/"
}

variable "output_filename" {
  type    = string
  default = "ubuntu"
}

variable "password" {
  type    = string
  default = "6Creators!"
}

variable "crypted_password" {
  type        = string
  description = "openssl passwd -6 password. must match password from above"
  default     = "$6$yCojYPpBt4oi5QcY$wKl8hYTgmIPSxFybf.4dBud4aYxEuKcA5EbFv08xm7zPzfaGARUSSa4F.8Y447NOKfrjIOlYC9XxgPid/5FVp1"
}

variable "ram_size" {
  type    = string
  default = "4096"
}

variable "username" {
  type    = string
  default = "eric"
}

variable "vm_name" {
  type    = string
  default = "ubuntu"
}

variable "input_directory" {
  type    = string
  default = "./output/ubuntu/"
}

variable "input_name" {
  type    = string
  default = "ubuntu"
}

variable "timezone_region" {
  type    = string
  default = "America"
}

variable "timezone_city" {
  type    = string
  default = "Chicago"
}

source "virtualbox-iso" "ubuntu" {
  boot_command = [
    "c<wait5>", 
    "set gfxpayload=keep<enter><wait5>", 
    "linux /casper/vmlinuz <wait5>", 
    "autoinstall quiet fsck.mode=skip <wait5>", 
    "net.ifnames=0 biosdevname=0 systemd.unified_cgroup_hierarchy=0 <wait5>", 
    "ds=\"nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/\" <wait5>", 
    "---<enter><wait5>", 
    "initrd /casper/initrd<enter><wait5>", 
    "boot<enter>"
  ]
  boot_wait               = "3s"
  headless                = true
  http_directory          = "http/"
  vboxmanage              = [
    ["modifyvm", "{{ .Name }}", "--cpu-profile", "host"], 
    ["modifyvm", "{{ .Name }}", "--nat-localhostreachable1", "on"],
    ["modifyvm", "{{ .Name }}", "--vram", "8", "--graphicscontroller", "vmsvga", "--acpi", "on", "--ioapic", "on", "--nestedpaging", "on", "--largepages", "on", "--hwvirtex", "on", "--pae", "on", "--longmode", "on"],
    ["modifyvm", "{{ .Name }}", "--natsettings1", "16000,128,128,0,0"]
  ]
	communicator            = "ssh"
	cpus                    = var.cpu
	disk_size               = var.disk_size
	guest_additions_mode    = "attach"
	iso_checksum            = "file:${var.iso_checksum_url}"
	iso_url                 = var.iso_url
	memory                  = var.ram_size
	output_directory        = var.output_directory
  output_filename         = var.output_filename
	shutdown_command        = "echo '${var.password}' | sudo -S -E shutdown -P now"
	ssh_password            = var.password
	ssh_timeout             = "4h"
	ssh_username            = var.username
	vm_name                 = var.vm_name
  guest_os_type           = "Ubuntu22_LTS_64"
}

build {
  sources = ["source.virtualbox-iso.ubuntu"]

  provisioner "shell" {
    inline = [
      "sudo mkdir -p /media/cdrom",
      "sudo mount /dev/sr1 /media/cdrom",
      "sudo /media/cdrom/VBoxLinuxAdditions.run",
      "sudo reboot now"
    ]
    expect_disconnect = true
    valid_exit_codes = [0, 2]
  }
}