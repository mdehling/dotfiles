#
# ~/.bash_profile - executed by a login shell
#

source ~/.profile


case "$-" in *i*)
    unset ENV
    export BASH_ENV="$HOME/.bashrc"
    [ -r "$BASH_ENV" ] && source "$BASH_ENV"
esac
