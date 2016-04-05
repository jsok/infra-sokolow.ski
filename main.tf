resource "terraform_remote_state" "s3" {
    backend = "s3"
    config {
        bucket = "terraform.${var.domain}"
        key = "terraform.tfstate"
        region = "${var.region}"
    }
}

provider "aws" {}

resource "aws_route53_zone" "zone" {
    name = "${var.domain}"
    comment = "${var.domain} - managed by Terraform"
}

module "dns_email" {
    source = "./modules/dns_email"
    domain = "${var.domain}"
    zone_id = "${aws_route53_zone.zone.zone_id}"
    mx_records = "${var.fastmail_mx_records}"
    dkim_selector = "${var.fastmail_dkim_selector}"
    dkim_record = "${var.fastmail_dkim_record}"
    spf_record = "${var.fastmail_spf_record}"
}
