import QtQuick
import QtQuick.Controls
import SddmComponents

Rectangle {
    anchors.fill: parent
    color: "#000000"

    Image {
        id: wallpaper

        anchors.fill: parent

        source: "assets/wallpaper.jpg"

        fillMode: Image.PreserveAspectCrop

        asynchronous: true
        cache: true
    }

    // Dark overlay
    Rectangle {
        anchors.fill: parent

        color: "#000000"
        opacity: 0.35
    }

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 150

        text: "20:47"

        color: "white"

        font.pixelSize: 72
    }

    TextField {
        anchors.centerIn: parent

        width: 300
        height: 50

        placeholderText: "Password"

        echoMode: TextInput.Password

        color: "white"
        placeholderTextColor: "#aaaaaa"

        background: Rectangle {
            color: "#222222"
            opacity: 0.9

            radius: 10

            border.width: 1
            border.color: "#555555"
        }
    }
}
