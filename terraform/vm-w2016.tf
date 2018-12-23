# resource "vsphere_virtual_machine" "vm" {
#   name                        = "terraform-windows-2016"
#   resource_pool_id            = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
#   datastore_id                = "${data.vsphere_datastore.datastore.id}"
#   num_cpus                    = 2
#   memory                      = 1024
#   guest_id                    = "${data.vsphere_virtual_machine.template.guest_id}"
#   scsi_type                   = "${data.vsphere_virtual_machine.template.scsi_type}"
#   wait_for_guest_net_timeout  = 0
#   wait_for_guest_net_routable = false
#   network_interface {
#     network_id   = "${data.vsphere_network.network.id}"
#     adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
#   }
#   disk {
#     label            = "disk0"
#     size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
#     eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
#     thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
#   }
#   clone {
#     template_uuid = "${data.vsphere_virtual_machine.template.id}"
#     customize {
#       windows_options {
#         computer_name = "tfw2016"
#         time_zone     = "255"
#       }
#       network_interface {}
#     }
#   }
# }

