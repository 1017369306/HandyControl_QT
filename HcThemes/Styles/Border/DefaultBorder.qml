import QtQuick 2.9
import QtQuick.Controls 2.2
import HcThemes 1.0

//默认border
Rectangle {
    id: radiusRectangle
    radius: HcStyle.defaultCornerRadius
    color: "transparent"
    border.color: HcStyle.borderColor
    border.width: HcStyle.borderWidth
}
