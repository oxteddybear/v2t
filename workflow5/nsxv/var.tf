
variable "vsphere_server"     {  description = "Parent vCenter FQDN/IP " }
variable "vsphere_user"       {  description = "vSphere username" }
variable "vsphere_password"   {  description = "vSphere password" }
variable "vsphere_datacenter" {  description = "vSphere datacenter" }
variable "compute_cluster"    {  description = "Compute cluster name"}
variable "esxi_user"          {  description = "esxi root user"}
variable "esxi_password"      {  description = "esxi root password"}
variable "vds1_name"          {  description = "VDS Name"}
variable "vds1_mtu"           {  description = "VDS MTU"}
variable "vds2_name"          {  description = "VDS Name"}
variable "vds2_mtu"           {  description = "VDS MTU"}

variable "addhost" { ### how many nested esxi you want? put here
  default = {
   name = [
      "192.168.8.101",
      "192.168.8.102"
    ]
  }
}

variable "pg1" { # put all the portgroups for the mgtvds here: <portgroup-name> = <vlanid>
  default = {
   "dpg-vdsmgt-mgt" = 0
  }
}

variable "mgt_vmnic"  {  default = ["vmnic1"] }
variable "data_vmnic" {  default = ["vmnic4"] }

