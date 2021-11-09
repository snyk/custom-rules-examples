package rules

sensitive_denylist := [
	"pass",
	"secret",
	"key",
	"token",
]

check_sensitive(keys, denylist) {
	keys[key]
	contains(key, denylist[_])
}

deny[msg] {
	input.kind == "ConfigMap"
	check_sensitive(input.data, sensitive_denylist)
	msg := {
		"publicId": "CUSTOM-RULE-7",
		"title": "ConfigMap exposes sensitive data",
		"severity": "high",
		"msg": "input.data",
		"issue": "",
		"impact": "",
		"remediation": "",
		"references": [],
	}
}
