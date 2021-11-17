package rules

# https://play.openpolicyagent.org/p/nf3vZCmgKs

checkTags(resource) {
    not resource.tags.owner
}

checkTags(resource) {
    not resource.tags.description
}

checkTags(resource) {
    not resource.tags.type
}

checkServiceOrVendorTag(resource){
    resource.tags.type == "Service"
    not resource.tags.ticketgroup
    not resource.tags.owneralternate
}

checkServiceOrVendorTag(resource){
    resource.tags.type == "Vendor"
        not resource.tags.ticketgroup
        not resource.tags.owneralternate
}

checkTags(resource){
    count(resource.tags) == 0
}

checkTags(resource) {
    not resource.tags.type == "User"
    checkServiceOrVendorTag(resource)
}

deny[msg] {
    resource := input.resource.aws_iam_role[name]
    checkTags(resource)

	msg := {
		"publicId": "CUSTOM-RULE-9",
		"title": "Vendor or Service must have either owneralternate or ticketgroup or both tags.",
		"severity": "medium",
		"msg": sprintf("input.resource.aws_iam_role[%s].tags", [name]),
		"issue": "",
		"impact": "",
		"remediation": "",
		"references": [],
	}
}
