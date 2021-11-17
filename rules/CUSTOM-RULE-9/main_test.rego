package rules

import data.lib
import data.lib.testing

test_CUSTOM_RULE_9 {
	# array containing test cases where the rule is allowed
	allowed_test_cases := [{
		"want_msgs": [],
		"fixture": "allowed.tf",
	}]

	# array containing cases where the rule is denied
	denied_test_cases := [{
	# verifies that the correct msg is returned by the denied rule
		"want_msgs": [
		"input.resource.aws_iam_role[denied].tags",
		"input.resource.aws_iam_role[denied2].tags",
		"input.resource.aws_iam_role[denied3].tags",
		"input.resource.aws_iam_role[denied4].tags"],
		"fixture": "denied.tf",
	}]

	test_cases := array.concat(allowed_test_cases, denied_test_cases)
	testing.evaluate_test_cases("CUSTOM-RULE-9", "./rules/CUSTOM-RULE-9/fixtures", test_cases)
}
