data "template_file" "internal_config" {
  template = file("${path.module}/internal-config.yaml")
  vars = {
    s3_bucket_name   = var.s3_bucket_name
    host_bashrc      = filebase64("${path.module}/bashrc")
    host_inputrc     = filebase64("${path.module}/inputrc")
    host_aliases     = filebase64("${path.module}/bash_aliases")
    sshd_config      = filebase64("${path.module}/../../common/sshd_config")
    pamd_sshd_config = filebase64("${path.module}/../../common/pamd_sshd_config")
  }
}
