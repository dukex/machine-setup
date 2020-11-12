# Machine Setup

This dotfiles is made to be used in **Arch Linux** and in **Windows** via a **Debian** WSL.
All ansible commands should be executed in Linux.

## Download

### Ansible

First of all, install ansible in your machine, you can follow [the ansible installation guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).

Given you're in Windows, read careful the [Setting up a Windows Host](https://docs.ansible.com/ansible/latest/user_guide/windows_setup.html) guide and the [Windows Support](#windows-support) here.

### Dotfiles

To download the dotfiles run:

```
$ git clone git@github.com:dukex/dotfiles.git ~/.dotfiles
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

If you need load zsh files before all zsh setup, put the script in `$HOME/.zsh.before`, the filename should end with `.zsh`

#### Path

By default the follow paths is in `$PATH`:

- /usr/bin
- /usr/local/{bin,sbin}
- $HOME/.bin
- $HOME/bin

#### Aliases

[see zsh/files/aliases.zsh](zsh/files/aliases.zsh)

#### Ansible

Set the `ANSIBLE_VAULT_PASSWORD_FILE` to `~/.ansible/vault_pass`

#### Colors

Set the `GREP_COLOR` to Yellow

#### Git

Define `rmb` command, to remove merged branches

#### Key Bindings

- Use vi key bindings
- Set Ctrl-r to search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
- Set Ctrl-a to beginning of line
- Set Ctrl-e to end of line

#### prompt

Load `promptinit` and with `~/.zsh.prompt` as `fpath`. With that you can put your prompt in `~/.zsh.prompt` directory

#### rm

Override rm -i alias which makes rm prompt for every action

#### zmv

Use zmv

#### zsh-aliases

Set global aliases to zsh, [see zsh/files/zsh-aliases.zsh](zsh/files/zsh-aliases.zsh)

## Emacs

This dotfile install and setup the spacemacs, the best emacs configuration to vim programmers. The spacemacs documentation is a good place to start, go to [www.spacemacs.org](https://www.spacemacs.org) if you want know more.

To install just the emacs, run:

```
$ ansible-playbook playbook.yml --tags emacs
```

### Visual Code Insiders

This dotfile install and setup the visual code insiders. The Insiders has the most recent code pushes and may lead to the occasional broken build. Currently the Visual Code Insiders has a sync configuration from github or Microsoft Account, because that this dotfile will just install the apo.

To install just the visual code insiders, run:

```
$ ansible-playbook -i hosts playbook.yml --tags visual_code
```


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


### Docker (community edition)

This script install the docker following the guide at [docs.docker.com/install](https://docs.docker.com/install/), for now just the debian installation is fully supported.

On windows, install Docker Desktop, and enable the WSL integration.

To install just the docker, run:

```
$ ansible-playbook -i hosts playbook.yml --tags docker --ask-become-pass
```

The docker tag will install the **docker-compose** too.

#### Docker Compose

On windows, the docker-compose will just be installed in the WSL.

To install just the docker-compose, run:

```
$ ansible-playbook -i hosts playbook.yml --tags docker-compose --ask-become-pass
```

### The Silver Searcher

The "the silver searcher" is descibed as "A code searching tool similar to ack, with a focus on speed."

On windows, the the silver searcher will just be installed in the WSL.

To install just the The Silver Searcher, run:

```
$ ansible-playbook -i hosts playbook.yml --tags the-silver-searcher --ask-become-pass
```

### Firefox

To install just the firefox, run:

```
$ ansible-playbook -i hosts playbook.yml --tags firefox --ask-become-pass
```

### Enpass

[TODO]

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
YOUR-WINDOWS-IP

[win:vars]
ansible_user=YOUR-WINDOWS-USER
ansible_password=YOUR-WINDOWS-PASSWORD
ansible_connection=winrm
ansible_winrm_server_cert_validation=ignore
ansible_winrm_transport=basic
```

Change the `YOUR-WINDOWS-IP`, `YOUR-WINDOWS-USER` and `YOUR-WINDOWS-PASSWORD` to real data.