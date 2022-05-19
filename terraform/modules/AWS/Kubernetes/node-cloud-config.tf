data "template_file" "node_cloud_config" {
  count    = var.number_of_cluster_instances
  template = file("${path.module}/node-cloud-config.yaml")
  vars = {
    hostname         = "k8s-node-${count.index}"
    s3_bucket_name   = var.s3_bucket_name
    node_bashrc      = filebase64("${path.module}/bashrc")
    node_inputrc     = filebase64("${path.module}/inputrc")
    node_aliases     = filebase64("${path.module}/bash_aliases")
    sshd_config      = filebase64("${path.module}/../../common/sshd_config")
    pamd_sshd_config = filebase64("${path.module}/../../common/pamd_sshd_config")
    version          = var.kubernetes_version
  }
}
