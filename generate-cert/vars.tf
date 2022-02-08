variable "password" {
  description = "pkcs12 password"
  type        = string
  default     = "123456789"
  sensitive   = true
}


variable "kv_name" {
  type    = string
  default = ""
}

variable "kv_rg" {
  type    = string
  default = ""
}

variable "kv_certname" {
  type    = string
  default = ""
}

variable "kv_secretname" {
  type    = string
  default = ""
}

variable "pfx_filename" {
  description = "Write PKCS12 File name"
  type        = string
  default     = ""
}

variable "ca_public_key_file_path" {
  description = "Write the PEM-encoded CA certificate public key to this path (e.g. /etc/tls/ca.crt.pem)."
  type        = string
  default     = ""
}

variable "public_key_file_path" {
  description = "Write the PEM-encoded certificate public key to this path (e.g. /etc/tls/my-app.crt.pem)."
  type        = string
  default     = ""
}

variable "private_key_file_path" {
  description = "Write the PEM-encoded certificate private key to this path (e.g. /etc/tls/my-app.key.pem)."
  type        = string
  default     = ""
}

variable "owner" {
  description = "The OS user who should be given ownership over the certificate files."
  type        = string
  default     = ""
}

variable "organization_name" {
  description = "The name of the organization to associate with the certificates (e.g. Acme Co)."
  type        = string
  default     = ""
}

variable "ca_common_name" {
  description = "The common name to use in the subject of the CA certificate (e.g. acme.co cert)."
  type        = string
  default     = ""
}

variable "common_name" {
  description = "The common name to use in the subject of the certificate (e.g. acme.co cert)."
  type        = string
  default     = ""
}


variable "dns_names" {
  description = "List of DNS names for which the certificate will be valid (e.g. foo.example.com)."
  type        = list(string)
}

variable "validity_period_hours" {
  description = "The number of hours after initial issuing that the certificate will become invalid."
  default     = "876000"
  type        = number
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "ca_allowed_uses" {
  description = "List of keywords from RFC5280 describing a use that is permitted for the CA certificate. For more info and the list of keywords, see https://www.terraform.io/docs/providers/tls/r/self_signed_cert.html#allowed_uses."
  type        = list(string)

  default = [
    "cert_signing",
    "key_encipherment",
    "digital_signature",
  ]
}

variable "allowed_uses" {
  description = "List of keywords from RFC5280 describing a use that is permitted for the issued certificate. For more info and the list of keywords, see https://www.terraform.io/docs/providers/tls/r/self_signed_cert.html#allowed_uses."
  type        = list(string)

  default = [
    "key_encipherment",
    "digital_signature",
  ]
}

variable "permissions" {
  description = "The Unix file permission to assign to the cert files (e.g. 0600)."
  default     = "0600"
  type        = number
}

variable "private_key_algorithm" {
  description = "The name of the algorithm to use for private keys. Must be one of: RSA or ECDSA."
  default     = "RSA"
  type        = string
}

variable "private_key_ecdsa_curve" {
  description = "The name of the elliptic curve to use. Should only be used if var.private_key_algorithm is ECDSA. Must be one of P224, P256, P384 or P521."
  default     = "P256"
  type        = string
}

variable "private_key_rsa_bits" {
  description = "The size of the generated RSA key in bits. Should only be used if var.private_key_algorithm is RSA."
  default     = "4096"
  type        = number
}
