#!/bin/sh

# adb shell mv /usr/share/qt-superbird-app/webapp /tmp/webapp-orig
# adb shell mv /tmp/webapp-orig /usr/share/qt-superbird-app/ # it's ok if this fails
# adb shell rm -r /tmp/webapp-orig
adb shell mount -o remount,rw /
adb shell mv /usr/share/qt-superbird-app/webapp /tmp/webapp-orig
adb shell mv /tmp/webapp-orig /usr/share/qt-superbird-app/ # it's ok if this fails
# adb shell mv /usr/share/qt-superbird-app/webapp-orig /tmp/  # it's ok if this fails

adb shell rm -r /tmp/webapp-orig
adb shell rm -rf /usr/share/qt-superbird-app/webapp/*
adb push ./dist/* /usr/share/qt-superbird-app/webapp
adb reboot

# adb reverse tcp:5501 tcp:5501
#adb shell supervisorctl restart chromium


adb shell mount -o remount,rw /
adb shell rm -rf /usr/share/qt-superbird-app/webapp/*
adb push dist /usr/share/qt-superbird-app/webapp/
adb reboot

adb shell mount -o remount,rw /
adb shell rm -rf /usr/share/qt-superbird-app/webapp/*
adb push dist/* /usr/share/qt-superbird-app/webapp/
adb reboot