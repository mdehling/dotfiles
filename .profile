#
# ~/.profile - executed by a login shell
#
OS=$(uname -s)

case "$OS" in

SunOS)
    LANG="C"
    PAGER=more
    ID=/usr/xpg4/bin/id

    PATH=/usr/local/bin:$PATH
    PATH=/opt/MDXfcode/bin:$PATH
    PATH=/opt/SUNWddk/tokenizer/bin:$PATH

    #MAIL=/usr/mail/${LOGNAME:?}
    ;;

NetBSD)
    EDITOR=nvim

    PATH=/pkg/bin:/pkg/sbin:/bin:/sbin:/usr/bin:/usr/sbin
    MANPATH=/pkg/man:/usr/share/man

    TEXLIVE_VERSION=2019
    TEXLIVE_BASE=/opt/texlive-${TEXLIVE_VERSION}
    TEXLIVE_PATH=${TEXLIVE_BASE}/bin/amd64-netbsd
    TEXLIVE_MANPATH=${TEXLIVE_BASE}/texmf-dist/doc/man

    PATH=${TEXLIVE_PATH}:$PATH
    MANPATH=${TEXLIVE_MANPATH}:$MANPATH

    export OSFONTDIR=$HOME/.fonts:$OSFONTDIR
    ;;

Linux)
    EDITOR=nvim
    ;;

*)
    ;;

esac


export LANG=${LANG:-"en_US.UTF-8"}

export PAGER=${PAGER:-less}
export EDITOR=${EDITOR:-vim}
export VISUAL=${VISUAL:-${EDITOR}}
export ID=${ID:-id}

PATH=$HOME/bin:$HOME/bin/$OS:$PATH
export PATH
export MANPATH


if command -v gpgconf >/dev/null; then
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
    gpg-connect-agent updatestartuptty /bye >/dev/null 2>&1
fi


export ENV=$HOME/.shrc
export BASH_ENV=$ENV
