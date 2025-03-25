import QtQuick 2.0
import QtQuick.Controls 1.4

Item {
    anchors.fill: parent

    StackView {
        id: stackview
        anchors.fill: parent
        initialItem: GridOne {}
    }
}
