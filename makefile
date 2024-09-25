update:
	# @cp -rf ~/.config/nvim .
	# @cp -rf ~/.config/kak .
	# @cp -rf ~/.config/helix .
	# @cp -rf ~/.config/alfonso .
	# @echo '' > alfonso/where
	# @cp ~/.zshrc .
	# @mv .zshrc zshrc
	@cp ~/.vimrc .
	@mv .vimrc vimrc
	# @cp ~/.xinitrc .
	# @mv .xinitrc xinitrc
	# @cp ~/.tmux.conf .
	# @mv .tmux.conf tmux.conf
	# @cp ~/.config/picom.conf .

deploy:
	# @cp -rf nvim ~/.config
	# @cp -rf kak ~/.config
	# @cp -rf alfonso ~/.config
	# @cp -rf helix ~/.config
	# @cp zshrc ~
	# @mv ~/zshrc ~/.zshrc
	@cp vimrc ~
	@mv ~/vimrc ~/.vimrc
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	# @cp xinitrc ~
	# @mv ~/xinitrc ~/.xinitrc
	# @cp tmux.conf ~
	# @mv ~/tmux.conf ~/.tmux.conf
	# @cp picom.conf ~/.config
	@git config --global user.name "Luca Casati"
	@git config --global user.email "luk00casati@gmail.com"
