# Zidisha - Development Environment

## About Zidisha

[Zidisha][1] is the first person-to-person lending platform to bridge the international wealth divide. We are a nonprofit community that enables direct P2P lending to small business owners in developing countries.

We are also the first microlending service to operate without any brick-and-mortar offices. Zidisha is managed Wikipedia-style by a global network of over 60 volunteers, located on every inhabitable continent.

Finally, we are the world's only open-source person-to-person lending platform. Your contributions to our project will not only help our thousands of members access opportunities to improve their lives, but also serve as a resource for people and organizations everywhere that wish to build on our work.


## Bootstrapping your development environment

[![xkcd automation](http://imgs.xkcd.com/comics/automation.png)](https://xkcd.com/1319/)

This project aims to provide a quick and simple way for you to bootstrap a development environment for helping out the Zidisha project. It's based on [Vagrant][2] and [Ansible][3].

With it, you'll be able to quickly start to contributing - it'll provide you with an Ubuntu Server development machine, with the project already configured.

Before you start, make sure you visit [Zidisha's Github project page][4].


## Instructions

> * [Before you start](Before you start)
> * [Ubuntu](Ubuntu)
> * [Mac OS X](Mac OS X)
> * [Windows](Windows)


### Before you start

Before you start, make sure that:

1. You have your SSH Agent running
2. Your Github account SSH key is added to the agent.

Check out [this reference][9] to learn how to do it. You'll need the agent to be properly configured in order to clone Zidisha's repository from within the virtual machine we're about to create.

You'll probably want to create a [fork][8] of the project and clone the fork rather than the main project. If this is the case, fork the project, open the [**provisioning/playbook.yml**][9] and edit the **repository** entry.

In my case, it would look something like this:

```yaml
- hosts: vagrant
  vars:
    apache:
      hostname: zidisha.dev
    git:
        repository: "git@github.com:diogoosorio/zidisha.git"
    database:
        host: 127.0.0.1
        name: zidisha
        user: zidisha
        password: zidisha
```

----

### Ubuntu

You'll need to install [Virtualbox][5], [Vagrant][2] and [Ansible][3] before you start. This can trivially be done using the [APT Package Manager][6]:

```bash
sudo apt-get install python-software-properties virtualbox vagrant saycow
sudo add-apt-repository ppa:rquillo/ansible
sudo apt-get update
sudo apt-get install ansible
```

Then simply clone this repository and preform a **vagrant up**:

```bash
git clone https://github.com/diogoosorio/zidisha-vagrant.git && cd zidisha-vagrant
vagrant up
```

If you get an error during the provisioning, re-run:

```bash
vagrant provision
```

And add an entry to your **hosts** file:

```bash
echo '192.168.90.103     zidisha.dev' | sudo tee -a /etc/hosts
```

Fire up a browser and visit - http://zidisha.dev/.

----

### Mac OS X

1. Download and install [Virtualbox][13]
1. Download and install [Vagrant][14]
1. Install the vagrant plugin [vagrant-vbguest][15]:

    ```bash
    vagrant plugin install vagrant-vbguest
    ```
 
1. Install [Ansible][3]:
     - Via [Homebrew][7]:

        ```bash
        brew install ansible
        ```
   
     - Via the Python package manager [Pip][16]:

        ```bash
        sudo pip install ansible
        ```

1. Clone this repository and perform a **vagrant up**:

    ```bash
    git clone https://github.com/diogoosorio/zidisha-vagrant.git && cd zidisha-vagrant
    vagrant up
    ```
    
    This make take a while to install.
    
    Answer `yes` if you get the following message:
    
    > The authenticity of host '192.168.90.103 (192.168.90.103)' can't be established.  
    > RSA key fingerprint is ...  
    > Are you sure you want to continue connecting (yes/no)?
    
    If this is not the first time you run the installation, you might see the following error:
    
    > fatal: [192.168.90.103] => SSH encountered an unknown error during the connection.
    
    The fix this, just remove the line starting with `192.168.90.103`
    from `~/.ssh/known_hosts` and run **vagrant provision**.

1. And add an entry to your **hosts** file:
   
    ```bash
    echo '192.168.90.103  zidisha.dev' | sudo tee -a /etc/hosts
    ```

1. You should be done! Fire up a browser and visit - http://zidisha.dev.


----

### Windows

1. Download and install [Virtualbox][5]
1. Download and install [Vagrant][2]
1. Clone this repository and preform a vagrant up:

  ```bash
  git clone https://github.com/diogoosorio/zidisha-vagrant.git && cd zidisha-vagrant
  vagrant up --no-provision
  ```

1.  SSH into the machine. You'll probably use **PuttY** or something similar. To simplify, use the following information:

    * IP Address: 192.168.90.103
    * Username: vagrant
    * Password: vagrant

1. Make sure you have an SSH-Agent running (**Pageant**, probably) and that your Github SSH key is added on the agent.

1. Run the provisioning from within the VM:

  ```bash
  cd /provisioning
  sudo -E bash run.sh
  ```

1. Edit your hosts file. Open **My Computer** and go to:

  ```no-highlight
  %systemroot%\system32\drivers\etc\
  ```
1. Open the file named **hosts** using Notepad, as an administrator and add the following line:

  ```no-highlight
  192.168.90.103 zidisha.dev
  ```

1. You should be done! Fire up a browser and visit - http://zidisha.dev/.

----

### Working in the project

On your host machine, you'll find a directory named **workspace** that by now, should contain the project's files. This directory is shared with the VM, so just point your favorite IDE to that directory and start hacking! :)

----

## Licensing

This project is licensed under the [Apache License 2.0][11]. Please take the time to look at (and make sure you comply with) [Zidisha's][12] licensing, before you start working.


[1]: http://zidisha.org/                                          "Zidisha"
[2]: http://www.vagrantup.com/                                    "Vagrant"
[3]: http://ansible.github.io/                                    "Ansible"
[4]: https://github.com/Zidisha/zidisha                           "Zidisha Github"
[5]: http://virtualbox.org/                                       "Virtualbox"
[6]: https://wiki.debian.org/Apt                                  "APT"
[7]: http://brew.sh/                                              "Homebrew"
[8]: https://help.github.com/articles/fork-a-repo                 "Github Fork"
[9]: provisioning/playbook.yml                                    "Playbook.yml"
[10]: https://help.github.com/articles/using-ssh-agent-forwarding "Using ssh-agent forwarding"
[11]: License.md                                                  "Apache License 2.0"
[12]: https://github.com/Zidisha/zidisha/blob/master/LICENSE      "Zidisha License"
[13]: https://www.virtualbox.org/wiki/Downloads                   "Download VirtualBox"
[14]: http://www.vagrantup.com/downloads                          "Download Vagrant"
[15]: https://github.com/dotless-de/vagrant-vbguest               "vagrant-vbguest"
[16]: http://pip.readthedocs.org/en/latest/index.html             "pip"
