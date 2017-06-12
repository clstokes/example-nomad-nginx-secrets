job "broken" {
  datacenters = ["dc1"]
  type = "service"

  group "broken" {
    count = 1

    task "broken" {
      driver = "docker"

      config {
        image = "nginx"
        port_map {
          http = 80
        }
      }

      resources {
        cpu    = 100 # 100 MHz
        memory = 128 # 128 MB
        network {
          mbits = 10
          port "http" {}
          port "broken" {}
        }
      }

      service {
        name = "broken"
        tags = ["frontend","urlprefix-/nginx strip=/nginx"]
        port = "broken"
        check {
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}
