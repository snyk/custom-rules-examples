package rules

import data.lib
import data.lib.testing

test_CUSTOM_RULE_7 {
	# array containing test cases where the rule is allowed
	allowed_test_cases := [{
		"want_msgs": [],
		"fixture": "allowed.yaml",
	}]

	# array containing cases where the rule is denied
	denied_test_cases := [{
		"want_msgs": ["input.data"],
		"fixture": "denied.yaml",
	}]

	test_cases := array.concat(allowed_test_cases, denied_test_cases)
	testing.evaluate_test_cases("CUSTOM-RULE-7", "./rules/CUSTOM-RULE-7/fixtures", test_cases)
}
