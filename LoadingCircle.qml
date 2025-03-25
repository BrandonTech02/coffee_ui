import QtQuick 2.0
import QtQuick.Controls 1.5

Item {

    Text {
        text: "Rinsing..."
        font.pixelSize: 30
        color: "White"
        anchors {
            bottom: loadingRec.top
            horizontalCenter: loadingRec.horizontalCenter
        }
    }

    Rectangle {
        id: loadingRec
        width: 200
        height: 200
        color: "transparent"
        anchors.centerIn: parent

        Canvas {
            id: loadingCircle
            anchors.centerIn: parent
            width: 150
            height: 150

            property real endAngle: -Math.PI / 2 // Start the endAngle at the top (12 o'clock)

            onPaint: {
                var ctx = getContext("2d");

                // Clear the canvas
                ctx.clearRect(0, 0, width, height);

                // Circle settings
                var centerX = width / 2;
                var centerY = height / 2;
                var radius = width / 2 - 10; // Radius of the circle
                var startAngle = -Math.PI / 2; // Fixed start at the top (12 o'clock position)

                // Draw the static base circle (background)
                ctx.lineWidth = 10; // Thickness of the circle
                ctx.strokeStyle = "#ddd"; // Light gray background
                ctx.beginPath();
                ctx.arc(centerX, centerY, radius, 0, Math.PI * 2, false); // Full circle
                ctx.stroke();

                // Draw the dynamic wrapping blue bar
                ctx.strokeStyle = "#3498db"; // Blue color for the bar
                ctx.beginPath();
                ctx.arc(centerX, centerY, radius, startAngle, endAngle, false);
                ctx.stroke();
            }

            Timer {
                interval: 16 // Approximately 60 FPS
                running: true
                repeat: true
                onTriggered: {
                    loadingCircle.endAngle += 0.02; // Increment the end angle for wrapping
                    if (loadingCircle.endAngle >= Math.PI * 2 - Math.PI / 2) {
                        //loadingCircle.endAngle = -Math.PI / 2; // Reset after a full rotation
                        running: false
                        stop()
                        stackview.pop()
                    }
                    loadingCircle.requestPaint(); // Redraw the canvas
                }
            }
        }
    }
}
