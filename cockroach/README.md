# Paul Vickers
# pmv6497@rit.edu

This is a tool meant to give us persistent access to the machine.
However, this tool requires that you have access to the machine and is meant to be used
in a prebake or if we get access in some other way, shape or form.

The setup is very simple and requires a few easy steps:


Step #1

The first thing you want to go ahead and do is run 'ssh-keygen' on
your local host and then copy and paste that public key (.ssh/id_rsa.pub)
into the sshkey file in the repository. This will be the key we 
install in our target's .ssh/authorized_keys file to give us
key-based SSH access to the machine.

Step #2

The next step in the process is to zip your folder with your new sshkey file included,
and then move that over to the target's home directory of a user with sudo permissions.
This can be done with a few different methods, which is your discretion. I used
scp <file> <hostname>@<ip>:<homedirectory>

Step #3

Go onto the target host and unzip the folder, and move all of its contents (the 3
main files: cockroach.sh, sshkey, and sshd_config) into the user's home directory.
This is crucial as some of the paths in the script only work if it is ran from
their home directory. 

Step #4

Run the program with 'sudo bash cockroach.sh'
When the program is running, you will be prompted twice, once for setting the password
on your newly created account and then a second time for cronjobs. I personally plan
to implement cronjobs to stop the services running on the box, and may do some other
cool things too like wipe iptables rules every now and then.

Bada-bing bada-boom, you should now be able to SSH into the root and the specific
user's accounts, and you also have the option to SSH into the newly created account.
