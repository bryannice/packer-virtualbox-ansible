source "virtualbox-iso" "ansible" {
  boot_command = lookup(local.boot_commands, os_family, [])
  boot_wait = local.boot_wait
  communicator = local.communicator
  cpus = local.cpus
  disk_size = local.disk_size
  export_opts = local.export_opts
  format = "ova"
  guest_additions_path = "VBoxGuestAdditions_{{.Version}}.iso"
  guest_os_type = var.guest_os_type
  headless = local.headless
  http_directory = local.http_directory
  iso_checksum = var.iso_checksum
  iso_url = var.iso_url
  memory = local.memory
  output_directory = format("%s-%s-%s","output-virtualbox-iso",local.vm_name,local.build_ts)
  shutdown_command = local.shutdown_command
  ssh_password = var.ssh_password
  ssh_port = var.ssh_port
  ssh_timeout = local.ssh_timeout
  ssh_username = var.ssh_username
  vboxmanage = local.vboxmanage
  vm_name = local.vm_name
}