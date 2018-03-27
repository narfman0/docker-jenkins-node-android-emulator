FROM narfman0/docker-jenkins-node-android-sdk

ENV ANDROID_PACKAGE "system-images;android-27;google_apis_playstore;x86"
ENV ANDROID_SDK_ROOT=$ANDROID_HOME
ENV PATH $ANDROID_HOME/emulator:$PATH

RUN apt-get install -y libqt5widgets5

# install emulator package
RUN echo "y" | sdkmanager "emulator" $ANDROID_PACKAGE && \
    yes | sdkmanager --licenses && \
    chmod -R 777 $ANDROID_HOME

USER jenkins
RUN echo "no" | avdmanager create avd -f -k $ANDROID_PACKAGE -n test -b google_apis_playstore/x86
#RUN echo "no" | emulator64-x86 -avd test -noaudio -no-window -gpu off -verbose -qemu -usbdevice tablet -vnc :0
