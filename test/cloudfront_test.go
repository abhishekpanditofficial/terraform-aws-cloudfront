package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformCloudfrontExample(t *testing.T) {
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/cloudfront",
		Vars: map[string]interface{}{
			"Client":"test",
			"primary_bucket_name": "test-primary-terraform",
			"failover_bucket_name": "test-failover-terraform",
			"logging_bucket_name": "test-logging-bucket-testproject",
			"domain_name": "test.domain.com",
			"acl_name": "test-acl",
			"acl_description": "test-acl-description",
			"metric_name": "test-metric-name",		
		},
	})

	terraform.InitAndApply(t, terraformOptions)

	defer terraform.Destroy(t, terraformOptions)

	// Primary S3 Test
	primaryBucket := terraform.Output(t, terraformOptions, "primary_bucket_id")
	assert.Equal(t, "test-primary-terraform", primaryBucket)

	// Failover S3 Test
	failoverBucket := terraform.Output(t, terraformOptions, "failover_bucket_id")
	assert.Equal(t, "test-failover-terraform", failoverBucket)	
	
	// Logging S3 Test
	loggingBucket := terraform.Output(t, terraformOptions, "primary_bucket_id")
	assert.Equal(t, "test-logging-bucket-testproject", loggingBucket)

	// ACM Certificate Test
	acmOutput := terraform.Output(t, terraformOptions, "domain_name")
	assert.Equal(t, "test.domain.com", acmOutput)

	// WAF Web-Acl Test
	wafOutput := terraform.Output(t, terraformOptions, "acl_name")
	assert.Equal(t, "test-acl", wafOutput)

	// Cloudfront Test
	cloudfrontOutput := terraform.Output(t, terraformOptions, "cloudfront_domain_name")
	assert.NotNil(t, cloudfrontOutput)

}