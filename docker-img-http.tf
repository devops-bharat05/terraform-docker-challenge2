resource "docker_image" "php-httpd-image" {
  name = "php-httpd:challenge"

  build {
    path = "./lamp_stack/php_httpd"  # instead of "context"
    label = {                        # singular "label", not "labels"
      project = "lamp_stack"
      app     = "php-httpd"
      challenge = "second"
    }
  }
}
