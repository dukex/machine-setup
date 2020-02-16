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

## Installation

To complete installation run:

```
$ ansible-playbook playbook.yml --ask-become-pass
```

### Languages support

This dotfile support the following languages, via asdf:

- Elixir
- Ruby 
- Erlang
- Golang
- Nodejs

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


