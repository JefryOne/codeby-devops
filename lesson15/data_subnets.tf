data "yandex_vpc_network" "selected_vpc" {
  name = "VPS1"
}

data "yandex_vpc_subnet" "all_subnets" {
  for_each = data.yandex_vpc_network.selected_vpc.subnets
  id       = each.value.id
}

output "subnet_ids" {
  value = [for s in data.yandex_vpc_subnet.all_subnets : s.id]
}
