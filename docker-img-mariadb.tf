resource "docker_image" "mariadb-image" {
  name = "mariadb:challenge"

  build {
    path = "./lamp_stack/custom_db"  # instead of "context"
    label = {                        # singular "label", not "labels"
      project = "lamp_stack"
      app     = "php-httpd"
      challenge= "second"
    }
  }
}
