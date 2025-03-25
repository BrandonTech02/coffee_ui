import QtQuick 2.0
import QtMultimedia 5.5
Item {

    property string myVariable: ""

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
        loops: 1

        onPlaybackStateChanged: {
            if (playbackState === MediaPlayer.EndOfMedia) {
                player.pause()
                coffeeText.visible = true
            }
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
