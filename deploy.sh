#!/bin/bash

set -xe

docker run -t docker.gocd.cf-app.com:5000/pong-matcher-grails /bin/bash -c "\
    cd pong_matcher_grails
    ./grailsw war &&
    cf api https://api.run.pivotal.io &&
    cf auth $CF_USERNAME $CF_PASSWORD &&
    cf target -o $CF_ORG -s $CF_SPACE &&
    cf push -n $HOSTNAME -d cfapps.io"
