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
    - Use `netplan status` to figure out the `renderer` in the Netplan file.
- To spin up VMs
    - GUI: `sudo virt-manager`
        - Create a dir where ISOs will be stored.
        - Create a dir where all VM storage files (e.g.: `*.qcow2` files) will
          be stored.
        - Create a new volume in the VM storage directory.
        - Choose the bridge network newly added to `sudo virsh net-list`.
    - CLI: `sudo virt-install`
