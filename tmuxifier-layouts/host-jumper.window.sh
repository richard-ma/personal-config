# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
window_root "~/Projects/host-jumper"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "host-jumper"

# Split window into panes.
#split_v 20
#split_h 50
split_v 20
split_h 40

# Set active pane.
select_pane 0

# Run commands.
#run_cmd "top"     # runs in active pane
#run_cmd "date" 1  # runs in pane 1
run_cmd "vim" 0         # runs in active pane
run_cmd "bundle" 1     # runs in pane 1
run_cmd "guard" 2     # runs in pane 2

# Paste text
#send_keys "top"    # paste into active pane
#send_keys "date" 1 # paste into active pane
