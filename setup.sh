inst_conf() {
    if [[ ! -e $1 ]]; then
        ln -s "$2" "$1"
        echo Linking @ $2
    else
        echo $2 already exists
    fi
}

inst_conf $HOME/.vimrc $PWD/vimrc
inst_conf $HOME/.tmux.conf $PWD/tmux.conf

[[ ! -d $HOME/.config ]] && mkdir -p $HOME/.config

inst_conf $HOME/.config/i3 $PWD/config/i3
inst_conf $HOME/.config/i3status $PWD/config/i3status

inst_conf $HOME/.vim $PWD/vim

echo "Optionally, cd into fonts/ and run setup.sh to download/install fonts"
