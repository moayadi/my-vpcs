output "size" {
  value = "${lookup(var.configuration, var.environment).size}"
}
