git 输出结果详解
    eth0      Link encap:Ethernet  HWaddr 52:54:00:FA:9E:91 
                 inet addr:192.168.129.46  Bcast:192.168.129.255    Mask:255.255.255.0
                inet6 addr: fe80::5054:ff:fefa:9e91/64 Scope:Link
                 UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
                RX packets:96430 errors:0 dropped:0 overruns:0 frame:0
                TX packets:10274 errors:0 dropped:0 overruns:0 carrier:0
                collisions:0 txqueuelen:1000
                RX bytes:19839082 (18.9 MiB)  TX bytes:733188 (716.0 KiB)
                Interrupt:11
 
    lo        Link encap:Local Loopback 
               inet addr:127.0.0.1  Mask:255.0.0.0
              inet6 addr: ::1/128 Scope:Host
               UP LOOPBACK RUNNING  MTU:65536  Metric:1
               RX packets:16 errors:0 dropped:0 overruns:0 frame:0
               TX packets:16 errors:0 dropped:0 overruns:0 carrier:0
               collisions:0 txqueuelen:0
               RX bytes:960 (960.0 b)  TX bytes:960 (960.0 b)
 
    eth0                       网卡设备号
    Link encap                 基本描述，链接概况
    HWaddr                     硬件MAC地址
 
    inet addr                  网络ip地址
    Bcast                      广播ip地址
    Mask                       子网掩码
 
    inet6 addr                 对应的ipv6地址
    Scope                      作用域，范围
 
    UP                         网卡已经启用
    BROADCAST                  支持广播
    RUNNING                    网卡正在运行
    MULTICAST                  支持多播
    MTU                        最大传输单元
    Metric                     度量值，用于估算路由
 
    RX packets:1673            接收时，总的正确数据包数
    errors:0                   接收时，总的错误数据包数
    dropped:0                  接收时，丢弃的数据包数
    overruns:0                 接收时，由于过速丢弃的数据
    frame:0                    接收时，由于frame错误而丢弃的数据包数
 
    TX packets:1675            发送时，正确的数据包数
    errors:0                   发送时，错误的数据包数
    dropped:0                  发送时，丢弃的数据包数
    overruns:0                 发送时，由于过速丢弃的数据包数
    carrier:0                  发送时，由于carrier错误而丢弃的数据包数
 
    collisions:0               冲突信息包的数目
    txqueuelen:1000            发送队列的大小，此处是1000MB
 
    RX bytes:605757 (591.5 KiB)  接收的数据包数
    TX bytes:297694 (290.7 KiB)  发送的数据包数
 
    Interrupt:42                 IRQ中断地址
    Base address:0x8000          基址
————————————————
metric是路由算法用以确定到达目的地的 最佳路径的计量标准，如路径长度

RX errors: 表示总的收包的错误数量，这包括 too-long-frames 错误，Ring Buffer 溢出错误，crc 校验错误，帧同步错误，fifo overruns 以及 missed pkg 等
RX dropped: 表示数据包已经进入了 Ring Buffer，但是由于内存不够等系统原因，导致在拷贝到内存的过程中被丢弃
RX overruns: 表示了 fifo 的 overruns，这是由于 Ring Buffer(aka Driver Queue) 传输的 IO 大于 kernel 能够处理的 IO 导致的，而 Ring Buffer 则是指在发起 IRQ 请求之前的那块 buffer。很明显，overruns 的增大意味着数据包没到 Ring Buffer 就被网卡物理层给丢弃了，而 CPU 无法即使的处理中断是造成 Ring Buffer 满的原因之一，上面那台有问题的机器就是因为 interruprs 分布的不均匀(都压在 core0)，没有做 affinity 而造成的丢包
RX frame: 表示 misaligned 的 frames