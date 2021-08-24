# 文本处理命令：json格式化文本，过滤出contentType，再进行排序
cat data.txt | python -m json.tool | grep contentType | sort | uniq

# 搜索目录下某个名称的文件名，并搜索每个文件里头的keyword
find ./ -name "filename" | xargs grep -rn "keyword" {}
