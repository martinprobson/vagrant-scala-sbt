Vagrant Scala SBT Environment
=============================

# Introduction

Vagrant project to spin up a single virtual machine with:

* Java 8
* Scala sbt
* vim

# Getting Started

1. Download and install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and/or [Docker](https://www.docker.com/)
2. Download and install [Vagrant](http://www.vagrantup.com/downloads.html).
3. Clone this repo.
4. Check the `scripts/versions.sh` file for the versions of the components.
6. In your terminal change your directory into the project directory (i.e. `cd vagrant-scala-sbt`).
7. Run `vagrant up --provider=virtualbox` to create the VM using virtualbox as a provider. Or run `vagrant up --provider=docker` to use docker as a provider. (**NOTE** *This will take a while the first time as many dependencies are downloaded - subsequent deployments will be quicker as dependencies are cached in the `resources` directory*).
8. Execute ```vagrant ssh``` to login to the VM.

# Work out the ip-address of the docker container
To access the web user interfaces of the various services from your host machine, you need to work out which ip address to connect to. To determine this run the following docker commands 
on the host: -

```
docker container ls

CONTAINER ID        IMAGE                                      COMMAND               CREATED             STATUS              PORTS                                                                                                                    NAMES
a44ca8ded5b8        nishidayuya/docker-vagrant-ubuntu:xenial   "/usr/sbin/sshd -D"   About an hour ago   Up About an hour    0.0.0.0:4040->4040/tcp, 0.0.0.0:8080->8080/tcp, 0.0.0.0:8088->8088/tcp, 0.0.0.0:9083->9083/tcp, 127.0.0.1:2222->22/tcp   vagrant-hadoop-hive-spark_node1_1539427474
```

then

```
docker inspect a44ca8ded5b8 | grep -i ipaddress
            "SecondaryIPAddresses": null,
            "IPAddress": "172.17.0.2",
                    "IPAddress": "172.17.0.2",
```

So, in the case above the container's ip address is 172.17.0.2 - you can substitute this address if 'node1' does not work.

# Work out the ip-address of the virtualbox VM
The ip address of the virtualbox machine should be `10.211.55.101`

# Shared Folder

Vagrant automatically mounts the folder containing the Vagrant file from the host machine into
the guest machine as `/vagrant` inside the guest.

# Managment of Vagrant VM

To stop the VM and preserve all setup/data within the VM: -

```
vagrant halt
```

or

```
vagrant suspend
```

Issue a `vagrant up` command again to restart the VM from where you left off.

To completely **wipe** the VM so that `vagrant up` command gives you a fresh machine: -

```
vagrant destroy
```

Then issue `vagrant up` command as usual.

