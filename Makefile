.PHONY: help
help:
	@echo "Available targets:"
	@grep -E '^[a-z.A-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: all
all: helix nvim tmux zellij alacritty starship gitconfig zshrc ## Installs everything
 
.PHONY: helix
helix: ## Installs Helix config
	cp -r ./helix ~/.config/

.PHONY: nvim
nvim: ## Installs nvim config
	cp -r ./nvim ~/.config/

.PHONY: tmux
tmux: ## Installs tmux config
	cp -r ./tmux ~/.config/

.PHONY: zellij
zellij: ## Installs zellij config
	cp -r ./zellij ~/.config/

.PHONY: alacritty
alacritty: ## Installs Alacritty config
	cp -r ./alacritty ~/.config/

.PHONY: starship
starship: ## Installs starship config
	cp ./starship/starship.toml ~/.config/

.PHONY: gitconfig
gitconfig: ## Installs git config
	cp ./git/gitconfig ~/.gitconfig

.PHONY: zshrc
zshrc: ## Installs zshrc config
	cp ./zsh/zshrc ~/.zshrc
