resource "aws_cloudwatch_log_group" "eks_logger" {
  name = "/aws/eks/${var.cluster_name}/cluster"

  tags = {
    Application = "eks_cluster_logger"
  }
}