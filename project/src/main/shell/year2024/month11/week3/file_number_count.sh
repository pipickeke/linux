#!/bin/bash

# 题目：用于统计文本中每行内容出现数字的个数，以及个数的总数

#1, 参数判断
if [ $# -lt 1 ]
then
    echo "No Args..."
    exit 1
fi

#2, 统计有多少行
N=$(wc -l $1 | awk '{print $1}')
#3, 数字总个数
total_sum=0
#4, 开始遍历
for i in $(seq 1 $N)
do
    # 4.1 筛选出当前行
    cur_line=$(sed -n "$i"p $1)
    #4.2 利用 sed 的正则匹配，筛选出数字的个数
    cnt=$(echo $cur_line | sed 's/[^0-9]//g' | wc -L )
    echo "line: $i number of digit is: $cnt"
    #4.3 计数
    total_sum=$((total_sum+cnt))

done
echo "total sum: $total_sum"