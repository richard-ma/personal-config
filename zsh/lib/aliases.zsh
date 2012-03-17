# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

# Super user
alias _='sudo'

#alias g='grep -in'

# Show history
alias history='fc -l 1'

# List direcory contents
alias ls='ls --color=always'
alias ll='ls -lh'
alias la='ls -A'
alias lal='ls -Alh'
alias l='ls -CF'
alias grep='grep --color=always'

# rm redefine
function remove {
    if [ `pwd` != "$HOME/.local/share/Trash/files" ]; then
        mv "$@" ~/.local/share/Trash/files
    else
        alias rm='rm'
        rm "$@"
        alias rm='remove'
    fi
}
alias rm='remove'
