TEMPLATE = app

QT += qml quick widgets

SOURCES += main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../free-noteboard-common/release/ -lfree-noteboard-common
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../free-noteboard-common/debug/ -lfree-noteboard-common
else:unix: LIBS += -L$$OUT_PWD/../free-noteboard-common/ -lfree-noteboard-common

INCLUDEPATH += $$PWD/../free-noteboard-common
DEPENDPATH += $$PWD/../free-noteboard-common

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../free-noteboard-common/release/libfree-noteboard-common.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../free-noteboard-common/debug/libfree-noteboard-common.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../free-noteboard-common/release/free-noteboard-common.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../free-noteboard-common/debug/free-noteboard-common.lib
else:unix: PRE_TARGETDEPS += $$OUT_PWD/../free-noteboard-common/libfree-noteboard-common.a
