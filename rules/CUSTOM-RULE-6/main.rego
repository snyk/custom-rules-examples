package rules

namespace_denylist = [
	"kube-system",
	"default",
]

check_namespace(namespace, denylist) {
	namespace == denylist[_]
}

deny[msg] {
	input.kind == "RoleBinding"
	check_namespace(input.metadata.namespace, namespace_denylist)
	msg := {
		"publicId": "CUSTOM-RULE-6",
		"title": "Role grants permissions to system reserved namespace",
		"severity": "medium",
		"msg": "input.metadata.namespace",
		"issue": "",
		"impact": "",
		"remediation": "",
		"references": [],
	}
}
