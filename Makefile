PACKER_PATH:=~/.local/share/nvim/site/pack/packer/start
OH_MY_ZSH_CUSTOM_PLUGINS_PATH:=~/.oh-my-zsh/custom/plugins

.PHONY: all
all: packages-only zsh fonts nvim

.PHONY: packages-only
packages-only: packages packages-after

.PHONY: zsh
zsh: oh-my-zsh zsh zsh-plugins

.PHONY: packages
packages:
	apt-get install software-properties-common -y
	add-apt-repository -y ppa:git-core/ppa
	add-apt-repository ppa:neovim-ppa/stable -y
	apt-get update -y
	apt-get install -y zsh     \
	                   neovim  \
	                   git     \
	                   curl    \
	                   fd-find \
	                   fzf     \
	                   ripgrep \
	                   htop

.PHONY: packages-after
packages-after:
	ln -sf $$(which fdfind) ~/.local/bin/fd

.PHONY: oh-my-zsh
oh-my-zsh:
	rm -rf ~/.oh-my-zsh
	rm -f ~/.zshrc
	sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
	rm -f ~/.zshrc
	ln -sf $(PWD)/zshrc/.zshrc ~/.zshrc
	chsh -s $$(which zsh)

.PHONY: zsh-plugins
zsh-plugins:
	rm -rf $(OH_MY_ZSH_CUSTOM_PLUGINS_PATH)/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $(OH_MY_ZSH_CUSTOM_PLUGINS_PATH)/zsh-syntax-highlighting

.PHONY: font
fonts:
	rm -rf $(PWD)/nerd-fonts
	rm -rf ~/.local/share/fonts/NerdFonts
	git clone --filter=blob:none --sparse git@github.com:ryanoasis/nerd-fonts
	cd nerd-fonts && git sparse-checkout add patched-fonts/FiraCode
	./nerd-fonts/install.sh FiraCode

.PHONY: nvim
nvim:
	rm -rf $(PWD)/nvim/plugin
	rm -rf ~/.local/share/nvim
	rm -rf ~/.config/nvim
	rm -rf $(PACKER_PATH)
	mkdir -p $(PACKER_PATH)
	git clone --depth 1 https://github.com/wbthomason/packer.nvim $(PACKER_PATH)/packer.nvim
	ln -snf $(PWD)/nvim ~/.config/nvim
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
