package rules

checkUserTag(resource){
    not resource.tags.email
}

checkUserTag(resource){
    resource.tags.serviceDescription
}

checkServiceTag(resource){
    not resource.tags.serviceDescription
}

checkServiceTag(resource){
    resource.tags.email
}

checkTags(resource){
	count(resource.tags) == 0
}

checkTags(resource) {
    resource.tags.type == "user"
    checkUserTag(resource)
} else {
    resource.tags.type == "service"
    checkServiceTag(resource)
}

deny[msg] {
    resource := input.resource.aws_redshift_cluster[name]
	checkTags(resource)
    msg := {
        "publicId": "CUSTOM-RULE-5",
        "title": "Missing the right tags from for a resource of type user or service",
        "severity": "medium",
        "msg": sprintf("input.resource.aws_redshift_cluster[%v].tags", [name]),
        "issue": "",
        "impact": "",
        "remediation": "",
        "references": [],
    }
}
