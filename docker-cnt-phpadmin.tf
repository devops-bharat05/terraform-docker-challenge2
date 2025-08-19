
resource "docker_container" "phpmyadmin" {
  name     = "db_dashboard"
  image    = "phpmyadmin/phpmyadmin"
  hostname = "phpmyadmin"

  depends_on = [
    docker_network.private_network,
    docker_container.mariadb
  ]
 
  networks_advanced {
    name = docker_network.private_network.name
  }

  ports {
    internal = 80
    external = 8081
    ip       = "0.0.0.0"
  }

  labels {
    label = "challenge"
    value = "second"
  }
 # 🔹 Establish link between phpmyadmin and mariadb
  links = [docker_container.mariadb.name]
  
    env = [
    "PMA_HOST=db",   # phpMyAdmin will connect to "db"
    "PMA_PORT=3306"
  ]

}
