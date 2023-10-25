# Autoconfigure Tide theme (new in v6)
# Only need to run this once, after installing OR to reset back to original state

function tide-custom-autoconfigure
    tide configure \
        --auto \
        --style=Rainbow \
        --prompt_colors='True color' \
        --show_time='12-hour format' \
        --rainbow_prompt_separators=Round \
        --powerline_prompt_heads=Round \
        --powerline_prompt_tails=Flat \
        --powerline_prompt_style='Two lines, character' \
        --prompt_connection=Dotted \
        --powerline_right_prompt_frame=No \
        --prompt_connection_andor_frame_color=Dark \
        --prompt_spacing=Sparse \
        --icons='Many icons' \
        --transient=No
end
