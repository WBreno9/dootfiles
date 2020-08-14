#!/bin/bash

cat > env.sh <<-EOF
	#!/bin/bash
	export DOOTS_DIR="$(pwd)"
EOF

home_files="tmux.conf xinitrc zshrc"

for file in $home_files; do
	echo -e "creating symlink for $file"

	ln -sf "$(pwd)/home/$file" "$HOME/.$file"
done

config_files=(
	'sxhkd/sxhkdrc'
	'bspwm/bspwmrc'
	'qutebrowser/autoconfig.yml'
	'nvim/init.vim'
	'./mimeapps.list'
	)

for file in "${config_files[@]}"; do
	echo -e "creating symlink for $file"

	mkdir -p "$HOME/.config/${file%/*}"
	ln -sf "$(pwd)/config/$file" "$HOME/.config/$file"
done

# ln -sf /usr/share/zsh/plugins/* $ZSH_CUSTOM/plugins
