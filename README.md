# ASP.NET Core Docker Builds

A container that will allow you to build docker images for ASP.NET core applications.

If you use the Yeoman docker generator (https://github.com/Microsoft/generator-docker) for .net core, you can use this image when running Gitlab CI to build your applications in a docker container. I am using the gitlab docker build runner, but this container is not specific to gitlab.

This also includes nodejs and npm dependencies, such as bower and grunt-cli.

Example .gitlab-ci.yaml:

```yml
image: mrgeoffrich/aspnetcoredocker:latest

before_script:
- docker info
- docker-compose --version
- dotnet --version
- npm -v
- node -v

build:
  stage: build
  script:
  - dotnet restore
  - dotnet publish -f "netcoreapp1.0" -r "debian.8-x64" -c release -o bin/release/netcoreapp1.0/publish
  - docker build -t myapp:latest bin/release/netcoreapp1.0/publish 
  - docker push myapp:latest
```
