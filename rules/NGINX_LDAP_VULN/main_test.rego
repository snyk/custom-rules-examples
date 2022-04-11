package rules

import data.lib
import data.lib.testing

test_NGINX_LDAP_VULN {
	# array containing test cases where the rule is allowed
	test_cases := [{
		"want_msgs": ["input.spec.template.spec.container[1]"],
		"fixture": "ldap-enabled.yaml",
	},
    {
		"want_msgs": [],
		"fixture": "ldap-disabled.yaml",
	}]

	testing.evaluate_test_cases("NGINX_LDAP_VULN", "./rules/NGINX_LDAP_VULN/fixtures", test_cases)
}
