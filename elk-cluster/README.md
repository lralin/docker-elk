# Elastic stack (ELK) on Docker
[官方文档 docker-compose 一键安装ELK集群](https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#docker-compose-file)

Install Docker Compose. Visit the Docker Compose docs to install Docker Compose for your environment.

If you’re using Docker Desktop, Docker Compose is installed automatically. Make sure to allocate at least 4GB of memory to Docker Desktop. You can adjust memory usage in Docker Desktop by going to Settings > Resources.

Create or navigate to an empty directory for the project.
Download and save the following files in the project directory:

使用当前目录下的对应文件

`.env`

`docker-compose.yml`

In the .env file, specify a password for the ELASTIC_PASSWORD and KIBANA_PASSWORD variables.

The passwords must be alphanumeric and can’t contain special characters, such as ! or @. The bash script included in the docker-compose.yml file only works with alphanumeric characters. Example:
```
# Password for the 'elastic' user (at least 6 characters)
ELASTIC_PASSWORD=changeme

# Password for the 'kibana_system' user (at least 6 characters)
KIBANA_PASSWORD=changeme
```
In the .env file, set STACK_VERSION to the current Elastic Stack version.

```
# Version of Elastic products
STACK_VERSION=8.13.0
```
By default, the Docker Compose configuration exposes port 9200 on all network interfaces.

To avoid exposing port 9200 to external hosts, set ES_PORT to 127.0.0.1:9200 in the .env file. This ensures Elasticsearch is only accessible from the host machine.

```
# Port to expose Elasticsearch HTTP API to the host
#ES_PORT=9200
ES_PORT=127.0.0.1:9200
```
To start the cluster, run the following command from the project directory.
```
docker-compose up -d
```
After the cluster has started, open http://localhost:5601 in a web browser to access Kibana.
Log in to Kibana as the elastic user using the ELASTIC_PASSWORD you set earlier.