provider "null" {
  alias = "mock"
}

# Example of mocking an AWS resource with null_resource
resource "null_resource" "mock_batch_job_queue" {
  count = 1
  triggers = {
    always_run = timestamp()
  }
}

# You can replace AWS resources in modules with null_resource for testing without AWS credentials
