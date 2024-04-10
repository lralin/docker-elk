ARG ELASTIC_VERSION

# https://www.docker.elastic.co/
FROM docker.elastic.co/logstash/logstash:${ELASTIC_VERSION}

# 在安装tzdata之前最好先update和upgrade，以防apt-get获取不到tzdata
RUN apt-get update -y && apt-get upgrade -y
# 安装，中国用户填写[Asia/Shanghai] ，表示亚洲/上海 ，东八区
RUN apt-get install -y tzdata && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
# Add your logstash plugins setup here
# Example: RUN logstash-plugin install logstash-filter-json
RUN logstash-plugin install logstash-codec-json_lines