This repository contains necessary material to build and publish doc with mkdocs. The docker image aims at beeing used with Drone and take a `PLUGIN_TOKEN` as environment variable.

## Usage

The program can be run using command line. A Github token is required to publish the documentation in `gh-pages` of your github repo. 


```
./mkdocs_deploy.sh -h
  mkdocs deploy to a remote repository
  Udate: mkdocs_deploy.sh [OPTION...]
  Arguments:
    -t, --token         Token to upload
    -h, --help          This message
```


## Trigger

Use with drone:

```yml
steps:
  - name: Pushish documentation 
    image: thehiveproject/mkdocs
    settings:
      - token: { from_secret: github_token }
    when:
      branch:
      - master
```