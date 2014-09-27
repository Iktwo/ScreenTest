import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.2
import com.iktwo.components 1.0

ApplicationWindow {
    property var resolutions: [
        {"height": 480, "width": 320, "name": "HVGA", "ratio": "3:2"},
        {"height": 640, "width": 360, "name": "nHD", "ratio": "16:9"},
        {"height": 640, "width": 480, "name": "VGA", "ratio": "4:3"},
        {"height": 800, "width": 480, "name": "WVGA", "ratio": "5:3"},
        {"height": 800, "width": 600, "name": "SVGA", "ratio": "4:3"},
        {"height": 960, "width": 540, "name": "qHD", "ratio": "16:9"},
        {"height": 1280, "width": 720, "name": "720p", "ratio": "16:9"},
        {"height": 1280, "width": 800, "name": "WXGA", "ratio": "16:10"},
        {"height": 1920, "width": 1080, "name": "1080p", "ratio": "16:9"}
    ]

    property int currentResolution: 3
    property bool isScreenPortrait: height >= width

    function orientationToScreen(orientation) {
        if (orientation === Qt.PrimaryOrientation)
            return "PrimaryOrientation"
        else if (orientation === Qt.LandscapeOrientation)
            return "LandscapeOrientation"
        else if (orientation === Qt.PortraitOrientation)
            return "PortraitOrientation"
        else if (orientation === Qt.InvertedLandscapeOrientation)
            return "InvertedLandscapeOrientation"
        else if (orientation === Qt.InvertedPortraitOrientation)
            return "InvertedPortraitOrientation"
    }

    visible: true
    width: resolutions[currentResolution]["width"]
    height: resolutions[currentResolution]["height"]
    title: "ScreenTest"

    ScrollView {
        anchors.fill: parent

        Flickable {
            anchors {
                fill: parent
                margins: 8
            }

            contentHeight: column.height

            Column {
                id: column

                width: parent.width

                spacing: 10

                Label {
                    text: "Screen info"
                    width: parent.width
                    elide: "ElideRight"
                    horizontalAlignment: "AlignHCenter"
                }

                Label {
                    text: "desktopAvailableHeight: " + Screen.desktopAvailableHeight
                    width: parent.width
                    elide: "ElideRight"
                }

                Label {
                    text: "desktopAvailableWidth: " + Screen.desktopAvailableWidth
                    width: parent.width
                    elide: "ElideRight"
                }

                Label {
                    text: "height: " + Screen.height
                    width: parent.width
                    elide: "ElideRight"
                }

                Label {
                    text: "width: " + Screen.width
                    width: parent.width
                    elide: "ElideRight"

                }

                Label {
                    text: "name: " + Screen.name
                    width: parent.width
                    elide: "ElideRight"
                }

                Label {
                    text: "orientation: " + orientationToScreen(Screen.orientation)
                    width: parent.width
                    elide: "ElideRight"
                }

                Label {
                    text: "primaryOrientation: " + orientationToScreen(Screen.primaryOrientation)
                    width: parent.width
                    elide: "ElideRight"
                }

                Label {
                    text: "pixelDensity: " + Screen.pixelDensity
                    width: parent.width
                    elide: "ElideRight"
                }

                Label {
                    text: "logicalPixelDensity: " + Screen.logicalPixelDensity
                    width: parent.width
                    elide: "ElideRight"
                }

                Label {
                    text: "physicalDotsPerInch: " + physicalDotsPerInch
                    width: parent.width
                    elide: "ElideRight"
                }

                Label {
                    text: "physicalDotsPerInchX: " + physicalDotsPerInchX
                    width: parent.width
                    elide: "ElideRight"
                }

                Label {
                    text: "physicalDotsPerInchY: " + physicalDotsPerInchY
                    width: parent.width
                    elide: "ElideRight"
                }

                Label {
                    text: "dp: " + (loader.status === Loader.Ready ? loader.item.dp : "Unknown")
                    width: parent.width
                    elide: "ElideRight"
                }

                Label {
                    text: "dpi: " + (loader.status === Loader.Ready ? loader.item.dpi : "Unknown")
                    width: parent.width
                    elide: "ElideRight"
                }
            }
        }
    }

    Loader {
        id: loader

        source: "ComponentsData.qml"
    }
}
