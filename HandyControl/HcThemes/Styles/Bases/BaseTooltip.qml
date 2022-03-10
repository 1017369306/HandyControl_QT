import QtQuick 2.9
import QtQuick.Controls 2.2
import HcThemes 1.0

//提示元素
ToolTip {
    id: baseTooltip
    contentItem: BaseText {
        text: baseTooltip.text
        leftPadding: HcStyle.defaultPadding
        rightPadding: HcStyle.defaultPadding
        topPadding: HcStyle.smallPadding
        bottomPadding: HcStyle.smallPadding
    }
    background: Rectangle {
        color: HcStyle.backgroundColor
        border.color: HcStyle.borderColor
        border.width: HcStyle.borderWidth
        radius: HcStyle.defaultCornerRadius
    }
}

