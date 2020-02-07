#!/bin/bash

cat > env.sh <<-EOF
	#!/bin/bash
	export DOOTS_DIR="$(pwd)"

	export ST_DIR="$DOOTS_DIR/st/st-0.8.2"
	export ST_CONFIG="$DOOTS_DIR/st/st-0.8.2/config.h"
EOF

home_files="vimrc tmux.conf"

for file in $home_files; do
	ln -sf "$(pwd)/$file" "$HOME/.$file"
done

cd st/st-0.8.2
make clean
sudo make install

