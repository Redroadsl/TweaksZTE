#!/system/bin/sh
# TouchTweakZTE/boot-completed.sh
# https://github.com/Redroadsl/TweaksZTE

# 努比亚红魔跟手触控脚本
# Uses KernelSU module config system for persistent settings (ksud module config)

# === Helper: load a setting from KSU config, keep default if absent ===
_get_cfg() {
    local val
    val=$(ksud module config get "$1" 2>/dev/null)
    [ -n "$val" ] && eval "$1=\"$val\""
}

# === Default values (fallback when no config exists) ===
play_game=1
follow_hand_level=0
stability_level=0
sensibility=4
edge_algo_open=0
edge_jitter_pixel=0
edge_jitter_timer=0
edge_click_pixel=0
edge_long_press_open=0
edge_long_press_timer=0
edge_long_press_pixel="0,0,0,0"
edge_overall=0

# === Load user config from KSU module config system ===
_get_cfg play_game
_get_cfg follow_hand_level
_get_cfg stability_level
_get_cfg sensibility
_get_cfg edge_algo_open
_get_cfg edge_jitter_pixel
_get_cfg edge_jitter_timer
_get_cfg edge_click_pixel
_get_cfg edge_long_press_open
_get_cfg edge_long_press_timer
_get_cfg edge_long_press_pixel
_get_cfg edge_overall

# === Apply settings ===

# 打开游戏模式 / Game mode
echo "$play_game" > /proc/touchscreen/play_game 2>/dev/null || true

# 跟手性延迟 / Follow hand level
echo "$follow_hand_level" > /proc/touchscreen/follow_hand_level 2>/dev/null || true

# 稳定性等级 / Stability level
echo "$stability_level" > /proc/touchscreen/stability_level 2>/dev/null || true

# 灵敏度 / Sensitivity
echo "$sensibility" > /proc/touchscreen/sensibility 2>/dev/null || true

# 边缘抑制与抖动过滤 / Edge & jitter settings
echo "algo_open:$edge_algo_open" > /proc/touchscreen/edge_report_limit 2>/dev/null || true
echo "jitter_pixel:$edge_jitter_pixel" > /proc/touchscreen/edge_report_limit 2>/dev/null || true
echo "jitter_timer:$edge_jitter_timer" > /proc/touchscreen/edge_report_limit 2>/dev/null || true
echo "click_pixel:$edge_click_pixel" > /proc/touchscreen/edge_report_limit 2>/dev/null || true
echo "long_press_open:$edge_long_press_open" > /proc/touchscreen/edge_report_limit 2>/dev/null || true
echo "long_press_timer:$edge_long_press_timer" > /proc/touchscreen/edge_report_limit 2>/dev/null || true
echo "long_press_pixel:$edge_long_press_pixel" > /proc/touchscreen/edge_report_limit 2>/dev/null || true

# 总体调整 / Overall
echo "$edge_overall" > /proc/touchscreen/edge_report_limit 2>/dev/null || true
