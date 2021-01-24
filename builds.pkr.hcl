build {
  name = "ephemeral-ansible-agent"

  sources = [
    "source.virtualbox-iso.ansible"
  ]

  provisioner "shell-local" {
    inline = [
      "docker run --rm \\",
      format("%s \\", var.docker_mounted_volume),
      format("%s \\", var.docker_environment_variable),
      format("%s bash -c '", var.docker_image_name),
      format("git clone %s && ", var.git_url),
      format("cd %s && ", local.code_project_name),
      format("git checkout %s && ", var.git_code_version),
      "echo \"${build.SSHPrivateKey}\" > private_key.pem && ",
      "chmod 600 private_key.pem && ",
      "ansible-playbook --become --inventory=${build.Host}, --private-key=private_key.pem --extra-vars \"ansible_user=${build.User}\" playbook.yml'"
    ]
  }

  provisioner "shell" {
    inline = [
      "sudo rm -rf /root/.ssh /home/${build.User}/.ssh"
    ]
  }
}

build {
  name = "local-ansible-agent"

  sources = [
    "source.virtualbox-iso.ansible"
  ]

  provisioner "shell-local" {
    inline = [
      "echo \"${build.SSHPrivateKey}\" > private_key.pem",
      "chmod 600 private_key.pem"
    ]
  }

  provisioner "ansible" {
    extra_arguments = [
      "--become",
      "--private-key",
      "private_key.pem",
      "--extra-vars",
      "ansible_user=${build.User}"
    ]

    playbook_file = format("%s/playbook.yml", var.ansible_playbook_path)
  }

  provisioner "shell" {
    only = [
      "source.virtualbox-iso.ansible"
    ]

    inline = [
      "sudo rm -rf /root/.ssh /home/${build.User}/.ssh"
    ]
  }
}
