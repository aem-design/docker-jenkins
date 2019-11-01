## CentOS 7 with Jenkins

[![build_status](https://travis-ci.org/aem-design/docker-jenkins.svg?branch=master)](https://travis-ci.org/aem-design/docker-jenkins) 
[![github license](https://img.shields.io/github/license/aem-design/jenkins)](https://github.com/aem-design/jenkins) 
[![github issues](https://img.shields.io/github/issues/aem-design/jenkins)](https://github.com/aem-design/jenkins) 
[![github last commit](https://img.shields.io/github/last-commit/aem-design/jenkins)](https://github.com/aem-design/jenkins) 
[![github repo size](https://img.shields.io/github/repo-size/aem-design/jenkins)](https://github.com/aem-design/jenkins) 
[![docker stars](https://img.shields.io/docker/stars/aemdesign/jenkins)](https://hub.docker.com/r/aemdesign/jenkins) 
[![docker pulls](https://img.shields.io/docker/pulls/aemdesign/jenkins)](https://hub.docker.com/r/aemdesign/jenkins) 
[![github release](https://img.shields.io/github/release/aem-design/jenkins)](https://github.com/aem-design/jenkins)

This is docker image based on [aemdesign/jenkins-base](https://hub.docker.com/r/aemdesign/jenkins-base/) with Jenkins Plugins Installed

One image for Jenkins Master, Slave and build agent

### Included Packages

Please refer to included packages specified by aemdesign/jenkins-base

### Environment Variables

Please refer to environment variable specified by aemdesign/jenkins-base

### Volumes

Following volumes are exposed

| Path | Notes  |
| ---  | ---    |
| "/var/jenkins_home" | Jenkins home directory|
| "/var/jenkins_conf" | Jenkins configuration directory |
| "/var/jenkins_tools" | Jenkins tools directory|

### Ports

Please refer to available ports specified by aemdesign/jenkins-base

### Included Plugins

In addition to all plugins installed by aemdesign/jenkins-base, extra plugins should be specified in plugins_extra.txt

### Usage

> docker run -v jenkins_home:/var/jenkins_home -v $(pwd)/aemdesign-jenkins/casc_configs:/var/jenkins_conf -v $(pwd)/aemdesign-jenkins/tools:/var/jenkins_tools -p 8080:8080 aemdesign/jenkins-base

and aemdesign-jenkins contains sample CASC configurations to run AEM, it can be cloned from https://github.com/aem-design/aemdesign-jenkins
