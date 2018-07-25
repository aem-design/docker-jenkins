#!groovy
import hudson.security.*
import hudson.util.*
import jenkins.model.*
import hudson.model.*

def instance = Jenkins.getInstance()

def currentScript = getClass().protectionDomain.codeSource.location.path

println "--> Running Server First Start Initial Config Script"

println "--> Script Location: " + currentScript

def secret = Secret.fromString("admin")
println(secret.getEncryptedValue())

println "--> Creating new admin"

def hudsonRealm = new HudsonPrivateSecurityRealm(false)
hudsonRealm.createAccount("admin", "admin")
instance.setSecurityRealm(hudsonRealm)
instance.save()

println "--> User created 'admin'"

println "--> Updating Security Strategy"

def strategy = new GlobalMatrixAuthorizationStrategy()
//def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
//strategy.setAllowAnonymousRead(false)
//strategy.add(Jenkins.ADMINISTER, "{{ jenkins_admin_username }}")
strategy.add(Jenkins.ADMINISTER, 'authenticated')
instance.setAuthorizationStrategy(strategy)
instance.save()

println "--> Updating Security Strategy updated"

println "--> Deleting Script: " + currentScript

boolean fileSuccessfullyDeleted =  new File(currentScript).delete()

println "--> Script Deleted: " + fileSuccessfullyDeleted