update:
	@cp -rf ~/.config/nvim .
	@cp -rf ~/.config/kak .
	@cp -rf ~/.config/helix .
	@cp -rf ~/.config/alfonso .
	@echo '' > alfonso/where
	@cp ~/.zshrc .
	@mv .zshrc zshrc
	@cp ~/.vimrc .
	@mv .vimrc vimrc
	@cp ~/.xinitrc .
	@mv .xinitrc xinitrc
	@cp ~/.config/picom.conf .

deploy:
	@cp -rf nvim ~/.config
	@cp -rf kak ~/.config
	@cp -rf alfonso ~/.config
	@cp -rf helix ~/.config
	@cp zshrc ~
	@mv ~/zshrc ~/.zshrc
	@cp vimrc ~
	@mv ~/vimrc ~/.vimrc
	@cp xinitrc ~
	@mv ~/xinitrc ~/.xinitrc
	@cp picom.conf ~/.config
