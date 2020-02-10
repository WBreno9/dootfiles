#!/bin/bash

cat > env.sh <<-EOF
	#!/bin/bash
	export DOOTS_DIR="$(pwd)"

	export ST_DIR="$DOOTS_DIR/st/st-0.8.2"
	export ST_CONFIG="$DOOTS_DIR/st/st-0.8.2/config.h"
EOF

home_files="vimrc tmux.conf xinitrc"

for file in $home_files; do
	ln -sf "$(pwd)/$file" "$HOME/.$file"
done

config_files="sxhkd/sxhkdrc bspwm/bspwmrc rofi/config"
for file in $config_files; do
	mkdir -p "$HOME/.config/${file%/*}"
	ln -sf "$(pwd)/config/$file" "$HOME/.config/$file"
done

cd st/st-0.8.2
make clean
sudo make install

