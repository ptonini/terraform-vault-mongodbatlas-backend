module "vault_mount" {
  source = "ptonini/mount/vault"
  version = "~> 1.0.0"
  path = "mongodbatlas"
  type = "mongodbatlas"
}

resource "vault_generic_endpoint" "config" {
  count = var.config == null ? 0 : 1
  depends_on = [
    module.vault_mount.this
  ]
  path = "${module.vault_mount.this.path}/config"
  ignore_absent_fields = true
  data_json = jsonencode(var.config)
}
