import QtQuick 2.9
import QtQuick.Controls 2.2
// import QtGraphicalEffects 1.0
import ".."
import "../.."

Item {
    id: pageItem
    z: 998
    anchors.fill: parent
    property string wizardName
    property string wizardDescript
    property string targetObjectName
    property int pageType: pageTypeDown

    property color maskColor: "black"
    property real maskOpacity: 0.75
    property color textColor: "white"

    property rect focusRect

    readonly property int pageTypeDown: Qt.DownArrow
    readonly property int pageTypeUp: Qt.UpArrow
    readonly property int pageTypeLeft: Qt.LeftArrow
    readonly property int pageTypeRight: Qt.RightArrow


    Component.onCompleted: {
        var rect = quickTool.getItemGeometryToScene(targetObjectName)
        focusRect = rect
    }
    Item {
        id: focusItem
        x: focusRect.x
        y: focusRect.y
        width: focusRect.width
        height: focusRect.height
    }
    //left
    Rectangle {
        x: 0
        y: 0
        width: focusRect.x
        height: parent.height
        color: maskColor
        opacity: maskOpacity
    }
    //right
    Rectangle {
        x: focusRect.x + focusRect.width
        y: 0
        width: pageItem.width - x
        height: parent.height
        color: maskColor
        opacity: maskOpacity
    }
    //top
    Rectangle {
        x: focusRect.x
        width: focusRect.width
        y: 0
        height: focusRect.y
        color: maskColor
        opacity: maskOpacity
    }
    //bottom
    Rectangle {
        x: focusRect.x
        width: focusRect.width
        y: focusRect.y + focusRect.height
        height: pageItem.height - y
        color: maskColor
        opacity: maskOpacity
    }
    Row {
        id: leftRow
        spacing: HcStyle.defaultPadding
        visible: pageType === pageTypeLeft
        z: 998
        anchors {
            left: focusItem.right
            leftMargin: HcStyle.smallPadding
            verticalCenter: focusItem.verticalCenter
        }
        //    指向左边的箭头
        BaseText{
            font.family: Fonts.icon
            font.pixelSize: HcStyle.defaultIconHeight
            text: "\uf30a"
            color: HcStyle.themeColor
        }
    }
    Row {
        id: rightRow
        spacing: HcStyle.defaultPadding
        layoutDirection: Qt.RightToLeft
        visible: pageType === pageTypeRight
        z: 998
        anchors {
            right: focusItem.left
            rightMargin: HcStyle.smallPadding
            verticalCenter: focusItem.verticalCenter
        }
        //    指向右边的箭头
        BaseText{
            font.family: Fonts.icon
            font.pixelSize: HcStyle.defaultIconHeight
            text: "\uf30b"
            color: HcStyle.themeColor
        }
    }
    Column {
        id: downColumn
        spacing: HcStyle.defaultPadding
        visible: pageType === pageTypeDown
        width: HcStyle.defaultIconHeight
        z: 998
        anchors {
            bottom: focusItem.top
            bottomMargin: HcStyle.smallPadding
            horizontalCenter: focusItem.horizontalCenter
        }
        //    指向下边的箭头
        BaseText{
            font.family: Fonts.icon
            font.pixelSize: HcStyle.defaultIconHeight
            text: "\uf309"
            color: HcStyle.themeColor
        }
    }
    Column {
        id: upColumn
        spacing: HcStyle.defaultPadding
        visible: pageType === pageTypeUp
        width: HcStyle.defaultIconHeight
        z: 998
        anchors {
            top: focusItem.bottom
            topMargin: HcStyle.smallPadding
            horizontalCenter: focusItem.horizontalCenter
        }
        //    指向上边的箭头
        BaseText{
            font.family: Fonts.icon
            font.pixelSize: HcStyle.defaultIconHeight
            text: "\uf30c"
            color: HcStyle.themeColor
        }
    }
    BaseText {
        id: wizardDescriptLabel
        z: 998
        text: qsTr(wizardDescript) + HcStyle.transString
        color: textColor
        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
            verticalCenterOffset: 50
            horizontalCenterOffset: -50
        }
    }
    BaseText {
        z: 998
        text: qsTr(wizardName) + HcStyle.transString
        font.pixelSize: HcStyle.headTextFontSize
        color: textColor
        anchors {
            left: wizardDescriptLabel.left
            bottom: wizardDescriptLabel.top
            bottomMargin: HcStyle.defaultPadding
        }
    }

}
