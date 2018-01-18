# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
window_root "/home/richardma/VirtualEnvs/test/src"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "Python REPL"

# Split window into panes.
split_h 50

# Set active pane.
select_pane 0

# Run commands.
run_cmd "vim" 0
run_cmd "python3" 1     # runs in pane 1
