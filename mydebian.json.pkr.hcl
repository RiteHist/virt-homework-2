source "yandex" "debian_docker" {
    disk_type = "network-hdd"
    disk_size_gb = 10
    folder_id = "b1g3ce2ml8s4bt24vm77"
    image_description = "debian with docker"
    image_name = "debian-11-docker"
    source_image_family = "debian-11"
    ssh_username = "RiteHist"
    subnet_id = "enpg2clfvlm3g7ouii35"
    token = "myass"
    use_ipv4_nat = true
    zone = "ru-central1-a"
    instance_cores = 2
    instance_core_fraction = 20
    instance_mem_gb = 1
    preemtible = true
    platform_id = "standard-v3"

}

build {
    sources = ["source.yandex.debian_docker"]

    provisioner "shell" {
        inline = [
            "sudo apt-get update",
            "sudo apt-get install ca-certificates curl",
            "sudo install -m 0755 -d /etc/apt/keyrings",
            "sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc",
            "sudo chmod a+r /etc/apt/keyrings/docker.asc",
            "echo \"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian  $(. /etc/os-release && echo \"$VERSION_CODENAME\") stable\" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null",
            "sudo apt-get update",
            "sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin",
            "sudo apt-get install -y htop tmux"
        ]
    }
}