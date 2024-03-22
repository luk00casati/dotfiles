update:
	cp -r ~/.config/nvim .
	cp -r ~/.config/kak .
	cp ~/.zshrc .
	mv .zshrc zshrc
	cp ~/.xinitrc .
	mv .xinitrc xinitrc
	cp ~/.config/picom.conf .

deploy:
	cp -r nvim ~/.config
	cp -r kak ~/.config
	cp zshrc ~
	mv ~/zshrc ~/.zshrc
	cp xinitrc ~
	mv ~/xinitrc ~/.xinitrc
	cp picom.conf ~/.config