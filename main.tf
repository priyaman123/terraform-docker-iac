terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

# Pull Nginx image
resource "docker_image" "nginx_image" {
  name = "nginx:latest"
  keep_locally = false
}

# Create container
resource "docker_container" "nginx_container" {
  image = docker_image.nginx_image.name
  name  = "my_nginx"
  ports {
    internal = 80
    external = 8081
  }
}