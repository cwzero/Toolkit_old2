variable "vyos_output_name" {
  type    = string
  default = "vyos"
}

variable "vyos_username" {
  type    = string
  default = "vyos"
}

variable "vyos_vm_name" {
  type    = string
  default = "vyos"
}

variable "vyos_iso_checksum" {
  type    = string
  default = "b8048c75b21f60bd8255e984cb872f827b5130cdbf9dc725c1c436e47c518776"
}

variable "vyos_iso_url" {
  type    = string
  default = "https://s3-us.vyos.io/rolling/current/vyos-1.4-rolling-202303170317-amd64.iso"
}

variable "vyos_ram_size" {
  type    = string
  default = "512"
}

variable "vyos_disk_size" {
  type    = string
  default = "10000"
}

variable "vyos_ip" {
  type    = string
  default = "10.0.0.1"
}

variable "vyos_host_ip" {
  type    = string
  default = "192.168.120.107"
}

variable "vyos_subnet_range" {
  type    = string
  default = "10.0.0.0/8"
}

variable "vyos_dns" {
  type = string
  default = "8.8.8.8"
}

variable "vyos_output_directory" {
  type    = string
  default = "./output/vyos/"
}

variable "vyos_output_filename" {
  type    = string
  default = "vyos"
}

variable "vyos_password" {
  type = string
  default = "vyos"
}

