resource "vsphere_virtual_machine" "vm" {
  name             = "terraform-test"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus                    = 2
  memory                      = 2048
  guest_id                    = "${data.vsphere_virtual_machine.template.guest_id}"
  wait_for_guest_net_timeout  = 0
  wait_for_guest_net_routable = false


  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  disk {
    label            = "disk0"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "tfel7"
        domain    = "test.alaqsa.edu.ps"
        time_zone = "Asia/Gaza"
      }

      network_interface {}
    }
  }
}
