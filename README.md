# Zidisha.org - Vagrant development environment


## About Zidisha

[Zidisha](http://zidisha.org) is the first person-to-person lending platform to bridge the international wealth divide. We are a nonprofit community that enables direct P2P lending to small business owners in developing countries.

We are also the first microlending service to operate without any brick-and-mortar offices. Zidisha is managed Wikipedia-style by a global network of over 60 volunteers, located on every inhabitable continent.

Finally, we are the world's only open-source person-to-person lending platform. Your contributions to our project will not only help our thousands of members access opportunities to improve their lives, but also serve as a resource for people and organizations everywhere that wish to build on our work.


## Bootstrapping your development environment

This project aims to provide a quick and simple way for you to bootstrap a development environment for helping out the Zidisha project. It's based on [Vagrant](http://www.vagrantup.com/) and [Ansible](http://ansible.github.io/).

With it, you'll be able to quickly start to contributing - it'll provide you with an Ubuntu Server development machine, with the project already configured.


## Instructions

### Before you start

Before you start, make sure that:

1. You have your SSH Agent running
2. Your Github account SSH key is added to the agent.

Check out [this reference](https://help.github.com/articles/using-ssh-agent-forwarding) to learn how to do it. You'll need the agent to be properly configured in order to clone Zidisha's repository from within the virtual machine we're about to create.


### Ubuntu

You'll need to install [Virtualbox](https://www.virtualbox.org/), [Vagrant](http://vagrantup.com/) and [Ansible](http://ansible.github.io) before you start. This can trivially be done using the [APT Package Manager](https://wiki.debian.org/Apt):

```bash
sudo apt-get install python-software-properties virtualbox vagrant saycow
sudo add-apt-repository ppa:rquillo/ansible
sudo apt-get update
sudo apt-get install ansible
```

Then simply clone this repository and preform a **vagrant up**:

```bash
git clone && cd zidisha-vagrant
vagrant up
```

And add an entry to your **hosts** file:

```bash
echo 'zidisha.local     192.168.90.103' | sudo tee -a /etc/hosts
```

Fire up a browser and visit - http://zidisha.local/.


### Mac OS

Both [Ansible](http://ansible.github.io) and [Vagrant](http://vagrantup.com) should work under Mac OS. I'm not event remotely familiar with this ecosystem in particular, so I can't help you much with that.

Here's a [quick reference](https://weluse.de/blog/installing-ansible-on-os-x.html) that seems to tackle the challenge. If you have a Mac feel free to help out documenting the process. :)

**If you have any trouble, get [Virtualbox](http://virtualbox.org/) and [Vagrant](http://vagrantup.com) running on your machine and take a look at Window's instructions.**


### Windows

* Download and install [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
* Download and install [Vagrant](http://www.vagrantup.com/downloads.html)
* Clone this repository and preform a vagrant up:

```bash
git clone 
vagrant up
```

* An error message will be shown during the VM boot, ignore it (Ansible is not compatible with Windows).
* SSH into the machine:

```bash
vagrant ssh
```

* Run the provisioning from within the VM:

```bash
cd /provisioning
sudo -E ansible -h hosts playbook.yml
```

* You should be done! :)
