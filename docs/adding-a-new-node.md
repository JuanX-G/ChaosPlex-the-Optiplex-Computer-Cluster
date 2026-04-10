# Adding a New Node
1. Add the node `sudo wwctl node add <node-name> --hwaddr=<MAC addr of the node> --ipaddr=<ip-addr of the node> --container <container-name> --profile default --netname default --netdev <network interface name>` 
       - for Optiplex 9020 the name for the on-board NIC is 'enp3s0'
       - You must know the MAC address
       - You must decide a static IP for it
2. Add a DHCP reservation and restart DHCP service (do this in dhcpcd config)
       - Must include the proper interface name and MAC
3. Configure Warewulf to serve new files
4. Generate overlays `sudo wwctl overlay build <name of the new node>`
5. Again configure Warewulf to serve new files just to be sure
6. Restart Warewulfd