source "virtualbox-iso" "vyos" {
  boot_command = [
    # Login to live ISO
    "<enter><wait3><enter><wait90>",
    # Login
    "vyos<enter><wait>vyos<enter><wait>",
    # Start the installation
    "install image<enter><wait3>",
    # Would you like to continue (Yes/No): (Yes):
    "<enter><wait3>",
    # Partition (Auto/Parted/Skip) (Auto):
    "<enter><wait3>",
    # Install the image on? (sda):
    "<enter>",
    # Continue? (Yes/No) (No):
    "Yes<enter><wait3>",
    # How big of a root partition should I create?
    "<enter><wait20>",
    # What would you like to name this image?
    "<enter><wait3>",
    # Which one should I copy to sda?
    "<enter><wait8>",
    # Enter password for user vyos:
    "${var.vyos_password}<enter>",
    # Retype password for user vyos:
    "${var.vyos_password}<enter><wait3>",
    # Which drive should GRUB modify the boot partition on? (sda):
    "<enter><wait5>",
    # Reboot
    "reboot<enter><wait3>y<enter>",
    # Wait for reboot
    "<wait130>",
    # Login
    "vyos<enter><wait3>",
    "${var.vyos_password}<enter><wait3>",
    # Enter configuration mode
    "configure<enter><wait3>",
    # Configure IP
    "set interfaces ethernet eth0 address dhcp<enter>",
    # Enable SSH
    "set service ssh port '22'<enter>",
    # Commit configuration
    "commit<enter><wait3>",
    # Save configuration
    "save<enter><wait3>",
    "set system login user eric full-name \"Eric Gjerde\"<enter><wait>",
    "set system login user eric authentication encrypted-password $6$yCojYPpBt4oi5QcY$wKl8hYTgmIPSxFybf.4dBud4aYxEuKcA5EbFv08xm7zPzfaGARUSSa4F.8Y447NOKfrjIOlYC9XxgPid/5FVp1<enter><wait>",
    "set system login user eric authentication plaintext-password 6Creators!<enter><wait>",
    "set system login user eric authentication public-keys eric@eric-desktop1 key AAAAB3NzaC1yc2EAAAADAQABAAABgQDQ5j8fGsnrlwv/1x6iVb3yXZ7DBoS0SAPY1NuQB0S7mJ19QTtzkkTfCOr0lEFBe+0+jEGWOAzAYVvr+rhRJUrG5X+KbegLpejybbwL4lZ5L60CzLJ4g7ZLrYk3I2f8iOI0slfLOflk8u3J+hmujZ2jH2dkRIygXCQkgaZF90mEX2112kp1Hkg/Uv4Eu/F6NdoeqPHqsl4UNxHsBlgwSrm5lr/rNCR76CMiRgsr9dJtIXX58NTYpzmDB5We7QUWoN3n4ahAtUTHAfZa2YkaIOcDaqjKmAFXjlvUWw6ZcRTITMvu7hgEIl1V/f4JXCrtE99m+EKiqQVv3wEp/t5URz4W4VuyBjOkpytAcqzcFbsXI15uLHGhncEi7KYr/VxbKADOzbD4Hqkpv7T7C030LHf0qQc3JDJXq+ypY0hgBLP3wlneyCZIX9GAOjmnzrX2BwS1Cl56lhSXYG355idTC/lPr4XJWl0thkGVrlqozcKSonboRx4UAvM09cOAngChWDc=<enter><wait>",
    "set system login user eric authentication public-keys eric@eric-desktop1 type ssh-rsa<enter><wait>",
    "set system login user eric authentication public-keys eric@eric-desktop2 key AAAAB3NzaC1yc2EAAAADAQABAAABgQDPiiuOGPfo6siz0tUdzAWsVBrb2OgqRLEVMO/zBkELbPMoOxjh13tQMVkM6YnY23dKavsMT39LIaGaMWK8979NCl99EQkMAX0cCB2A0TaooglUsDSIXq0JJGvyz9SkT2pWaDARMHgWzrQ805USqUgxgcvkDd7AOnM2LBTRZ7tSu6AfEGnIcFq8nbL+nbMUim+XkAmBrBBOSAN5+uZ8UO2nwBO4FdMu41L1NR3qRZcAg7V3Uh0fo8FjYOO5R+c5zmCawRwgzqJ3H0rVhVI09C+JZUT17TAYu2W8AjuqKkQHZS9hR/J+X/HDRfXJ8NwseBr6vVsivWIIGRtwlfYe3+1jcSa27ko47temrHeyjyypB+MZSliprTbYqDI2Fj7jcUVtrrh43+e2tp2nrj1O2gxCu8Pkymfgw6V0JU3FQrL+j+eVxhFCpURn4exIzhvP8PmxzoGub56oGMNaAN0/vKZ3IhW3MW17ZYs4y1Wz+w0c79TWfcTtOedQZaN6h5Ll4/c=<enter><wait>",
    "set system login user eric authentication public-keys eric@eric-desktop2 type ssh-rsa<enter><wait>",
    "set system login user eric authentication public-keys eric@eric-laptop1 key AAAAB3NzaC1yc2EAAAADAQABAAABgQC4k5t+kXEWzFQIJpqTlBVaylr9hGvV1y2VSFIQ+oVhEZAi0X2NSKsZybOSLhI0DRJdxBWGjXJR4h4kI8MrFhkCydEADig53gtWWhQjNw4ZZLYfl0wmU/t/LXiDmWNQ8A9Wy+4frRLI7q/qsnoIaaL5l67mp0C9Jc/XFZQ0BzRvzah/WYLgAh7oJDWeqxRuM1JCZdVsSAykkH0X4x1oV9iHBTBph7g6CUfjO6EBPsivsXBmXITyUoGql1bd5IrJCfU19HMTw7ujwk3JlL9rbM/aX+irgFch/j6xYWAv3G13Cn+K4JeoFr96ETuaMcIcArHO4Qn30ArzOtu7VN4VU+OwBbLctjpSHK8bAYHtv4gw9a1KGsIV73aJ0lKC7+8YIXtt2JxaqVExpY8lpAKa4yl7mm6EArEaIGA2r+CoF7Gi/qtd4QK/urwKomPk+RV/bsfiafLqzKUG/9jUzIz+9mnHCO6nIYn5rygyVTiEHnoWTu0a6GSWlxu8fvsQw4LZoac=<enter><wait>",
    "set system login user eric authentication public-keys eric@eric-laptop1 type ssh-rsa<enter><wait>",
    "set system login user eric authentication public-keys eric@eric-laptop2 key AAAAB3NzaC1yc2EAAAADAQABAAABgQDXjfWiKe1XCmfrzV7bpWpYt/Wns59fO7BD6U+7lyS7nPlX2nM+wSGDvaiJnVd53JjWgXIA4kcUzIlRtCc1HYmYg8m0tv7vzQGqs9pbcag8QT4DJXEjCviL6ODDEFhZD7kOfabfLqPl438tKnG2WBNSSaHg9iiVgvPt81wwDUeTtD/VwOGIuh5vE0rBYvAvKVlDb6a6KaQmy9ub4Xv2UDLZ4sIraPBQmcuSSvP+zoHsfqIoyLj5FdL64aiReLw/vOPiW/JLoExzwbAZd+ua1ggVVqTN4JUAqqOrbvTPqaFtXq+UtSi1q1GkJw+mmYhqSn9t0LmHESt1qtsB4fwu7A/TDUxrrlBhfFYYu37RXz3B7SPEyDVoY+KbmKFXyHRZAoMitHOYTkx+eDeUwd+YyHr2F1TKLrRl2fLhFlSw0Iz3pojNz+10iqvay23gm1Tm+hNKXqIqgSzf5OCeZzI1iuyXGZC2q+Q2CI3RiWo/UGuvxCrQ6s12MiNi73ySaHjp/3k=<enter><wait>",
    "set system login user eric authentication public-keys eric@eric-laptop2 type ssh-rsa<enter><wait>",
    "commit<enter><wait>",
    "save<enter><wait>"
  ]
  headless             = true
  boot_wait            = "3s"
  communicator         = "ssh"
  cpus                 = 2
  disk_size            = var.vyos_disk_size
  guest_additions_mode = "disable"
  iso_checksum         = var.vyos_iso_checksum
  iso_url              = var.vyos_iso_url
  memory               = var.vyos_ram_size
  output_directory     = var.vyos_output_directory
  output_filename      = var.vyos_output_filename
  shutdown_command     = "echo '${var.vyos_username}' | sudo -S -E shutdown -P now"
  ssh_username         = var.vyos_username
  ssh_password         = var.vyos_password
  ssh_timeout          = "4h"
  vm_name              = var.vyos_vm_name
  guest_os_type        = "Debian_64"
}

build {
  sources = ["source.virtualbox-iso.vyos"]

  provisioner "shell" {
    execute_command = "{{ .Vars }} sudo -S -E bash {{ .Path }}"
    script          = "${path.root}/cleanup.sh"
  }
}