# Functions
install_ = stow -t $(HOME) -R $1
link_ = for f in $1; do ln -sf $$(realpath $$f) $(2)/.$$(basename $$f); done

install: emacs asdf fonts-install submodules stow fasd zsh tpm
	$(call install_,git)
	$(call install_,irb)
	$(call install_,ruby)
	$(call install_,ctags)
	$(call install_,tmux)
	$(call install_,vimify)
	$(call install_,zsh)
	$(call install_,prezto)
	$(call install_,bin)
	$(call install_,emacs)
	$(call link_,./prezto/.zprezto/runcoms/z*,$(HOME))
	echo 'for config_file ($(HOME)/.zsh/*.zsh) source $$config_file' >> ~/.zshrc
	mkdir -p $(HOME)/.zsh.before
	mkdir -p $(HOME)/.zsh.after
	mkdir -p $(HOME)/.zsh.prompts
	chsh -s /usr/bin/zsh
	make fonts-install

fonts-install:
	mkdir -p $(HOME)/.fonts
	cp ./fonts/* $(HOME)/.fonts
	fc-cache -vf $(HOME)/.fonts

submodules:
	git submodule update --init --recursive
	git submodule update --recursive

/usr/bin/stow:
	sudo pacman -S stow

stow: /usr/bin/stow

/usr/bin/fasd:
	yay -S fasd

fasd: /usr/bin/fasd

/usr/bin/zsh:
	sudo pacman -S zsh

zsh: /usr/bin/zsh

~/.asdf:
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.4.0

~/.zsh.after/asdf.zsh:
	mkdir ~/.zsh.after
	touch ~/.zsh.after/asdf.zsh
	echo -e '\n. $(HOME)/.asdf/asdf.sh' >> ~/.zsh.after/asdf.zsh
	echo -e '\n. $(HOME)/.asdf/completions/asdf.bash' >> ~/.zsh.after/asdf.zsh

asdf-languages:
	. $(HOME)/.asdf/asdf.sh
	asdf plugin-add clojure https://github.com/vic/asdf-clojure.git
	asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
	asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
	asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
	asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
	asdf plugin-add rust https://github.com/code-lever/asdf-rust.git
	asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git

asdf: ~/.asdf ~/.zsh.after/asdf.zsh asdf-languages

tpm: ~/.tmux/plugins/tpm

~/.tmux/plugins/tpm:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

emacs: ~/.emacs.d

~/.emacs.d:
	git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
