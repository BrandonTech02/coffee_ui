import QtQuick 2.5
import QtQuick.Controls 1.5
import QtQuick.Dialogs 1.2

Item {

    ListModel {
        id: coffeelist

        ListElement {
            name: "Espresso"
            portrait: "qrc:/images/espresso.png"
        }
        ListElement {
            name: "Cappuccino"
            portrait: "qrc:/images/cappuccino.png"
        }
        ListElement {
            name: "Americano"
            portrait: "qrc:/images/americano.png"
        }
        ListElement {
            name: "Latte"
            portrait: "qrc:/images/latte.png"
        }
        ListElement {
            name: "Macchiato"
            portrait: "qrc:/images/macchiato.png"
        }

    }

    GridView {
        id: gridView
        model: coffeelist
        anchors.fill: parent
        // cellHeight: 240
        // cellWidth: 240

        delegate: Rectangle { width: 200; height: 200; color: "grey"; radius: 5 }
    }

}
