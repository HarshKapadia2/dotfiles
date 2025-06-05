# KVM/QEMU

[All about KVM and QEMU](https://linux.harshkapadia.me/kvm-qemu)

## Setup

- Run the [`install`](install) script **without** `sudo` permissions. The script
  will prompt the user for the `sudo` password when required.

    ```bash
    $ ./install

    # OR

    $ ./install --force # To force the install even if KVM already exists
    ```

- To operate KVM in bridged mode so that VMs get their own IP addresses and are
  not NATted, follow [Setting up KVM virtual machines using a bridge network on an Ubuntu host](https://www.dzombak.com/blog/2024/02/setting-up-kvm-virtual-machines-using-a-bridged-network).
    - Use a Netplan similar to the one in [`sample-netplan.yaml`](sample-netplan.yaml).
- To spin up VMs (Rough instructions)
    - GUI: `sudo virt-manager`
        - Might have to copy `~/.Xauthority` to `/root` to get X11 Forwarding to
          work
        - Create a dir where ISOs will be stored.
        - Create a dir where all VM storage files (e.g.: `*.qcow2` files) will
          be stored.
        - Create a new volume in the VM storage directory.
        - Choose the bridge network newly added to `sudo virsh net-list`.
        - To add a secondary bridge
            - NOTE: It doesn't need to have an IP configured or
              a DHCP server on the network for it to be created in the host and
              attached to a VM.)
            - Create the bridge using the instructions in the article linked
              above (`virsh net-define path/to/bridge-file.xml`).
            - Create a VM with the primary bridge and add this secondary bridge
              later using the link below.
            - Use [How to add an additional network interface on a KVM vm?](https://unix.stackexchange.com/a/671997)
                - The `sudo virsh edit <vm_name>` method in the link above.
    - CLI: `sudo virt-install`
        - `virt-builder` can be used to prepare ISOs.

## Known Issues

- In case 'Display output is not active' errors don't go away, switching the
  video driver from 'Virtio' to 'VGA' might help.
    - Very easy to do this through `virt-manager`
        - Open up a VM, click on the blue 'i' button at the top and go to the
          'Video' section.
