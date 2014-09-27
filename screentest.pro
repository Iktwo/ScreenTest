QT += qml quick widgets svg

android {
    QT += androidextras gui-private
}

TEMPLATE = app

SOURCES += \
    src/main.cpp \
    src/uivalues.cpp

HEADERS += \
    src/uivalues.h

OTHER_FILES += \
    qml/main.qml \
    android/AndroidManifest.xml \
    android/src/com/iktwo/screentest/ScreenTest.java \
    qml/ComponentsData.qml

RESOURCES += resources.qrc

include(deployment.pri)

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

