FROM narfman0/docker-jenkins-node-android-sdk

# vnc port
EXPOSE 5900

ENV ANDROID_PACKAGE "system-images;android-25;google_apis;armeabi-v7a"
ENV ANDROID_SDK_ROOT=$ANDROID_HOME
ENV PATH $ANDROID_HOME/emulator:$PATH

RUN apt-get install -y libqt5widgets5

# install emulator package
RUN echo "y" | sdkmanager "emulator" $ANDROID_PACKAGE && \
    yes | sdkmanager --licenses && \
    chmod -R 777 $ANDROID_HOME

USER jenkins
RUN echo "no" | avdmanager create avd -f -k $ANDROID_PACKAGE -n test -b google_apis/armeabi-v7a

ADD emulatorEntry.sh /usr/local/bin/emulatorEntry.sh

ENTRYPOINT ["emulatorEntry.sh"]
