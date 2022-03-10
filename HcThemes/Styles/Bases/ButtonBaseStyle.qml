import QtQuick 2.9
import QtQuick.Controls 2.2
import HcThemes 1.0

//按钮的基础样式
Button {
    id: buttonBaseStyle
    height: HcStyle.defaultControlHeight
    font.pixelSize: HcStyle.defaultTextFontSize
    leftPadding: HcStyle.smallPadding
    rightPadding: HcStyle.smallPadding

    //按钮中的文本颜色
    property color foreground: HcStyle.textColor
    //真正的背景色
    property color regionColor: HcStyle.backgroundColor

    //    property alias contentFont: baseText.font
    property alias borderRectangle: radiusRectangle

    property alias tipText: toolTip.text
    property alias tipVisible: toolTip.visible
    property alias tipDelay: toolTip.delay
    property alias tipTimeout: toolTip.timeout

    contentItem: BaseText {
        id: baseText
        text: buttonBaseStyle.text
        color: foreground
        font: buttonBaseStyle.font
        leftPadding: buttonBaseStyle.leftPadding
        rightPadding: buttonBaseStyle.rightPadding
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    background: RadiusRectangle{
        id: radiusRectangle
        border.width: HcStyle.borderWidth
        border.color: HcStyle.borderColor
        color: {
            if (border.width > 0 && buttonBaseStyle.pressed) {
                return HcStyle.borderColor
            } else if (border.width > 0 && buttonBaseStyle.hovered) {
                return HcStyle.secondarybackgroundColor
            }
            else{
                return regionColor
            }
        }
        opacity: {
            if (!buttonBaseStyle.enabled) {
                return 0.4
            } else if (buttonBaseStyle.pressed) {
                return 0.6
            } else if (buttonBaseStyle.hovered) {
                return 0.9
            } else {
                return 1
            }
        }
    }
    BaseTooltip {
        id: toolTip
        visible: buttonBaseStyle.hovered && String(text).length
        text: baseText.text
        delay: 500
        timeout: 3000
    }

}
