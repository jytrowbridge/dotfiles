all:
	stow --verbose --target=$$HOME --restow */ --ignore include

delete:
	stow --verbose --target=$$HOME --delete *
