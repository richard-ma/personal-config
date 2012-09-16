# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

# Show history
alias history='fc -l 1'

# List direcory contents
alias ls='ls --color=always'
alias ll='ls -lh'
alias la='ls -A'
alias lal='ls -Alh'
alias l='ls -CF'
alias grep='grep --color=always'

# tmuxifier
alias win='tmuxifier w'

# Emacs --no-window-system
alias emacs='emacs -nw'

# Create web http server with python
alias server='python -m SimpleHTTPServer'
