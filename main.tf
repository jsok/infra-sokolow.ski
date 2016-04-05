variable "region" {}
variable "domain" {}
variable "mx_records" {}
variable "dkim_selector" { default = "" }
variable "dkim_record" {}
variable "spf_record" {}

resource "terraform_remote_state" "s3" {
    backend = "s3"
    config {
        bucket = "terraform.${var.domain}"
        key = "terraform.tfstate"
        region = "${var.region}"
    }
}

provider "aws" {
    region = "${var.region}"
}

resource "aws_route53_zone" "zone" {
    name = "${var.domain}"
    comment = "${var.domain} - managed by Terraform"
}

resource "aws_route53_record" "mx" {
    name = "${var.domain}"
    records = ["${split(",", var.mx_records)}"]
    ttl = "172800"
    type = "MX"
    zone_id = "${aws_route53_zone.zone.zone_id}"
}

resource "aws_route53_record" "dkim" {
    name = "${var.domain}"
    records = ["${var.spf_record}"]
    ttl = "86400"
    type = "TXT"
    zone_id = "${aws_route53_zone.zone.zone_id}"
}

resource "aws_route53_record" "spf" {
    name = "${var.dkim_selector}_domainkey.${var.domain}"
    records = ["${var.dkim_record}"]
    ttl = "86400"
    type = "TXT"
    zone_id = "${aws_route53_zone.zone.zone_id}"
}
