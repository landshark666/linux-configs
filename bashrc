#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '
export PS1="\[\e[31;43m\]>>\[\e[m\] [\[\e[33m\]\u\[\e[m\]@\[\e[32m\]\h\[\e[m\]] \w> "

alias vi=vim

set_x_res() {
    [ $# -ne 2 ] && echo "Usage: $0 x y" && return 0

    m=$(cvt $1 $2 | grep ^Modeline | cut -d' ' -f2- | tr -d '"')
    name=$(echo $m | cut -d' ' -f1)
    xrandr --newmode $m
    monitor=$(basename $(xrandr --listactivemonitors | grep 0: | tr ' ' '/'))
    echo "Monitor: $monitor"
    xrandr --addmode $monitor $name
    xrandr -s $name
}
