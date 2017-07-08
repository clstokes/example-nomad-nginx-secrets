data_dir = "/Users/clstokes/cc/clstokes/example-nomad-nginx-secrets/nomad_data"

vault {
  enabled          = true
  address          = "http://localhost:8200"
  tls_skip_verify = true
}

server {
  enabled          = true
  bootstrap_expect = 1
}

client {
  enabled       = true
}
