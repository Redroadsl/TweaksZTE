#!/system/bin/sh

#关闭内核守护
#resetprop ro.vendor.feature.zte_feature_zperf_cube false

#关闭内核温控（红魔老机子专属特性）
#resetprop ro.vendor.feature.zte_feature_cube_thermallevel_control false

#关闭内核网络温控（红魔老机子专属特性）
#resetprop ro.vendor.feature.zte_feature_thermal_networklimit false

#禁用擎天引擎服务
stop zperfcubesevice

#禁用高通调度框架
stop perfservice

#杀死ai引擎进程
ps -A | grep -E "com.zte.aiengine" | awk '{print $2}' | xargs kill -9 2>/dev/null
#pgrep -f "com.zte.aiengine"

#隐藏ai引擎应用
pm hide --user 0 com.zte.aiengine

#禁用努比亚安全守护进程
stop nubiahealthd

#禁用温控
stop thermald
stop thermal-engine
stop thermalbridge

pm hide --user 0 com.zte.thermald
pm hide --user 0 com.zte.thermalbridge

# 失效规则
#setprop persist.vendor.zte.thermal.block=1
#setprop persist.vendor.ai.dps.stop=1

# 杀掉所有相关进程
kill -9 $(pgrep -f "zperfcube") 2>/dev/null
kill -9 $(pgrep -f "com.zte.thermald") 2>/dev/null
kill -9 $(pgrep -f "com.zte.thermalbridge") 2>/dev/null
