# Provider
vsphere_user = "administrator@vsphere.local"
vsphere_password = "VMware1!"
vsphere_server = "192.168.254.133"
host_to_installon = "192.168.254.108"
# Infrastructure
vsphere_datacenter = "dc1"
vsphere_cluster = "c1"
vsphere_datastore = "iscsi108"
vsphere_folder = "/"

# MGMT network to connect first network adapter of the VM
mgt_network = "VM Network"
# Network to connect rest of the adapters. By default it will be trunked port group
iscsi_network1 = "10.10.9.0"
workload_network = "isolated-trunk"
vmotion_network = "10.10.8.0"
# Guest
guest_vcpu = "8"
guest_memory = "16384"
guest_user = "root"
guest_password = "VMware1!"
# Disks for the guest. Disk0 is main drive, disk1 and disk2 for VSAN
guest_disk0_size = "8"
guest_dns = "192.168.254.123"
guest_ntp = "time.google.com"
guest_domain = "rubber.ducky"
# Guest_start_IP format includes first 3 octets of the address with "." .Last octet will be added in main program
guest_start_ip = "192.168.8."
guest_start_ip1 = "10.10.9."
guest_start_ip2 = "10.10.8."

guest_netmask = "255.255.0.0"
guest_netmask1 = "255.255.255.0"
guest_netmask2 = "255.255.255.0"
guest_gateway = "192.168.254.254"
                                      
