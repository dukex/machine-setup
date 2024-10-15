# Machine Setup

This dotfiles is made to be used in **Arch Linux** and in **Windows** via a WSL.
All ansible commands should be executed in Linux.

## Download

### Git 

We will download this repo using git

#### Arch 
```
$ pacman -S git openssh
$ ssh-keygen -t ed25519 -C "emersonalmeidax@gmail.com"
$ eval "$(ssh-agent -s)"
$ ssh-add ~/.ssh/id_ed25519
```

Create the new ssh key in github 

#### Debian 

```
$ sudo apt-get update
$ sudo apt install git
$ ssh-keygen -t ed25519 -C "emersonalmeidax@gmail.com"
$ eval "$(ssh-agent -s)"
$ ssh-add ~/.ssh/id_ed25519
```

Create the new ssh key in github 


#### MacOS 

```
$ xcode-select --install
$ ssh-keygen -t ed25519 -C "emersonalmeidax@gmail.com"
$ eval "$(ssh-agent -s)"
$ ssh-add --apple-use-keychain ~/.ssh/id_ed25519
```

Create the new ssh key in github 


### Ansible

First of all, install ansible in your machine, you can follow [the ansible installation guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).

#### Arch 

```
$ pacman -S ansible
```

#### In WSL 

Given you're in Windows, read careful the [Setting up a Windows Host](https://docs.ansible.com/ansible/latest/user_guide/windows_setup.html) guide and the [Windows Support](#windows-support) here.

#### MacOs

```
$ python3 -m pip install --user ansible
$ ansible-galaxy collection install community.general
```

### Dotfiles

To download the dotfiles run:

```
$ git clone git@github.com:dukex/machine-setup.git ~/.dotfiles
$ cd ~/.dotfiles
```

## Installation

To complete installation run:

```
$ ansible-playbook -i hosts playbook.yml --ask-become-pass
```

This command will download, install, link, all dependencies, files, and configuration


### ZSH

This scrippt will install the packages zsh, zsh-syntax-highlighting, zsh-history-substring-search, zsh-completions, zsh-autosuggestions, zsh-autopair and zsh-extract via antigen.

On windows, the zsh will just be installed in the WSL.

To install just the zsh configuration, run:

```
$ ansible-playbook -i hosts playbook.yml --tags zsh-config
```

To install just the zsh (and the zsh configuration), run:

```
$ ansible-playbook -i hosts playbook.yml --tags zsh --ask-become-pass
```

#### Before scripts

Will setup the [powershell10k](https://github.com/romkatv/powerlevel10k).

#### Path

By default the follow paths is in `$PATH`:

- /usr/bin
- /usr/local/{bin,sbin}
- $HOME/.bin
- $HOME/bin
- $HOME/.local/bin
- $HOME/.cargo/bin

#### Aliases

[see zsh/files/aliases.zsh](zsh/files/aliases.zsh)

#### Key Bindings

- Use vi key bindings
- Set Ctrl-r to search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
- Set Ctrl-a to beginning of line
- Set Ctrl-e to end of line

### Git

This dotfile link a gitconfig and a gitignore to the home directory. This files is configured with a global configuration, you can check these files at [gitconfig](git/files/gitconfig) and [gitignore](git/files/gitignore)

Please leave the ~/.gitconfig to global configuration, you can put your configurations in ~/.gitconfig.user

On windows, the git will just be installed in the WSL.

To install just the git config, run:

```
$ ansible-playbook -i hosts playbook.yml --tags git
```

### Tmux

This dotfile will install the tmux and the tpm(tmux plugin manager).

On windows, the tmux will just be installed in the WSL.

To install just the tmux, run:

```
$ ansible-playbook -i hosts playbook.yml --tags tmux --ask-become-pass
```

To install just the tpm, run:

```
$ ansible-playbook -i hosts playbook.yml --tags tpm
```

### Languages support (asdf)

This dotfile support the following languages, via asdf:

- Elixir
- Ruby
- Erlang
- Golang
- Nodejs

You can read more about asdf in [asdf-vm.com](https://asdf-vm.com/).

On windows, the asdf will just be installed in the WSL.

To install just the languages support, run:

```
$ ansible-playbook -i hosts playbook.yml --tags languages
```

You can install a language separated


**Elixir**
```
$ ansible-playbook -i hosts playbook.yml --tags elixir
```

**Ruby**
```
$ ansible-playbook -i hosts playbook.yml --tags ruby
```

**Erlang**
```
$ ansible-playbook -i hosts playbook.yml --tags elixir
```

**Golang**
```
$ ansible-playbook -i hosts playbook.yml --tags golang
```

**Nodejs**
```
$ ansible-playbook -i hosts playbook.yml --tags nodejs
```



### ~~The Silver Searcher~~ ripgrep

The ripgrep recursively searches directories for a regex pattern while respecting your gitignore.

On windows, the ripgrep will just be installed in the WSL.

To install just the The Silver Searcher, run:

```
$ ansible-playbook -i hosts playbook.yml --tags the-silver-searcher --ask-become-pass
```

### Tmux

[TODO]

### yay

[TODO]

<a id="windows-support"></a>
## Windows Support

To make windows works, first install `winrm`, the ansible describe better it on [Setting up a Windows Host](https://docs.ansible.com/ansible/latest/user_guide/windows_setup.html) guide.

After, take a look the current `hosts` file, now it's look like:

```
[local]
127.0.0.1

[local:vars]
ansible_connection=local
```

You should add the follow code after the last line of this file:

```
[win]
YOUR-WINDOWS-IP # run cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'

[win:vars]
ansible_user=YOUR-WINDOWS-USER
ansible_password=YOUR-WINDOWS-PASSWORD
ansible_connection=winrm
ansible_winrm_server_cert_validation=ignore
ansible_winrm_transport=basic
```

Change the `YOUR-WINDOWS-IP`, `YOUR-WINDOWS-USER` and `YOUR-WINDOWS-PASSWORD` to real data.
