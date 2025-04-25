.PHONY: all
all: helix nvim tmux alacritty starship gitconfig zsh
 
.PHONY: helix
helix:
	cp -r ./helix ~/.config/

.PHONY: nvim
nvim:
	cp -r ./nvim ~/.config/

.PHONY: tmux
tmux:
	cp -r ./tmux ~/.config/

.PHONY: alacritty
alacritty:
	cp -r ./alacritty ~/.config/

.PHONY: starship
starship:
	cp ./starship/starship.toml ~/.config/

.PHONY: gitconfig
gitconfig:
	cp ./git/gitconfig ~/.gitconfig

.PHONY: zshrc
zshrc:
	cp ./zsh/zshrc ~/.zshrc
