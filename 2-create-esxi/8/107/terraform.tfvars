# Provider
vsphere_user = "administrator@vsphere.local"
vsphere_password = "VMware1!"
vsphere_server = "192.168.254.133"
host_to_installon = "192.168.254.107"
# Infrastructure
vsphere_datacenter = "lab"
vsphere_cluster = "c8"
vsphere_datastore = "nfs"
vsphere_folder = "/"

# MGMT network to connect first network adapter of the VM
mgt_network = "VM Network"
# Network to connect rest of the adapters. By default it will be trunked port group
iscsi_network1 = "iscsi"
workload_network = "trunk-vs0"
vmotion_network = "ss-vmotion-vlan1"
t0_network = "trunk-vs0"
# Guest
guest_vcpu = "28"
guest_memory = "50176"
guest_user = "root"
guest_password = "VMware1!"
# Disks for the guest. Disk0 is main drive, disk1 and disk2 for VSAN
guest_disk0_size = "80"
guest_dns = "192.168.18.1"
guest_ntp = "192.168.18.1"
guest_domain = "rubber.ducky"
# Guest_start_IP format includes first 3 octets of the address with "." .Last octet will be added in main program
guest_start_ip = "192.168.253."
guest_start_ip1 = "10.10.8."
guest_start_ip2 = "10.11.10."

guest_netmask = "255.255.0.0"
guest_netmask1 = "255.255.255.0"
guest_netmask2 = "255.255.255.0"
guest_gateway = "192.168.18.1"
                                      
