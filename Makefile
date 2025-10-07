all:
	stow --verbose --target=$$HOME/.config --restow .
delete:
	stow --verbose --target=$$HOME --delete .
