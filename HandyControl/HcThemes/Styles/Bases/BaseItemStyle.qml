import QtQuick 2.9
import QtQuick.Controls 2.2
import HcThemes 1.0

//所有元素的基础元素
Item {
    id: baseItemStyle
    Font.pixelSize: defaultTextFontSize
    anchors.centerIn: parent
    Font.family: "Microsoft YaHei"
    Text.color: HcStyle.textColor
}
