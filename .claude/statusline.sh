#!/usr/bin/env bash

input=$(cat)

model=$(jq -r '.model.display_name // .model.id // "Claude"' <<< "$input")
used=$(jq -r '.context_window.total_input_tokens + .context_window.total_output_tokens' <<< "$input")
limit=$(jq -r '.context_window.context_window_size' <<< "$input")
percent=$(jq -r '.context_window.used_percentage // 0' <<< "$input")
cost=$(jq -r '.cost.total_cost_usd // 0' <<< "$input")

# Format token counts as e.g. 47k / 200k
format_tokens() {
    local n="$1"

    if (( n >= 1000000 )); then
        awk "BEGIN {printf \"%.1fm\", $n/1000000}"
    elif (( n >= 1000 )); then
        awk "BEGIN {printf \"%.0fk\", $n/1000}"
    else
        printf "%s" "$n"
    fi
}

printf '%s │ Context: %s / %s (%.0f%%) │ Session: $%.2f' \
    "$model" \
    "$(format_tokens "$used")" \
    "$(format_tokens "$limit")" \
    "$percent" \
    "$cost"
