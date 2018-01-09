# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
window_root "~/Projects/playground/js/my-app/"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "react-tutorial"

# Split window into panes.
split_h 40 
split_v 40

# Set active pane.
select_pane 0

# Run commands.
run_cmd "vim" 0         # runs in active pane
run_cmd "" 1     # runs in pane 1
run_cmd "npm start" 2     # runs in pane 2
