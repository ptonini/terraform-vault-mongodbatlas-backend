resource "vault_mount" "this" {
  path    = var.path
  type    = var.type
}

resource "vault_mongodbatlas_secret_backend" "config" {
  mount        = vault_mount.this.path
  private_key  = var.private_key
  public_key   = var.public_key
}

