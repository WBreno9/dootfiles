#!/bin/bash

cat > env.sh <<-EOF
	#!/bin/bash
	export DOOTS_DIR="$(pwd)"
EOF

home_files="tmux.conf xinitrc zshrc bashrc"

config_files=(
	'sxhkd/sxhkdrc'
	'bspwm/bspwmrc'
	'qutebrowser/autoconfig.yml'
	'nvim/init.vim'
	'nvim/coc-settings.json'
	'mimeapps.list'
	)

declare -a file_pairs

for file in $home_files; do
	file_pairs+=("$(pwd)/home/$file $HOME/.$file")
done

for file in "${config_files[@]}"; do
	file_pairs+=("$(pwd)/config/$file $HOME/.config/$file")
done

for file_pair in "${file_pairs[@]}"; do
	pair=($file_pair)
	mkdir -p $(dirname ${pair[1]})

	echo -e "creating symlink for ${pair[1]}"

	ln -sf ${pair[*]}
done

# ln -sf /usr/share/zsh/plugins/* $ZSH_CUSTOM/plugins
