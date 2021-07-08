# 文本处理命令
cat data.txt | python -m json.tool | grep contentType | sort | uniq
