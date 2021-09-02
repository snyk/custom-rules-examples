package rules

import data.lib
import data.lib.testing

test_CUSTOM_RULE_3 {
	# array containing test cases where the rule is allowed
	allowed_test_cases := [{
		"want_msgs": [],
		"fixture": "allowed.tf",
	}]
	# array containing cases where the rule is denied
	denied_test_cases := [{
		"want_msgs": ["input.resource.aws_redshift_cluster[denied1].tags"],
		"fixture": "denied1.tf",
	},{
		"want_msgs": ["input.resource.aws_redshift_cluster[denied2].tags"],
		"fixture": "denied2.tf",
	}]
	test_cases := array.concat(allowed_test_cases, denied_test_cases)
	testing.evaluate_test_cases("CUSTOM-RULE-3", "./rules/CUSTOM-RULE-3/fixtures", test_cases)
}
