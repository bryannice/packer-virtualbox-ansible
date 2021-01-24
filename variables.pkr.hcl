variable "ansible_playbook_path" {
  default = ""
  description = "Ansible playbook path."
  type = string
}

variable "docker_environment_variable" {
  default = ""
  description = "Environment variable used by docker. Format is '--env COOL_VAR1=VALUE1 --env COOL_VAR2=VALUE2'"
  type = string
}

variable "docker_image_name" {
  default = ""
  description = "Docker image with the Ansible runtime environment."
  type = string
}

variable "docker_mounted_volume" {
  default = ""
  description = "Mount volumes needed to support the Ansible playbook process."
  type = string
}

variable "git_code_version" {
  default = "master"
  description = "Code version to use (branch or tag)."
  type = string
}

variable "git_url" {
  default = ""
  description = "Git repo"
  type = string
}

variable "guest_os_type" {
  default = "Debian_64"
  description = "The guest OS type being installed."
  type = string
}

variable "image_cpus" {
  default = "4"
  type = string
}

variable "image_disk_size" {
  default = "51200"
  description = "Image disk size where the number value represents MB."
  type = string
}

variable "image_description" {
  default = "Image Built By Packer"
  type = string
}

variable "image_memory" {
  default = "8192"
  type = string
}

variable "image_name" {
  default = "packer"
  type = string
}

variable "image_version" {
  default = "0.0.0"
  type = string
}

variable "iso_checksum" {
  default = "b317d87b0a3d5b568f48a92dcabfc4bc51fe58d9f67ca13b013f1b8329d1306d"
  description = "The checksum for the ISO file or virtual hard drive file."
  type = string
}

variable "iso_url" {
  default = "https://cdimage.debian.org/cdimage/release/10.7.0/amd64/iso-cd/debian-10.7.0-amd64-netinst.iso"
  description = "A URL to the ISO containing the installation image or virtual hard drive (VHD or VHDX) file to clone."
  type = string
}

variable "os_name" {
  default = "debian-10.7"
  description = "The OS name the packer build process create image from."
  type = string
}

variable "os_family" {
  default = "debian"
  description = "OS family of the system."
  type = string
}

variable "ssh_password" {
  default = "vagrant"
  description = "Password to use"
  type = string
}

variable "ssh_port" {
  default = 22
  description = "The port to connect to SSH. This defaults to 22."
}

variable "ssh_username" {
  default = "vagrant"
  description = "Username to use"
  type = string
}
