# docker-on-debian-circleci

[![CircleCI](https://circleci.com/gh/mumblepins/docker-on-debian-circleci.svg?style=shield)](https://circleci.com/gh/mumblepins/docker-on-debian-circleci)

[![](
https://images.microbadger.com/badges/commit/mumblepins/docker-on-debian-circleci.svg)](
https://github.com/mumblepins/docker-on-debian-circleci) [![](
https://images.microbadger.com/badges/image/mumblepins/docker-on-debian-circleci.svg)](
https://microbadger.com/images/mumblepins/docker-on-debian-circleci
"Get your own image badge on microbadger.com")

Docker on Debian for CircleCI

Added to base `buildpack-deps` package:

* Docker CE
* pip
* lz4 (useful for packing docker for persistent storage)
* A /usr/local/bin/get-version script that will return the next patch version from DockerHub

### get-version

```text
usage: get-version [-h] [-f VERSION_FILE] [-V SPEC_VERSION] [--ignore-file]
                   repository

Gets minimum semantic versioning patch version from Docker Hub.
If no VERSION file, returns maximum of Docker Hub version +1 patch version. 
If VERSION file exists, returns VERSION if that is greater than DockerHub
Major.Minor version, or +1 of same DockerHub Major.Minor version

Examples:
DockerHub has tags for 'name/repo':
  1.0.0
  1.0.1
  1.0.2
  1.1.0
  1.1.1
    
  VERSION file exists and is equal to:
    1.0.3:
      get-version name/repo
        returns: 1.0.3
      get-version name/repo -V 1.1.2
        returns: 1.1.2
      get-version name/repo -V 1.1
        returns: 1.1.2
    1.1.2:
      get-version name/repo
        returns: 1.1.2
      get-version name/repo -V 1.0
        returns: 1.0.3
    1.1:
      get-version name/repo
        returns: 1.1.2
    2.0
      get-version name/repo
        returns: 2.0.0
  VERSION file doesn't exist:
    get-version name/repo 1.1.2

positional arguments:
  repository       Repository name (e.g. mumblepins/docker-on-debian-circleci)

optional arguments:
  -h, --help       show this help message and exit
  -f VERSION_FILE  Other version file (default: VERSION)
  -V SPEC_VERSION  Specified minimum version (defaults to that found in
                   VERSION, overrides VERSION)
  --ignore-file    Ignores VERSION file if one exists```
