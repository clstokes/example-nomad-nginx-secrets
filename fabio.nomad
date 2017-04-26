job "fabio" {
  datacenters = ["us-west-1"]
  type = "system"

  group "fabio" {
    count = 1

    task "fabio" {
      driver = "raw_exec"

      artifact {
        source = "https://github.com/fabiolb/fabio/releases/download/v1.4.3/fabio-1.4.3-go1.8.1-linux_amd64"
      }

      config {
        command = "fabio-1.4.3-go1.8.1-linux_amd64"
      }

      resources {
        cpu    = 100 # 500 MHz
        memory = 128 # 256MB
        network {
          mbits = 10
          port "http" {
            static = 9999
          }
          port "admin" {
            static = 9998
          }
        }
      }

    }
  }
}
