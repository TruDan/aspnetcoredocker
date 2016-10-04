# ASP.NET Core Docker Builds

Docker file for a container that will allow you to build docker images for .net core applications.

If you use the Yeoman docker generator (https://github.com/Microsoft/generator-docker) for .net core, 
this image you can use when running Gitlab CI to build your applications in docker.

Example .gitlab-ci.yaml:

```yml
image: docker:latest
before_script:
- docker info
- docker-compose --version
build:
  stage: build
  script:
  - ./dockerTask.sh build release
  - docker push someplace/somerepo:latest
```
