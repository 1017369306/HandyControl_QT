import QtQuick 2.9
import QtQuick.Controls 2.2
import HcThemes 1.0

Item {
    id: root
    anchors.fill: parent
    property alias popupVisible: popup.visible
    property alias contentItem: popup.contentItem
    property alias backgroundItem: background
    property real backgroundWidth: 200
    property real backgroundHeight: 160
    property real verticalOffset: HcStyle.defaultIconHeight

    //矩形旋转45度，一半被toolTip遮住(重合)，另一半三角形和ToolTip组成一个带箭头的ToolTip
    Rectangle {
        id: bar
        visible: popup.visible
        rotation: 45
        width: verticalOffset
        height: width
        color: HcStyle.secondarybackgroundColor
        border.color: HcStyle.borderColor
        //水平居中
        anchors.horizontalCenter: parent.horizontalCenter
        //垂直方向上，由ToolTip的y值，决定位置
        anchors.verticalCenter: parent.bottom
        anchors.verticalCenterOffset: verticalOffset
    }
    Popup {
        id: popup
        width: backgroundWidth
        height: backgroundHeight
        background: Rectangle {
            id: background
            color: HcStyle.secondarybackgroundColor
            radius: HcStyle.defaultCornerRadius
            border.color:HcStyle.borderColor
            border.width: HcStyle.borderWidth
        }
    }
    function show() {
        popup.x = (root.width - popup.width) / 2
        popup.y = root.height + verticalOffset
        popupVisible = true
    }
    function hide() {
        popupVisible = false
    }
}

