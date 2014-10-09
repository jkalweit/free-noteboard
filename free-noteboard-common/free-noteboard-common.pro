#-------------------------------------------------
#
# Project created by QtCreator 2014-10-09T10:43:50
#
#-------------------------------------------------

QT      += qml

QT       -= gui

TARGET = free-noteboard-common
TEMPLATE = lib
CONFIG += staticlib c++11

SOURCES += NoteSubject.cpp \
    NoteBoard.cpp

HEADERS += NoteSubject.h \
    NoteBoard.h
unix {
    target.path = /usr/lib
    INSTALLS += target
}
