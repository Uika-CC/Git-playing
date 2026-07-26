#v1的日志脚本先以分析日志为主，暂时不产生日志
#先创建一个nginx_access.log，手动往里面塞日志，然后用这个脚本去分析

#!/bin/bash
LOG_FILE="nginx_access.log"

echo "=====日志分析报告====="

echo ""

echo "1.总访问量："
wc -l $LOG_FILE

echo "2.状态码统计："
awk '{print $NF}' nginx_access.log  #$NF表示最后一个字段

echo "3.各个状态码的请求次数"
awk '{print $NF}' nginx_access.log | sort | uniq -c

echo "4.访问最多的IP"
awk '{print $1}' nginx_access.log | sort | uniq -c | sort -nr  #sort -nr：-n表示按数值大小排序，-r表示从大到小排序
                                         #这里可以加head也可以不加，head -n表示取钱n行，以后ip多了最好加一下
echo ""

echo "======================"