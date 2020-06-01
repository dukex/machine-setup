# Machine Setup

## Download

### Ansible

First of all, install ansible in your machine, you can follow [the ansible installation guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).

### Dotfiles

To download the dotfiles run:

```
$ git clone git@github.com:dukex/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
```

## Complete Installation

To complete installation run:

```
$ ansible-playbook playbook.yml --ask-become-pass
```

This command will download, install, link, all dependencies, files, and configuration


## ZSH

This scrippt will install the packages zsh, zsh-syntax-highlighting, zsh-history-substring-search, zsh-completions, zsh-autosuggestions, zsh-autopair and zsh-extract via antigen.

To install just the zsh configuration, run:

```
$ ansible-playbook playbook.yml --tags zsh-config
```

To install just the zsh (and the zsh configuration), run:

```
$ ansible-playbook playbook.yml --tags zsh --ask-become-pass
```

### Before scripts

If you need load zsh files before all zsh setup, put the script in `$HOME/.zsh.before`, the filename should end with `.zsh`

### Path

By default the follow paths is in `$PATH`:

- /usr/bin
- /usr/local/{bin,sbin}
- $HOME/.bin
- $HOME/bin

### Aliases

[see zsh/files/aliases.zsh](zsh/files/aliases.zsh)

### Ansible

Set the `ANSIBLE_VAULT_PASSWORD_FILE` to `~/.ansible/vault_pass`

### Colors

Set the `GREP_COLOR` to Yellow

### Git

Define `rmb` command, to remove merged branches

### Key Bindings

- Use vi key bindings
- Set Ctrl-r to search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
- Set Ctrl-a to beginning of line
- Set Ctrl-e to end of line

### prompt

Load `promptinit` and with `~/.zsh.prompt` as `fpath`. With that you can put your prompt in `~/.zsh.prompt` directory

### rm

Override rm -i alias which makes rm prompt for every action

### zmv

Use zmv

### zsh-aliases

Set global aliases to zsh, [see zsh/files/zsh-aliases.zsh](zsh/files/zsh-aliases.zsh)



## Visual Code Insiders

This dotfile install and setup the visual code insiders. The Insiders has the most recent code pushes and may lead to the occasional broken build.

To install just the visual code insiders, run:

```
$ ansible-playbook playbook.yml --tags visual_code
```


## Git

This dotfile link a gitconfig and a gitignore to the home directory. This files is configured with a global configuration, you can check these files at [gitconfig](git/files/gitconfig) and [gitignore](git/files/gitignore)

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

This script install the docker following the guide at [docs.docker.com/install](https://docs.docker.com/install/), for now just the debian installation is fully supported.

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

## Firefox

To install just the firefox, run:

```
$ ansible-playbook playbook.yml --tags firefox --ask-become-pass
```

## Enpass

[TODO]

## Tmux

[TODO]
```

## yay

[TODO]
