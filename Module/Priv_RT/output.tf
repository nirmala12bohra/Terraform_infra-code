
output "priv_route_table" {
value = aws_route_table.private_route_table.id
}

output "priv_route_association" {
value = aws_route_table_association.rt_priv_sub_association[*].id 
}



