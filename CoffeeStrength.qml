import QtQuick 2.5
import QtQuick.Controls 1.5

Item {
    id: item1
    width: 960
    height: 540
    clip: true

    property int strength: 4
    property int waterLevel: 45
    property string coffeeType: ""

    Text {
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 20
        font.pixelSize: 50
        color: "White"
        text: coffeeType
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
            //onClicked: mainLoader.source = "GridOne.qml"
            onClicked: stackview.pop()
        }
    }

    Button {
        width: 80
        height: 40
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: 30
        text: "Brew!"
        visible: swipeView.currentIndex === 1
        onClicked: {
            mainLoader.source = "CoffeeBrewing.qml"
            if (item) {
                item.myVariable = coffeeType
            }
        }
    }

    Row {
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 100
        Image {
            id:emptycup
            fillMode: Image.PreserveAspectFit
            width : 150
            height: 201
            source: "qrc:/images/empty-cup(ori_size).png"
            anchors.verticalCenter: parent.verticalCenter
        }

        SwipeView {
            id: swipeView
            width: 400
            height: 540

            Item {
                id: firstPage
                //anchors.verticalCenter: parent.verticalCenter
                width: 400
                height: 540

                Row {

                    id: coffeestr
                    spacing: 10
                    anchors.verticalCenter: parent.verticalCenter

                    Repeater {
                        model: 10

                        Image {
                            source: index < strength ? "qrc:/images/bean-filled.png" : "qrc:/images/bean-grayed.png"
                            width:30; height:30

                            MouseArea {
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: { strength = index + 1; swipeView.currentIndex += 1 }
                            }
                        }
                    }
                }
            }

            Item {
                id: secondPage
                width: 400
                height: 540

                Text {
                    id: waterLevelTitle
                    font.pixelSize: 35
                    color: "white"
                    text: "Water Level"
                    font.family: "SF Pro"
                    anchors {
                        bottom: waterLevelRow.top
                        horizontalCenter: waterLevelRow.horizontalCenter
                        margins: 30
                    }
                }

                Row {
                    id: waterLevelRow
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 60

                    Image {
                        source: "qrc:/images/arrow-left.png"
                        height: 50
                        width: 50
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                if (waterLevel > 25) {
                                    waterLevel -= 5;
                                }
                            }
                        }
                    }

                    Text {
                        id: waterLevelText
                        font.pixelSize: 50
                        color: "white"
                        text: waterLevel + " ml"
                        font.family: "SF Pro"
                    }

                    Image {
                        source: "qrc:/images/arrow-right.png"
                        height: 50
                        width: 50
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                if (waterLevel < 95) {
                                    waterLevel += 5;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}


