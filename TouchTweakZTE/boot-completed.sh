#!/system/bin/sh
# TouchTweakZTE/boot-completed.sh
# https://github.com/Redroadsl/TweaksZTE

# 努比亚红魔跟手触控脚本

# 打开游戏模式
echo 1 > /proc/touchscreen/play_game

# 最高跟手
echo 0 > /proc/touchscreen/follow_hand_level

# 最低稳定
echo 0 > /proc/touchscreen/stability_level

# 最高灵敏度
echo 4 > /proc/touchscreen/sensibility

# 关闭边缘抑制
echo "algo_open:0" > /proc/touchscreen/edge_report_limit

# 关闭抖动过滤
echo "jitter_pixel:0" > /proc/touchscreen/edge_report_limit
echo "jitter_timer:0" > /proc/touchscreen/edge_report_limit

# 关闭点击稳定
echo "click_pixel:0" > /proc/touchscreen/edge_report_limit

# 缩短长按判定延迟
echo "long_press_open:0" > /proc/touchscreen/edge_report_limit
echo "long_press_timer:0" > /proc/touchscreen/edge_report_limit
echo "long_press_pixel:0,0,0,0" > /proc/touchscreen/edge_report_limit

# 总体调整
echo 0 > /proc/touchscreen/edge_report_limit
