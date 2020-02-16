# dotfiles

## Download

### Ansible

First of all, install ansible in your machine, you can follow [ansible installation guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).

### Dotfiles

To download the dotfiles run:

```
$ git clone git@github.com:dukex/new-dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
```

## Complete Installation

To complete installation run:

```
$ ansible-playbook playbook.yml --ask-become-pass
```

This command will download, install, link, all dependencies, files, and configuration



## ZSH

This scrippt will install the packages zsh and zsh-syntax-highlighting.

To install just the zsh, run:

```
$ ansible-playbook playbook.yml --tags zsh --ask-become-pass
```


## Emacs

This dotfile install and setup the spacemacs, the best emacs configuration to vim programmers. The spacemacs documentation is a good place to start, go to [www.spacemacs.org](https://www.spacemacs.org) if you want know more.

To install just the emacs, run:

```
$ ansible-playbook playbook.yml --tags emacs
```

## Git

This dotfile link a gitconfig and a gitignore to the home directory. This files is configured with a global configuration, you can check these files at [gitconfig](roles/git/files/gitconfig) and [gitignore](roles/git/files/gitignore)

Please leave the ~/.gitconfig to global configuration, you can put your configurations in ~/.gitconfig.user

To install just the git config, run:

```
$ ansible-playbook playbook.yml --tags git
```

## Tmux

This dotfile will install the tmux and the tpm(tmux plugin manager).

To install just the tmux, run:

```
$ ansible-playbook playbook.yml --tags tmux --ask-become-pass
```

To install just the tpm, run:

```
$ ansible-playbook playbook.yml --tags tpm
```

## Languages support (asdf)

This dotfile support the following languages, via asdf:

- Elixir
- Ruby
- Erlang
- Golang
- Nodejs

You can read more about asdf in [asdf-vm.com](https://asdf-vm.com/).

To install just the languages support, run:

```
$ ansible-playbook playbook.yml --tags languages
```

You can install a language separated


**Elixir**
```
$ ansible-playbook playbook.yml --tags elixir
```

**Ruby**
```
$ ansible-playbook playbook.yml --tags ruby
```

**Erlang**
```
$ ansible-playbook playbook.yml --tags elixir
```

**Golang**
```
$ ansible-playbook playbook.yml --tags golang
```

**Nodejs**
```
$ ansible-playbook playbook.yml --tags nodejs
```


## Docker (community edition)

The docker installation follow the guide in [docs.docker.com/install](https://docs.docker.com/install/), for now just the debian installation is fully supported.

To install just the docker, run:

```
$ ansible-playbook playbook.yml --tags docker --ask-become-pass
```

The docker tag will install the **docker-compose** too.

## Docker Compose

To install just the docker-compose, run:

```
$ ansible-playbook playbook.yml --tags docker-compose --ask-become-pass
```

## The Silver Searcher

The "the silver searcher" is descibed as "A code searching tool similar to ack, with a focus on speed."

To install just the The Silver Searcher, run:

```
$ ansible-playbook playbook.yml --tags the-silver-searcher --ask-become-pass
```