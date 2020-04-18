#!/bin/bash

cat > env.sh <<-EOF
	#!/bin/bash
	export DOOTS_DIR="$(pwd)"

	export ST_DIR="$DOOTS_DIR/st/st-0.8.2"
	export ST_CONFIG="$DOOTS_DIR/st/st-0.8.2/config.h"
EOF

home_files="tmux.conf xinitrc"

for file in $home_files; do
	ln -sf "$(pwd)/$file" "$HOME/.$file"
done

config_files=(
	'sxhkd/sxhkdrc'
	'bspwm/bspwmrc'
	'rofi/config'
	'qutebrowser/autoconfig.yml'
	'nvim/init.vim'
	'mimeapps.list'
	)

for file in "${config_files[@]}"; do
	echo -e "creating symlink for $file"

	mkdir -p "$HOME/.config/${file%/*}"
	ln -sf "$(pwd)/config/$file" "$HOME/.config/$file"
done

wal -R
