#!/system/bin/sh
#by Redroadsl ver1
#努比亚红魔跟手触控脚本检测脚本（以root权限运行）

echo 检测触控设置状态

echo 触摸游戏模式开关
cat /proc/touchscreen/play_game

echo 跟手性延迟
cat /proc/touchscreen/follow_hand_level

echo 稳定性等级
cat /proc/touchscreen/stability_level

echo 灵敏度等级
cat /proc/touchscreen/sensibility

echo 硬件回报率
cat /proc/touchscreen/tp_report_rate

echo 详细算法设置
cat /proc/touchscreen/edge_report_limit
