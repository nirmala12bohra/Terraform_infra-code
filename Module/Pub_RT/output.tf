
output "pub_route_table" {
value = aws_route_table.public_route_table.id
}

output "pub_route_association" {
value = aws_route_table_association.rt_pub_sub_association.id
}










