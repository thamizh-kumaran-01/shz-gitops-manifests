terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}

resource "null_resource" "k3d_cluster" {
  provisioner "local-exec" {
    command = "k3d cluster create zero-trust-platform --agents 0 || true"
  }
}
