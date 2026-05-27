#!/system/bin/sh
# 检测 ZTE 设备上的关键服务与属性状态

echo "==========================="
echo " ZTE 系统调度与温控状态检测"
echo

# 排除干扰项
EXCLUDE_PATTERN="grep"


# 检测 cube 相关进程
echo
echo "> 名称包含 cube 的进程"
ps -A | grep -i cube | grep -v "$EXCLUDE_PATTERN"
if [ $? -ne 0 ]; then
    echo "  未找到任何与 cube 相关的进程"
fi


# 检测 zperf 相关属性
echo
echo "> 名称包含 zperf 的属性"
getprop | grep -i zperf
if [ $? -ne 0 ]; then
    echo "  未找到任何与 zperf 相关的属性"
fi


# 检测 zperf 相关进程
echo
echo "> 名称包含 zperf 的进程"
ps -A | grep -i zperf | grep -v "$EXCLUDE_PATTERN"
if [ $? -ne 0 ]; then
    echo "  未找到任何与 zperf 相关的进程"
fi


# 检测 perf 相关进程
echo
echo "> 名称包含 perf 的进程"
ps -A | grep -i perf | grep -v "$EXCLUDE_PATTERN"
if [ $? -ne 0 ]; then
    echo "  未找到任何与 perf 相关的进程"
fi


# 检测 thermal 相关属性
echo
echo "> 名称包含 thermal 的属性"
getprop | grep -i thermal
if [ $? -ne 0 ]; then
    echo "  未找到任何与温控相关的属性"
fi


# 检测 thermal 相关进程
echo
echo "> 名称包含 thermal 的进程"
ps -A | grep -i thermal \
    | grep -v "android.hardware.thermal-service.qti" \
    | grep -v "$EXCLUDE_PATTERN"
if [ $? -ne 0 ]; then
    echo "  未找到其他 thermal 相关进程"
fi

# 检测ai引擎进程
echo
echo "> AI引擎进程 com.zte.aiengine"
ps -A | grep "com.zte.aiengine" | grep -v "$EXCLUDE_PATTERN"
if [ $? -ne 0 ]; then
    echo "  未找到ai引擎进程"
fi



# 检查关键服务的 init.svc 状态
echo
echo "> 检查调度与温控状态"
for svc in zperfcubesevice thermal-engine; do
    status=$(getprop init.svc.$svc 2>/dev/null)
    if [ -n "$status" ]; then
        echo "init.svc.$svc = $status"
    fi
done


# 单独检测 ro.vendor.feature.zte_feature_zperf_cube 属性
echo
echo "> 检查 ro.vendor.feature.zte_feature_zperf_cube 属性"
value=$(getprop ro.vendor.feature.zte_feature_zperf_cube)
if [ -n "$value" ]; then
    echo "  ro.vendor.feature.zte_feature_zperf_cube = $value"
else
    echo "  ro.vendor.feature.zte_feature_zperf_cube = (未设置)"
fi

echo
echo "检测完成。"
echo "==========================="
