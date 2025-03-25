import QtQuick 2.0
import QtQuick.Controls 1.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1

Item {
    width: 960
    height: 540

    property string title
    property string image_src
    property string coffeetype

    Rectangle {
        anchors.fill: parent
        gradient:
            Gradient{
                GradientStop { position: -0.5; color: "#1a1a1a" }
                GradientStop { position: 1.0; color: "#595555" }
            }
    }

}
