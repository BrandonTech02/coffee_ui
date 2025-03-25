import QtQuick 2.0
import QtMultimedia 5.5
import QtQuick.Controls 1.5

Item {

    property string myVariable: ""

    Button {
        id: cancelButton
        width: 80
        height: 40
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 30
        text: "Cancel"
        onClicked: {
            mainLoader.source = "StackViewPage.qml"
        }
    }

    Text {
        id: coffeeTitle
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 20
        font.pixelSize: 50
        color: "White"
        text: myVariable
    }

    Text {
            id: coffeeText
            text: "Enjoy your coffee!"
            font.pixelSize: 25
            color: "white"
            anchors.top: coffeeTitle.bottom
            anchors.horizontalCenter: coffeeTitle.horizontalCenter
            anchors.margins: 15
            visible: false
    }

    MediaPlayer {
        id: player
        source: "qrc:/videos/CoffeeBrewing.mp4"
        autoPlay: true

        onStopped: {
            player.pause()
            coffeeText.visible = true
        }
    }

    VideoOutput {
        width:105
        height:201
        id: videoOutput
        source: player
        anchors.centerIn: parent
    }
}
