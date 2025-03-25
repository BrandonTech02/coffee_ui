import QtQuick 2.0
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4
Item {
    width: 960
    height: 540

    ListModel {
        id: listModel
        ListElement { name: "Espresso"; page: "CoffeeStrength.qml"; image_src: "qrc:/images/espresso.png"}
        ListElement { name: "Americano"; page: "CoffeeStrength.qml"; image_src: "qrc:/images/americano.png" }
        ListElement { name: "Latte"; page: "CoffeeStrength.qml"; image_src: "qrc:/images/latte.png" }
        ListElement { name: "Cappuccino"; page: "CoffeeStrength.qml"; image_src: "qrc:/images/cappuccino.png" }
        ListElement { name: "Macchiato"; page: "CoffeeStrength.qml"; image_src: "qrc:/images/macchiato.png" }
    }

    GridView {
        id: gridView
        width: 650
        height: 100
        anchors.centerIn: parent
        model: listModel
        cellHeight: 130
        cellWidth: 130

        delegate: Rectangle {
            id: gridRec
            anchors.left: gridView.left
            anchors.verticalCenter: parent.verticalCenter
            width: 110
            height: 110
            color: "grey"
            radius: 5

            Image {
                id: coffeeImage
                source: image_src
                anchors.centerIn: parent

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        //coffeeSelected(name)
                        //mainLoader.source = page
                        onClicked: stackview.push("qrc:/CoffeeStrength.qml", {coffeeType: name})
                    }
                }
            }

            Text {
                color: "white"
                text: name
                font.pixelSize: 15
                anchors.top: gridRec.bottom
                anchors.horizontalCenter: gridRec.horizontalCenter
                anchors.margins: 10
            }
        }
    }
}
