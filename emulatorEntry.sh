#!/bin/sh
emulator64-arm -avd test -noaudio -no-window -ranchu -gpu off -verbose&
jenkins-slave "$@"
