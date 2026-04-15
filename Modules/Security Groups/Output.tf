output "sg_id" {
  value       = aws_security_group.web_sg.id
  description = "The ID of the created security group"
}

