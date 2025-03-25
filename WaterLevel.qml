import QtQuick 2.5
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.1

Item {
    width: 960
    height: 540

    Row {
        anchors.centerIn: parent
        Image {
            source: "qrc:/images/arrow-left.png"
            height: 100
            width: 100
            anchors.right: waterLevelText.left
            anchors.verticalCenter: waterLevelText.verticalCenter
            anchors.margins: 150
        }
        Image {
            source: "qrc:/images/arrow-right.png"
            height: 100
            width: 100
            anchors.left: waterLevelText.right
            anchors.verticalCenter: waterLevelText.verticalCenter
            anchors.margins: 150
        }
        Text {
            id: waterLevelText
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 50
            color: "black"
            text: "45 ml"
            font.family: "SF Pro"

        }


    }
}
