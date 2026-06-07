#!/system/bin/sh
# RemoveThermaldZTE/boot-completed.sh
# https://github.com/Redroadsl/TweaksZTE

# 去除温控和调度脚本 改自酷安@关于被取名困扰这事儿


# 停止擎天引擎服务
setprop ctl.stop zperfcubesevice

# 停止高通调度框架
setprop ctl.stop perfservice

# 杀死并隐藏AI引擎
ps -A | grep -E "com.zte.aiengine" | awk '{print $2}' | xargs kill -9 2>/dev/null
pm hide --user 0 com.zte.aiengine

# 停止努比亚安全守护进程
setprop ctl.stop nubiahealthd

# 停止温控进程，隐藏温控应用
pm hide --user 0 com.zte.thermald
pm hide --user 0 com.zte.thermalbridge
setprop ctl.stop thermald
setprop ctl.stop thermal-engine
setprop ctl.stop thermalbridge

# 杀掉所有相关进程
kill -9 $(pgrep -f "zperfcube") 2>/dev/null
kill -9 $(pgrep -f "com.zte.thermald") 2>/dev/null
kill -9 $(pgrep -f "com.zte.thermalbridge") 2>/dev/null

# 针对thermal engine的结束脚本
elapsed=0
while [ $elapsed -lt 10 ]; do
    if getprop init.svc.thermal-engine | grep -q "running"; then
        # 尝试停止服务
        setprop ctl.stop thermal-engine
    else
        break
    fi
    sleep 1
    elapsed=$((elapsed + 1))
done

