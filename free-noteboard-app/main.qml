import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Window 2.0

ApplicationWindow {
    id: mainWindow
    visible: true
    width: Screen.width
    height: Screen.height
    flags: Qt.FramelessWindowHint
    title: qsTr("Noteboard")
    property var selectedSubject

    Flow {
        anchors.fill: parent
        Repeater {
            model: nb.noteSubjects

            Rectangle {
                id: subjectOuter
                width: computeWidth()
                height: (mainWindow.height / 2) - 15
                color: "transparent"

                function computeWidth() {
                    var margin = 5;
                    var minWidth = 250;
                    for (var i = 10; i > 0; i--) {
                        if(mainWindow.width >= (minWidth * i)) { // + (margin * (i+1))) {
                            return (mainWindow.width / i) - 1; // - margin - (margin / i);
                        }
                    }
                }

                Rectangle {
                    id: subjectInner
                    anchors.fill: parent
                    anchors.leftMargin: 5
                    anchors.topMargin: 5
                    color: "#FFFFFF"

                    RectangleFlashButton {
                        id: header
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.right: parent.right
                        height: headerText.height + 20
                        color: "#8CBF26"
                        Text {
                            id: headerText
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            font.bold: true
                            font.pixelSize: 18
                            color: "#FFFFFF"
                            text: modelData.name
                        }

                        onClicked: {
                            editNoteSubject.model = modelData;
                            editNoteSubject.show();
                        }
                    }

                    Column {
                        id: noteSubjects
                        anchors.top: header.bottom
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: 10

                        Repeater {
                            model: modelData.noteSubjects

                            Column {
                                Rectangle {
                                    width: 1
                                    height: 5
                                    color: "transparent"
                                }
                                RectangleFlashButton {
                                    id: subjectHeader2
                                    width: subjectInner.width
                                    height: subjectName.height + 10
                                    color: "transparent"
                                    property bool deleted
                                    onClicked: subjectHeader2.deleted = !subjectHeader2.deleted

                                    Text {
                                        id: subjectName
                                        //anchors.verticalCenter: parent.verticalCenter
                                        anchors.top: parent.top
                                        anchors.topMargin: 0
                                        anchors.left: parent.left
                                        anchors.right: parent.right
                                        anchors.rightMargin: 20
                                        font.bold: true
                                        font.pixelSize: 16
                                        font.strikeout: subjectHeader2.deleted
                                        color: "#444444"
                                        text: modelData.name
                                        wrapMode: Text.Wrap
                                    }
                                }

                                Repeater {
                                    model: modelData.noteSubjects

                                    Rectangle {
                                        width: subjectInner.width - 40
                                        height: subjectName2.height + 5
                                        color: "transparent"

                                        Text {
                                            anchors.verticalCenter: parent.verticalCenter
                                            anchors.left: parent.left
                                            anchors.leftMargin: 10
                                            font.pixelSize: 16
                                            color: "#444444"
                                            text: index+1 + "."
                                            wrapMode: Text.Wrap
                                        }

                                        Text {
                                            id: subjectName2
                                            anchors.verticalCenter: parent.verticalCenter
                                            anchors.left: parent.left
                                            anchors.leftMargin: 30
                                            anchors.right: parent.right
                                            anchors.rightMargin: 20
                                            font.pixelSize: 16
                                            color: "#444444"
                                            text: modelData.name
                                            wrapMode: Text.Wrap
                                        }
                                    }
                                }

                                Rectangle {
                                    width: 1
                                    height: 5
                                    color: "transparent"
                                }
                                Rectangle {
                                    width: parent.width - 20
                                    height: 1
                                    color: "#444444"
                                }
                            }
                        }
                    }
                }
            }
        }
    }


    DialogModal {
        id: editNoteSubject
        title: "Edit Text"
        property var model
        defaultFocus: editName

        onVisibleChanged: {
            if(editNoteSubject.visible) {
                model = model;
            }
        }

        function close(save) {
            if(save) {
                if(editNoteSubject.model.name !== editName.text)
                    editNoteSubject.model.name = editName.text
            }
            editNoteSubject.visible = false;
        }

        customContent: Column{
            spacing: 20
            TextFieldLabeled {
                id: editName
                label: "Text:"
                text: editNoteSubject.model ? editNoteSubject.model.name : ""
                onAccepted: editNoteSubject.close(true);
            }

            Row {
                anchors.right: parent.right
                Button {
                    text: "Ok"
                    onClicked: editNoteSubject.close(true)
                }
                Button {
                    text: "Cancel"
                    onClicked: editNoteSubject.close(false)
                }
            }
        }
    }





    Timer {
            interval: 20000; running: true; repeat: true
            onTriggered: screenSaver.start()
        }

    Rectangle {
        id: screenSaverRect
        anchors.fill: parent
        color: "#000000"
        opacity: 0
//        gradient: Gradient {
//             GradientStop { position: 0.0; color: "transparent" }
//             GradientStop { id: gradientStart; position: 0.0; color: "blue" }
//         }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                screenSaver.stop();
                parent.opacity = 0;
            }
        }
    }

    SequentialAnimation {
        id: screenSaver
        PropertyAnimation {target: screenSaverRect; properties: "opacity"; to: "1.0"; duration: 3000;}
        PropertyAnimation {target: screenSaverRect; properties: "opacity"; to: "0.0"; duration: 3000;}
    }



}
