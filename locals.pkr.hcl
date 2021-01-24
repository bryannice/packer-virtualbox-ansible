locals {
  boot_commands = {
    redhat = [
      "<tab> text ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/kickstart-centos.cfg<enter><wait>"
    ]
    debian =  [
      "<esc><wait>",
      "install <wait>",
      "preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed-debian.cfg <wait>",
      "debian-installer=en_US.UTF-8 <wait>",
      "auto <wait>",
      "locale=en_US.UTF-8 <wait>",
      "kbd-chooser/method=us <wait>",
      "keyboard-configuration/xkb-keymap=us <wait>",
      "netcfg/get_hostname={{ .Name }} <wait>",
      "netcfg/get_domain=vagrantup.com <wait>",
      "fb=false <wait>",
      "debconf/frontend=noninteractive <wait>",
      "console-setup/ask_detect=false <wait>",
      "console-keymaps-at/keymap=us <wait>",
      "grub-installer/bootdev=/dev/sda <wait>",
      "<enter><wait>"
    ]
  }
  boot_wait  = "10s"
  build_ts = formatdate("YYYY-MM-DD-hh-mm-ss", timestamp())
  code_project_name = split(".",basename(var.git_url))[0]
  communicator = "ssh"
  cpus = var.image_cpus
  disk_size = var.image_disk_size
  export_opts = [
    "--manifest",
    "--vsys",
    "0",
    "--description",
    var.image_description,
    "--version",
    var.image_version,
    "--ovf10"
  ]
  headless = false
  http_directory = "http"
  memory = var.image_memory
  output_directory = format("%s-%s","output-iso", local.build_ts)
  shutdown_command = format("echo '%s' | sudo -S shutdown -hP now", var.ssh_username)
  ssh_timeout = "2h"
  vboxmanage = [
    [
      "modifyvm",
      "{{.Name}}",
      "--memory",
      var.image_memory
    ],
    [
      "modifyvm",
      "{{.Name}}",
      "--cpus",
      var.image_cpus
    ],
    [
      "modifyvm",
      "{{.Name}}",
      "--vram",
      "12"
    ],
    [
      "modifyvm",
      "{{.Name}}",
      "--natpf1",
      "SSH,tcp,127.0.0.1,2222,,22"
    ]
  ]
  vm_name = format("%s-%s-%s", var.os_name, var.image_name, var.image_version)
}