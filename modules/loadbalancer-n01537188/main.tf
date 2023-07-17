resource "azurerm_public_ip" "loadbalancer-pip" {

  resource_group_name = var.rg-info.name
  location            = var.rg-info.location

  name = "${var.n01537188-loadbalancer-name}-pip"

  allocation_method = var.allocation_method
  tags              = var.tags
}

resource "azurerm_lb" "n01537188-loadbalancer" {
  resource_group_name = var.rg-info.name
  location            = var.rg-info.location

  name = var.n01537188-loadbalancer-name

  frontend_ip_configuration {
    name                 = "${var.n01537188-loadbalancer-name}-ipconfig"
    public_ip_address_id = azurerm_public_ip.loadbalancer-pip.id
  }
  tags = var.tags
}

resource "azurerm_lb_backend_address_pool" "loadbalancer-address_pool" {
  name            = "${var.n01537188-loadbalancer-name}-address_pool"
  loadbalancer_id = azurerm_lb.n01537188-loadbalancer.id
}

resource "azurerm_network_interface_backend_address_pool_association" "n01537188-loadbalancer-nic-backend_pool_association" {
  count                   = var.n01537188-loadbalancer-nic-backend_pool_association-info.count
  network_interface_id    = var.n01537188-loadbalancer-nic-backend_pool_association-info.nic-ids[count.index]
  backend_address_pool_id = azurerm_lb_backend_address_pool.loadbalancer-address_pool.id
  ip_configuration_name   = "${substr(var.n01537188-loadbalancer-nic-backend_pool_association-info.hostnames[0], 0, length(var.n01537188-loadbalancer-nic-backend_pool_association-info.hostnames[0]) - 2)}-ipconfig-${format("%d", count.index + 1)}"
}

resource "azurerm_lb_rule" "loadbalancer-rules" {
  loadbalancer_id                = azurerm_lb.n01537188-loadbalancer.id
  name                           = var.loadbalancer-rules.name
  protocol                       = var.loadbalancer-rules.protocol
  frontend_port                  = var.loadbalancer-rules.frontend_port
  backend_port                   = var.loadbalancer-rules.backend_port
  frontend_ip_configuration_name = "${var.n01537188-loadbalancer-name}-ipconfig"
}
