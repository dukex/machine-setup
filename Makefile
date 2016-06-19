RUBY=2.3.1

# Functions
install_ = stow -R $1
link_ = for f in $1; do ln -sf $$(realpath $$f) $(2)/.$$(basename $$f); done

install: ruby-install chruby vim-install submodules
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

/usr/local/share/chruby/chruby.sh: /opt/rubies/ruby-$(RUBY)/bin/ruby
	cd /tmp ; \
	 wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz ; \
	 tar -xzvf chruby-0.3.9.tar.gz ; \
	 cd chruby-0.3.9/ ; \
	 sudo ./scripts/setup.sh

/usr/local/bin/ruby-install:
	cd /tmp; \
	  wget -O ruby-install-0.6.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.0.tar.gz; \
	  tar -xzvf ruby-install-0.6.0.tar.gz ; \
	  cd ruby-install-0.6.0 ; \
	  sudo make install

ruby-install: /usr/local/bin/ruby-install

chruby: /usr/local/share/chruby/chruby.sh

$(HOME)/.vim/bundle/vundle:
	git clone https://github.com/gmarik/vundle.git $(HOME)/.vim/bundle/vundle

vundles: $(HOME)/.vim/bundle/vundle
	vim +BundleInstall +qall

/tmp/vim:
	git clone https://github.com/vim/vim.git /tmp/vim

/usr/bin/vim: /tmp/vim
	sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
		libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
		libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
		ruby-dev git
	sudo apt-get remove vim vim-runtime gvim
	cd /tmp/vim ; \
		./configure --with-features=huge \
            --enable-multibyte \
						--disable-netbeans \
						--enable-largefile \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --enable-perlinterp \
            --enable-luainterp \
						--with-luajit \
						--with-lua \
            --enable-gui=gtk2 \
						--enable-cscope --prefix=/usr ; \
		make VIMRUNTIMEDIR=/usr/share/vim/vim74 ; \
		sudo make install
	sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
	sudo update-alternatives --set editor /usr/bin/vim
	sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
	sudo update-alternatives --set vi /usr/bin/vim

vim-install: /usr/bin/vim

submodules:
	git submodule update --init --recursive
	git submodule update --recursive


