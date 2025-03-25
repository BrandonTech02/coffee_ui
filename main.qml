import QtQuick 2.5
import QtQuick.Controls 1.5
import QtQuick.Dialogs 1.2

ApplicationWindow {
    visible: true
    width: 960
    height: 540
    title: qsTr("Coffee Machine UI")

    Page {
        Loader {
        id: mainLoader
        source: "StackViewPage.qml"
        anchors.fill: parent
        }
    }

    /*SwipeView
       {
           id: swipeView
           anchors.fill: parent
           // orientation: Qt.Vertical
           Page
           {
               title: "Espresso"
               image_src: "images/espresso.png"
           }
           Page
           {
               title: "Cappuccino"
               image_src: "images/cappuccino.png"
           }
           Page
           {
               title: "Latte"
               image_src: "images/latte.png"
           }
           Page
           {
               title: "Americano"
               image_src: "images/americano.png"
           }
           Page
           {
               title: "Macchiato"
               image_src: "images/macchiato.png"
           }
       }*/

}
