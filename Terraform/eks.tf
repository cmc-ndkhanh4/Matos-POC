resource "aws_eks_cluster" "eks_cluster" {
  name     = "${var.cluster_name}"
  role_arn = aws_iam_role.AWSEKSAssumeRole.arn

  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  vpc_config {
    endpoint_private_access = false
    endpoint_public_access = true

    subnet_ids = [
      aws_subnet.PublicSubnet1a.id, 
      aws_subnet.PublicSubnet1b.id,
      aws_subnet.PrivateSubnet1a.id, 
      aws_subnet.PrivateSubnet1b.id
    ]
  }

  version = "1.22"

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    # aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
    aws_cloudwatch_log_group.eks_logger,
  ]
}

resource "aws_eks_node_group" "NodeGroup" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "node_group"
  node_role_arn   = aws_iam_role.NodeGroupRole.arn
  subnet_ids      = [
    aws_subnet.PrivateSubnet1a.id, 
    aws_subnet.PrivateSubnet1b.id
  ]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  ami_type = "AL2_x86_64"

  capacity_type = "ON_DEMAND"

  disk_size = 20

  instance_types = ["t2.micro"]

  labels = {
    role = "nodes-general"
  }

  version = "1.22"

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
}
