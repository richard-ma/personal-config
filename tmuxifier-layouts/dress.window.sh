# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
window_root "~/Projects/dress/dress/"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "dress"

# Split window into panes.
split_h 40 
split_v 60

# Set active pane.
select_pane 0

# Run commands.
run_cmd "vim" 0         # runs in active pane
run_cmd "source ../bin/activate;" 1     # runs in pane 1
run_cmd "source ../bin/activate; ./test.sh" 2     # runs in pane 2
