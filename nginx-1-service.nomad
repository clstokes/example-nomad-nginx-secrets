job "nginx" {
  datacenters = ["dc1"]
  type = "service"

  group "nginx" {
    count = 1

    task "nginx" {
      driver = "docker"

      config {
        image = "nginx"
        port_map {
          http = 80
        }
      }

      resources {
        cpu    = 500 # 500 MHz
        memory = 256 # 256MB
        network {
          mbits = 10
          port "http" {
            static = 8080
          }
        }
      }

      service {
        name = "nginx"
        tags = ["frontend"]
        port = "http"
        check {
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}
