variable "region" {
    default = "ap-southeast-2"
    description = "AWS region"
}

variable "domain" {}

# Fastmail
variable "fastmail_mx_records" {}
variable "fastmail_dkim_selector" {}
variable "fastmail_dkim_record" {}
variable "fastmail_spf_record" {}
