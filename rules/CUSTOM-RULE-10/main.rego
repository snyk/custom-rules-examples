package rules

aws_iam_user_tags_missing(resource) {
    not resource.tags.owner
}

aws_iam_user_tags_missing(resource) {
    not resource.tags.description
}

aws_iam_user_tags_missing(resource) {
    not resource.tags.type
}

deny[msg] {
    resource := input.resource.aws_iam_user[name]
    aws_iam_user_tags_missing(resource)

	msg := {
		"publicId": "CUSTOM-RULE-10",
		"title": "IAM user missing one of the required tags: owner, description or type",
		"severity": "medium",
		"msg": sprintf("input.resource.aws_iam_user[%s].tags", [name]),
		"issue": "",
		"impact": "",
		"remediation": "",
		"references": [],
	}
}
