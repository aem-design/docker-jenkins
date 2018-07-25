FROM        aemdesign/jenkins-base:latest

MAINTAINER  devops <devops@aem.design>

LABEL       container.description="extended Jenkins image to allow configuration during image build"

ENV JENKINS_SLAVE_COUNT=2 \
    JENKINS_HOME="/var/jenkins_home" \
    JENKINS_SLAVE_AGENT_PORT=50000 \
    JENKINS_UID=10001 \
    JENKINS_USER="jenkins" \
    JENKINS_GUID=10001 \
    JENKINS_GROUP="jenkins"


# this should be used with DOCKER RUN when running as slave
# docker run -d -p 8122:22 devops/jenkins /usr/sbin/sshd -D

USER root

COPY plugins.txt /usr/share/$JENKINS_USER/plugins.txt
COPY jenkins.install.UpgradeWizard.state /var/lib/$JENKINS_USER/
COPY tcp-slave-agent-port.groovy /usr/share/$JENKINS_USER/ref/init.groovy.d/
COPY init-create-user.groovy /usr/share/$JENKINS_USER/ref/init.groovy.d/
COPY jenkins.CLI.xml $JENKINS_HOME

#add ssl
#COPY https.pem /var/lib/$JENKINS_USER/cert
#COPY https.key /var/lib/$JENKINS_USER/pk
#ENV JENKINS_OPTS --httpPort=-1 --httpsPort=8083 --httpsCertificate=/var/lib/$JENKINS_USER/cert --httpsPrivateKey=/var/lib/$JENKINS_USER/pk
#EXPOSE 8083

RUN install-plugins.sh $(while read line; do echo -n " $line"; done < /usr/share/$JENKINS_USER/plugins.txt)


EXPOSE 22

USER $JENKINS_USER

