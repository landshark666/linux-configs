#!/usr/bin/env bash

download() {
    # https://www.nerdfonts.com/font-downloads
    # https://app.programmingfonts.org/
    VERSION=v2.1.0
    wget -P fonts/ https://github.com/ryanoasis/nerd-fonts/releases/download/$VERSION/DejaVuSansMono.zip
    wget -P fonts/ https://github.com/ryanoasis/nerd-fonts/releases/download/$VERSION/DaddyTimeMono.zip
    wget -P fonts/ https://github.com/ryanoasis/nerd-fonts/releases/download/$VERSION/Hack.zip
    wget -P fonts/ https://github.com/ryanoasis/nerd-fonts/releases/download/$VERSION/Hermit.zip
    wget -P fonts/ https://github.com/ryanoasis/nerd-fonts/releases/download/$VERSION/JetBrainsMono.zip
    wget -P fonts/ https://github.com/ryanoasis/nerd-fonts/releases/download/$VERSION/ProFont.zip
    wget -P fonts/ https://github.com/ryanoasis/nerd-fonts/releases/download/$VERSION/ShareTechMono.zip
    wget -P fonts/ https://github.com/ryanoasis/nerd-fonts/releases/download/$VERSION/Terminus.zip
    wget -P fonts/ https://github.com/ryanoasis/nerd-fonts/releases/download/$VERSION/VictorMono.zip
}

install() {
    if [ ! -d ~/.fonts ]; then
        mkdir ~/.fonts
    fi

    FONTS=$PWD/fonts
    pushd ~/.fonts
    for i in $FONTS/*.zip; do
        unzip $i
    done
    popd

    echo "Recaching fonts, this may take a while..."
    fc-cache -f
}

if [ $# -eq 0 ]; then
    download
    install
else
    while [ $# -gt 0 ]; do
        case $1 in
            install)
                install;;

            download)
                download;;

            *)
                echo "Usage: $0 [install] [download]"
                exit 1
        esac

        shift
    done
fi

