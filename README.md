# docker-on-debian-circleci

[![CircleCI](https://circleci.com/gh/mumblepins/docker-on-debian-circleci.svg?style=shield)](https://circleci.com/gh/mumblepins/docker-on-debian-circleci)

[![](https://images.microbadger.com/badges/commit/mumblepins/docker-on-debian-circleci.svg)](https://github.com/mumblepins/docker-on-debian-circleci)[![](https://images.microbadger.com/badges/image/mumblepins/docker-on-debian-circleci.svg)](https://microbadger.com/images/mumblepins/docker-on-debian-circleci "Get your own image badge on microbadger.com")

Docker on Debian for CircleCI

Added to base `buildpack-deps` package:

* Docker CE
* pip
* lz4 (useful for packing docker for persistent storage)
* A get_version script that will return the next patch version from DockerHub
