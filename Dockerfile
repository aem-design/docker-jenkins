FROM        aemdesign/jenkins-base:latest

MAINTAINER  devops <devops@aem.design>

LABEL   os="centos" \
        docker.source="https://hub.docker.com/_/jenkins/" \
        docker.dockerfile="https://github.com/jenkinsci/docker/blob/master/Dockerfile" \
        container.description="extended Jenkins image to allow configuration during image build" \
        version="1.0.0" \
        imagename="jenkins" \
        test.command=" java -version 2>&1 | grep 'java version' | sed -e 's/.*java version "\(.*\)".*/\1/'" \
        test.command.verify="1.8"

# This is not working
ENV PATH="/var/jenkins_tools/vault-cli-3.2.9-SNAPSHOT/bin:${PATH}"
ENV TEST_VAR="LIU"

COPY jenkins.install.UpgradeWizard.state /var/lib/$JENKINS_USER/
COPY tcp-slave-agent-port.groovy /usr/share/$JENKINS_USER/ref/init.groovy.d/
COPY jenkins.CLI.xml $JENKINS_HOME

COPY plugins_extra.txt /usr/share/jenkins/ref/plugins_extra.txt
RUN xargs /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins_extra.txt
