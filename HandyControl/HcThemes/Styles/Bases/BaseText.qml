import QtQuick 2.9
import QtQuick.Controls 2.2
import HcThemes 1.0

//文本元素
Text {
    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignHCenter
    font.family: Fonts.font
    font.pixelSize: HcStyle.defaultTextFontSize
    elide: Text.ElideRight
    color: HcStyle.textColor
    opacity: enabled ? 1 : 0.6
//    elide: Text.ElideRight
}

