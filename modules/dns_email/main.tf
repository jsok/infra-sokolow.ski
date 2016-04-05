resource "aws_route53_record" "mx" {
    name = "${var.domain}"
    records = ["${split(",", var.mx_records)}"]
    ttl = "172800"
    type = "MX"
    zone_id = "${var.zone_id}"
}

resource "aws_route53_record" "dkim" {
    name = "${var.domain}"
    records = ["${var.spf_record}"]
    ttl = "86400"
    type = "TXT"
    zone_id = "${var.zone_id}"
}

resource "aws_route53_record" "spf" {
    name = "${var.dkim_selector}_domainkey.${var.domain}"
    records = ["${var.dkim_record}"]
    ttl = "86400"
    type = "TXT"
    zone_id = "${var.zone_id}"
}
