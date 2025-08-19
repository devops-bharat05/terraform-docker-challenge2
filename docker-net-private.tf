resource "docker_network" "private_network" {
  name = "my_network"
  attachable = true
  # User-defined key/value metadata (labels)
  labels {
    label = "challenge"
    value = "second"
  }
}
