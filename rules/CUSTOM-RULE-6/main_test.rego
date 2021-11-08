package rules

import data.lib
import data.lib.testing

test_CUSTOM_RULE_6 {
	# array containing test cases where the rule is allowed
	allowed_test_cases := [{
		"want_msgs": [],
		"fixture": "allowed.yaml",
	}]

	# array containing cases where the rule is denied
	denied_test_cases := [{
		"want_msgs": ["input.metadata.namespace"],
		"fixture": "denied.yaml",
	}]

	test_cases := array.concat(allowed_test_cases, denied_test_cases)
	testing.evaluate_test_cases("CUSTOM-RULE-6", "./rules/CUSTOM-RULE-6/fixtures", test_cases)
}
