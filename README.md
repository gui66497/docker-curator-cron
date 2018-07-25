# Curator CRON task in Docker 

Dockerized version of [Elasticsearch Curator](https://github.com/elastic/curator) run as CRON daily task. Useful for production, maintanence-free, deployment to manage time-based indices.



## Compatibility Matrix

|Version/Branch | ES 1.x   | AWS ES 1.x | ES 2.x   | AWS ES 2.x | ES 5.x   | AWS ES 5.x | ES 6.x     |
|---------------|----------|------------|----------|------------|----------|------------|------------|
|  3.x          |    yes   |     yes*   |   yes    |     yes*   |   no     |     no     |     no     |
|  4.x          |    no    |     no     |   yes    |     no     |   yes    |     no     |     no     |
|  5.x          |    no    |     no     |   no     |     no     |   yes    |     yes*   |     no     |
|  5.4          |    no    |     no     |   no     |     no     |   yes    |     yes*   |     yes    |
|  5.5          |    no    |     no     |   no     |     no     |   yes    |     yes*   |     yes    |

\* It appears that AWS ES does not allow access to the snapshot status endpoint for either 1.x or 2.x versions. This prevents Curator 3 from being used to make snapshots.

## Why this image

This image allows you to deploy scheduled Curator task as Docker container in fraction of second. There are couple of good
images that run the command just once. But if you use infrastructure like AWS ECS, Kubernetes and similar, you may want to
start one container that runs as a service and keeps your Elasticsearch indices tidy.

## Usage

Image entrypoint is set to curator script wrapper, that creates daily CRON task and starts `crond`. Use transparently as
you would run `curator` command directly:

You have to provide your curator job settings in a action file. Samples can be found here `https://www.elastic.co/guide/en/elasticsearch/client/curator/current/actionfile.html`

```
docker run --rm traumfewo/docker-curator-cron:5.5 <path to ACTION_FILE.YML>
```
