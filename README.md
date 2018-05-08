CPU Pipeline Parts Verilog Code Auto Generator
--------------------------
### Authored by Fluorine Dog


# 简介

这里是一个简单的流水线接口自动生成脚本，可以极大简化Verilog CPU设计工作。

# 功能

根据inc/Laji_defines_inc.vh（变量名定义文件），自动检测其中需要接入流水线接口的变量，
并生成相应的流水线接口。

生成的流水线接口分为两部分。
1. 流水线模块定义，也就是 SynPS1.v, SynPS2.v, SynPS3.v, SynPS4.v
这四个文件，内容是带enable端(en_vpsX)、异步清零接口(clear_vpsX)的流水线模块。
2. 流水线模块连接代码，也就是inc文件夹下的Laji_vPSx_inc.vh文件系列，
在主模块直接`include即可使用

# 命名规范

使用这个脚本，变量名需要参照一定的命名风格。

5个流水线阶段(Pipeline Stage)中需要被放上流水线的变量
分别命名xx_ps0, xx_ps1, xx_ps2, xx_ps3, xx_ps4。

脚本会自动检测相邻流水线阶段中的关键字相同的
变量对 keyword_ps(N-1)和keyword_psN，
解析其类型（主要指位宽）并在SynPS(N.v)中给出定义，
在Laji_vPS(N)_inc.vh中直接连线。对于不满足xx_psX命名风格的变量，
脚本会自动忽略，比如定义的clear_vps2, clear_vps3并不会进入流水线接口。

当然也可以自行修改脚本满足自己的需求。

# 参考样例
比如如果32位宽的数据data在ALU阶段（ps2）产生，在WB阶段（ps4）使用，那应该在 Laji_defines_inc.vh 写下如下定义
```
wire [31:0] data_ps2;           // reg is also OK if needed

wire [31:0] data_ps3, data_ps4; // cannot use reg here
```

然后运行 gen.py 脚本自动生成。这样，data_ps2的数据就会自动经过SynPS3、SynPS4两个流水部件, 两个周期后到达data_ps4。
