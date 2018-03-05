# docker-jenkins-node-android-emulator

Dockerfile for jenkins nodes that need to run android emulators. Built
for jenkins running gradle connected tests, but could be adapted for
other nefarious purposes.

## Usage

Grab from docker cloud with: `docker pull narfman0/docker-jenkins-node-android-emulator`

You must have jenkins security enabled, which yields a secret per-node. Then
you should have name, secret, and host/ip needed to run:

`docker run --user jenkins narfman0/docker-jenkins-node-android-emulator:latest -url http://$JENKINS_HOST:8080 $NODE_SECRET $NODE_NAME`

### Building locally

To build locally, use:

`docker build . -t docker-jenkins-node-android-emulator`

## License

Copyright 2018 Jon Robison

See LICENSE for details
