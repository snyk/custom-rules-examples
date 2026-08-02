package rules

deny[msg] {
    resource := input.resource.aws_redshift_cluster[name]
    not resource.tags.owner
	
    msg := {
        "publicId": "my_rule",
        "title": "Missing an owner from tag",
        "severity": "medium",
        "msg": sprintf("input.resource.aws_redshift_cluster[%s].tags", [name]),
        "issue": "",
        "impact": "",
        "remediation": "",
        "references": [],
    }
}
