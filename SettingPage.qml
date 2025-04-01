import QtQuick 2.0
import QtQuick.Controls 1.5

Item {

    id: settingPage

    Row {
        anchors.centerIn: parent
        spacing: 20

        Rectangle {
            width: 150
            height: 150
            color: "blue"
            radius: 25
            border.color: black
            border.width: 1

            Text {
                anchors.centerIn: parent
                text: "Rinse"
                color: "white"
                font.bold: true
                font.pixelSize: 25
            }

            Image {
                anchors.fill: parent
                source: "qrc:/images/waterdrop.png"

                MouseArea {
                    anchors.fill: parent
                    onClicked: stackview.push("qrc:/LoadingCircle.qml", { quitAfterLoading: false, isPowerOff: false } )
                }
            }
        }

        Rectangle {
            width: 150
            height: 150
            color: "red"
            radius: 25
            border.color: black
            border.width: 1

            Text {
                anchors.centerIn: parent
                text: "Power Off"
                color: "white"
                font.bold: true
                font.pixelSize: 25
            }

            Image {
                id: powerButton
                anchors.fill: parent
                source: "qrc:/images/power-button.png"
                MouseArea {
                    id: buttonArea
                    anchors.fill: parent
                    onClicked: {
                        stackview.push("qrc:/LoadingCircle.qml", { quitAfterLoading: true, isPowerOff: true } )
                    }
                }
            }
        }
    }

    Image {
        source: "qrc:/images/previous.png"
        fillMode: Image.PreserveAspectFit
        width: 50
        height: 50
        anchors {
            top: parent.top
            left: parent.left
            margins: 20
        }
        MouseArea {
            anchors.fill: parent
            onClicked: stackview.pop()
        }
    }
}


