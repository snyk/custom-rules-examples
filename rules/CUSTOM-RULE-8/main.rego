package rules

# https://play.openpolicyagent.org/p/WCtwl349bQ

aws_iam_role_tags_missing(resource) {
    not resource.tags.owner
}

aws_iam_role_tags_missing(resource) {
    not resource.tags.description
}

aws_iam_role_tags_missing(resource) {
    not resource.tags.type
}

deny[msg] {
    resource := input.resource.aws_iam_role[name]
    aws_iam_role_tags_missing(resource)

	msg := {
		"publicId": "CUSTOM-RULE-8",
		"title": "IAM Role missing one of the required tags: owner, description or type",
		"severity": "medium",
		"msg": sprintf("input.resource.aws_iam_role[%s].tags", [name]),
		"issue": "",
		"impact": "",
		"remediation": "",
		"references": [],
	}
}
