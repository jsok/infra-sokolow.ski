variable "zone_id" {
    description = "Route53 Hosted Zone ID"
}

variable "domain" {
    description = "Domain name email records are being created for"
}

variable "mx_records" {
    description = "Comma-separate list of MX records, including priority, e.g. '10 mx1.example.com, 20 mx2.example.com'"
}

variable "dkim_selector" {
    default = ""
    description = "DKIM selector (optional)"
}

variable "dkim_record" {
    description = "DKIM record value, e.g. 'v=DKIM1; k=rsa; etc...'"
}

variable "spf_record" {
    description = "SPF record value, e.g. 'v=spf1 etc...'"
}
