RUBY=2.4.1

# Functions
install_ = stow -t $(HOME) -R $1
link_ = for f in $1; do ln -sf $$(realpath $$f) $(2)/.$$(basename $$f); done

install: ruby-install chruby submodules stow fasd zsh
	$(call install_,git)
	$(call install_,irb)
	$(call install_,ruby)
	$(call install_,ctags)
	$(call install_,tmux)
	$(call install_,vimify)
	$(call install_,vim)
	$(call install_,zsh)
	$(call install_,prezto)
	$(call install_,bin)
	$(call link_,./prezto/.zprezto/runcoms/z*,$(HOME))
	# run %{ ln -nfs "$HOME/.yadr/zsh/prezto-override/zpreztorc" "${ZDOTDIR:-$HOME}/.zpreztorc" }

	echo 'for config_file ($(HOME)/.zsh/*.zsh) source $$config_file' >> ~/.zshrc

	mkdir -p $(HOME)/.zsh.before
	mkdir -p $(HOME)/.zsh.after
	mkdir -p $(HOME)/.zsh.prompts
	chsh -s /usr/bin/zsh
	make fonts-install
	# bundle config --global jobs $( nproc )

fonts-install:
	mkdir -p $(HOME)/.fonts
	cp ./fonts/* $(HOME)/.fonts
	fc-cache -vf $(HOME)/.fonts


/opt/rubies/ruby-$(RUBY)/bin/ruby:
	ruby-install --rubies-dir /opt/rubies ruby $(RUBY)

/usr/share/chruby/chruby.sh: /opt/rubies/ruby-$(RUBY)/bin/ruby
	pacaur -S chruby

/usr/bin/ruby-install:
	pacaur -Syu ruby-install

ruby-install: /usr/bin/ruby-install

chruby: /usr/share/chruby/chruby.sh

$(HOME)/.vim/bundle/vundle:
	git clone https://github.com/gmarik/vundle.git $(HOME)/.vim/bundle/vundle

vundles: $(HOME)/.vim/bundle/vundle
	vim +BundleInstall +qall

submodules:
	git submodule update --init --recursive
	git submodule update --recursive

/usr/bin/stow:
	pacaur -S stow

stow: /usr/bin/stow

/usr/bin/fasd:
	pacaur -S fasd

fasd: /usr/bin/fasd

/usr/bin/zsh:
	pacaur -S zsh

zsh: /usr/bin/zsh
