#
# ~/.bashrc - executed by a non-login shell
#

source ~/.shrc

# interactive shell?
case "$-" in *i*)
    GIT_PROMPT_SH=""
    for file in \
        /usr/lib/git-core/git-sh-prompt \
        /pkg/share/examples/git/git-prompt.sh
    do
        if [ -f "$file" ]; then
            GIT_PROMPT_SH=$file
            break
        fi
    done

    if [ "$GIT_PROMPT_SH" ]; then
        source "$GIT_PROMPT_SH"
        GIT_PS1_SHOWDIRTYSTATE="yes"
        GIT_PS1_SHOWCOLORHINTS="yes"
        PROMPT_COMMAND='__git_ps1 "\h:\W" "\\\$ "'
    fi
esac
