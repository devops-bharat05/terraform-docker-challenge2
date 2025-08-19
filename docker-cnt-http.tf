resource "docker_container" "php-httpd" {
  name     = "webserver"
  image    = "php-httpd:challenge"
  hostname = "php-httpd"

  depends_on = [
    docker_image.php-httpd-image,
    docker_network.private_network
  ]

  networks_advanced {
    name = docker_network.private_network.name
  }

  ports {
    internal = 80
    external = 80
    ip       = "0.0.0.0"
  }

  labels {
    label = "challenge"
    value = "second"
  }
  volumes {
    host_path      = "/root/code/terraform-challenges/challenge2/lamp_stack/website_content/"
    container_path = "/var/www/html"
  }
}
