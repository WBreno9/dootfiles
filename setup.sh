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

config_files="
	sxhkd/sxhkdrc 
	bspwm/bspwmrc 
	rofi/config 
	qutebrowser/autoconfig.yml
	mimeapps.list"

for file in $config_files; do
	mkdir -p "$HOME/.config/${file%/*}"
	ln -sf "$(pwd)/config/$file" "$HOME/.config/$file"
done

wal -R

cd st/st-0.8.2

cp ~/.cache/wal/colors-wal-st.h .colors-wal-st.h

sed -i 's/defaultfg = 257/defaultfg = 256/' .colors-wal-st.h
sed -i 's/defaultbg = 0/defaultbg = 257/' .colors-wal-st.h

awk '/\[256\]/{print gensub(/256/,"257","g");next;}
/\[257\]/{print gensub(/257/,"256","g");next;}
{print;} ' < .colors-wal-st.h > colors-wal-st.h

make clean
sudo make install

