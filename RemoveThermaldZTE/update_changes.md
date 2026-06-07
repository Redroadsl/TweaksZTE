# 更新内容 - RemoveThermaldZTE

*新版本: Cube 3*

*更新日期：20260608.* 

- 删除了无用的覆盖配置文件；
- 在boot-completed.sh中，修改了所有结束服务的方法（kill -> setprop ctl.stop）；
- 在boot-completed.sh中，单独添加了针对thermal-engine的延迟结束代码，因为此服务会延迟启动或被其他组件唤醒，所以在启动完成后10秒内检测并关闭thermal-engine；
- 在action.sh中，排除了脚本自身干扰项；
- 其他优化改进。

感谢使用TweaksZTE系列模块，欢迎提交issue或做出你的贡献。

[点击访问：RemoveThermaldZTE](https://github.com/Redroadsl/TweaksZTE/RemoveThermaldZTE "访问项目地址（Github）")