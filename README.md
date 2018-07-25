# Curator CRON task in Docker 

Dockerized version of [Elasticsearch Curator](https://github.com/elastic/curator) run as CRON daily task. Useful for production, maintanence-free, deployment to manage time-based indices.

[![Docker Pulls](https://img.shields.io/docker/pulls/traumfewo/docker-curator-cron.svg)](https://hub.docker.com/r/traumfewo/docker-curator-cron/)


## Compatibility Matrix

|Version/Branch | ES 1.x   | AWS ES 1.x | ES 2.x   | AWS ES 2.x | ES 5.x   | AWS ES 5.x |
|--------|----------|------------|----------|------------|----------|------------|
|    3.x   |    yes   |     yes*   |   yes    |     yes*   |   no     |     no     |
|    4.x   |    no    |     no     |   yes    |     no     |   yes    |     ?      |
|    5.x   |    no    |     no     |   no     |     no     |   yes    |     ?      |

\* It appears that AWS ES does not allow access to the snapshot status endpoint for either 1.x or 2.x versions. This prevents Curator 3 from being used to make snapshots.

## Why this image

This image allows you to deploy scheduled Curator task as Docker container in fraction of second. There are couple of good
images that run the command just once. But if you use infrastructure like AWS ECS, Kubernetes and similar, you may want to
start one container that runs as a service and keeps your Elasticsearch indices tidy.

## Usage

Image entrypoint is set to curator script wrapper, that creates daily CRON task and starts `crond`. Use transparently as
you would run `curator` command directly:

```
docker run --rm docx/curator-cron:3.4.0 --host 1.2.3.4 --port 80 delete indices --older-than 1 --time-unit days --timestamp '%Y.%m.%d'
```

