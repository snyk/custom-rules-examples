package rules

deny[msg] {
	input.kind == "Deployment"
    startswith(input.metadata.labels["helm.sh/chart"], "nginx-9")
    container := input.spec.template.spec.containers[container_id]
    container.name == "ldap-daemon"
	msg := {
		# Mandatory fields
		"publicId": "NGINX_LDAP_VULN",
		"title": "NGINX LDAP 0Day",
		"severity": "high",
		"msg": sprintf("input.spec.template.spec.container[%d]", [container_id]), # must be the JSON path to the resource field that triggered the deny rule
		# Optional fields
		"issue": "",
		"impact": "",
		"remediation": "Set `values.ldapDaemon.enabled` to `false`",
		"references": [],
	}
}
