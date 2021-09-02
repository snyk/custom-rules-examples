package rules

import data.lib
import data.lib.testing

test_CUSTOM_RULE_4 {
	# array containing test cases where the rule is allowed
	allowed_test_cases := [{
		"want_msgs": [],
		"fixture": "allowed.tf",
	}]
	# array containing cases where the rule is denied
	denied_test_cases := [{
		"want_msgs": ["input.resource.aws_redshift_cluster[denied].tags"],
		"fixture": "denied.tf",
	}]
	test_cases := array.concat(allowed_test_cases, denied_test_cases)
	testing.evaluate_test_cases("CUSTOM-RULE-4", "./rules/CUSTOM-RULE-4/fixtures", test_cases)
}
