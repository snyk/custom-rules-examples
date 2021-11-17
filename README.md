# Snyk IaC Custom Rules Examples

This repo contains example custom rules for Snyk IaC. They were generated using [snyk-iac-rules](https://github.com/snyk/snyk-iac-rules) and [OPA Policy Language](https://www.openpolicyagent.org/docs/latest/policy-language/). To understand more about the custom rules, read through the [public documentation](https://docs.snyk.io/products/snyk-infrastructure-as-code/custom-rules/getting-started-with-the-sdk/examples).

The prerequisites to using the rules in this repo are:
* Installing [snyk-iac-rules](https://github.com/snyk/snyk-iac-rules)
* Installing [snyk](https://github.com/snyk/snyk)
* Having Custom Rules enabled (for this, contact our team)

## Content

The example rules in this repo include:
1. [./rules/CUSTOM-RULE-1](https://docs.snyk.io/products/snyk-infrastructure-as-code/custom-rules/getting-started-with-the-sdk/examples#example-of-a-simple-boolean-rule): A simple boolean rule that checks if a Terraform `aws_redshift_cluster` has an `owner` tag
2. [./rules/CUSTOM-RULE-2](https://docs.snyk.io/products/snyk-infrastructure-as-code/custom-rules/getting-started-with-the-sdk/examples#example-with-logical-and): A rule using logical AND that checks if a Terraform `aws_redshift_cluster` has both an `owner` tag and a `description` tag
3. [./rules/CUSTOM-RULE-3](https://docs.snyk.io/products/snyk-infrastructure-as-code/custom-rules/getting-started-with-the-sdk/examples#example-with-logical-or): A rule using logical OR that checks if a Terraform `aws_redshift_cluster` has at least an `owner` tag or a `description` tag
4. [./rules/CUSTOM-RULE-4](https://docs.snyk.io/products/snyk-infrastructure-as-code/custom-rules/getting-started-with-the-sdk/examples#example-with-strings): A rule using strings that checks if a Terraform `aws_redshift_cluster` has at least an `owner` tag or a `description` tag and the `owner` tag does not belong to the `@corp-domain.com` domain
5. [./rules/CUSTOM-RULE-5](https://docs.snyk.io/products/snyk-infrastructure-as-code/custom-rules/getting-started-with-the-sdk/examples#example-with-xor): A rule using XOR that checks if a Terraform `aws_redshift_cluster` has either an `owner` tag or a `serviceDescription` tag, depending on the `type`
6. `./rules/CUSTOM-RULE-6`: A rule using grouped resources that checks if a Kubernetes RoleBinding configuration was defined on a set of namespaces configured in a denylist
7. [./rules/CUSTOM-RULE-7](https://docs.snyk.io/products/snyk-infrastructure-as-code/custom-rules/getting-started-with-the-sdk/examples#examples-with-grouped-resources): A rule using grouped resources that checks if a Kubernetes ConfigMap configuration contains keys located in a denylist
8. `./rules/CUSTOM-RULE-8`: A rule that flags up if an IAM Role is missing one of the required tags: `owner`, `description` or `type`
9. `./rules/CUSTOM-RULE-9`: A rule that flags up if a Vendor or Service does not have at least an `owneralternate` or a `ticketgroup` tag
10. `./rules/CUSTOM-RULE-10`: A rule that flags up if an IAM user is missing one of the required tags: `owner`, `description` or `type`

## Usage
The existing rules can be:
* tested using `snyk-iac-rules test`
* built into a bundle using `snyk-iac-rules build`
* verified locally using `snyk iac test --rules`
* pushed to an OCI registry using `snyk-iac-rules push`

An example workflow for adding a new rule would involve:
1. Templating the rule using `snyk-iac-rules template`
2. Filling in the rule logic using Policy Language
3. Testing the rules locally using `snyk-iac-rules test`
4. Building the rules locally and testing them with `snyk iac test --rules=bundle.tar.gz`
5. Opening a PR for a rule and letting the CI/CD run the tests, which block the PR from being merged if they fail
6. Merging the PR once the PR check passes
7. Waiting for the bundle to be published to an OCI registry
8. Configuring a separate repo to use `snyk` together with the custom rules in this repo by configuring the following environment variables:
```
export SNYK_CFG_OCI_REGISTRY_URL=<OCI registry url without a protocol>
export SNYK_CFG_OCI_REGISTRY_USERNAME=<OCI registry username>
export SNYK_CFG_OCI_REGISTRY_PASSWORD=<OCI registry password>
```

## CI/CD

There are two GitHub Actions configured for this repo:
* One that tests the rules when PRs are opened
* One that publishes the rules to an OCI registry when PRs are merged

The rules get published to a private DockerHub repository.

