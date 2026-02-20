#!/usr/bin/env bash

MAX_TITLE_LEN=20

print_status() {
    window=$(hyprctl activewindow -j 2>/dev/null)
    address=$(echo "$window" | jq -r '.address // empty')

    if [[ -n "$address" && "$address" != "null" ]]; then
        class=$(echo "$window" | jq -r '.class // "Unknown"')
        title=$(echo "$window" | jq -r '.title // ""')

        app_class=$(echo "$class" | tr '[:upper:]' '[:lower:]')

        if [[ "$app_class" == *discord* || "$app_class" == *vesktop* ]]; then
            title=$(echo "$title" | sed -E 's/^\([0-9]+\)[[:space:]]*//')
            title=$(echo "$title" | sed -E 's/^Discord[[:space:]]*\|[[:space:]]*//')
        fi

        if [ ${#title} -gt $MAX_TITLE_LEN ]; then
            title="${title:0:$((MAX_TITLE_LEN-3))}..."
        fi

        # SWAPPED
        top_line="$class"
        bottom_line="$title"

else
    # Hide module completely on empty workspace
    jq -nc '{ text: "", class: "custom-window", tooltip: "" }'
    return
fi

    esc_top=$(printf '%s\n' "$top_line" | sed 's/&/&amp;/g; s/</&lt;/g; s/>/&gt;/g')
    esc_bottom=$(printf '%s\n' "$bottom_line" | sed 's/&/&amp;/g; s/</&lt;/g; s/>/&gt;/g')

    text="<span size='7500' foreground='#a6adc8' rise='-2000'>$esc_top</span>
<span size='9000' weight='bold' foreground='#ffffff'>$esc_bottom</span>"

    jq -nc \
        --arg text "$text" \
        --arg tooltip "$top_line: $bottom_line" \
        '{ text: $text, class: "custom-window", tooltip: $tooltip }'
}

while true; do
    print_status
    sleep 0.2
done
