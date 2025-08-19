!#/bin/bash

echo -e "install HashiCorp's Debian package repository.\n"
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

echo -e "Install HashiCorp's GPG key.\n"
wget -O- https://apt.releases.hashicorp.com/gpg | \gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

echo -e "Verify the GPG key's fingerprint.\n"
gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint


echo -e "Add the official HashiCorp repository to your system. \n"
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

echo -e "Update apt to download the package information from the HashiCorp repository. \n"
sudo apt update

echo -e "Install Terraform from the new repository. \n"
sudo apt-get install terraform=1.1.5
