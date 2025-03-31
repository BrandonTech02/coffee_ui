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
            player.stop()
            coffeeText.visible = true
            coffeeFill.visible = true
            videoOutput.visible = false
            cancelButton.visible = false
            doneButton.visible = true
        }
    }

    VideoOutput {
        id: videoOutput
        width:105
        height:201
        source: player
        anchors.centerIn: parent
    }

    Image {
        id: coffeeFill
        fillMode: Image.PreserveAspectFit
        width : 120
        height: 171
        source: "qrc:/images/coffeeLevel.png"
        visible: false
        anchors.centerIn: parent
    }

    Button {
        id: doneButton
        visible: false
        width: 80
        height: 40
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: 30
        text: "Done!"
        onClicked: {
            mainLoader.source = "StackViewPage.qml"
        }
    }
}
