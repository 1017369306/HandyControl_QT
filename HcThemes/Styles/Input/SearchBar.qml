import QtQuick 2.9
import QtQuick.Controls 2.2
import HcThemes 1.0
import ".."
import "../.."

TextFieldBaseStyle {
    id: searchBar

    signal search(string currentText)
    implicitWidth: HcStyle.maximumHeight * 2
//    leftPadding: 36
//    rightPadding: 30
    background: DefaultBorder {
        color: (searchBar.enabled
                && !searchBar.readOnly) ? HcStyle.backgroundColor : HcStyle.control_disabled
        border.color: (searchBar.enabled && !searchBar.readOnly && (searchBar.hovered || searchBar.focus)) ? HcStyle.control_hovered : HcStyle.borderColor

        //清除svg
        ButtonIconTransparent {
            z: 3
            anchors {
                right: searchBtn.left
//                rightMargin: HcStyle.smallPadding
                verticalCenter: parent.verticalCenter
            }
            width: HcStyle.defaultControlHeight
            height: HcStyle.defaultControlHeight
            visible: (searchBar.enabled && !searchBar.readOnly && (searchBar.hovered || searchBar.focus))
            font.family: Fonts.icon
            font.pixelSize: HcStyle.defaultIconHeight
            text: "\uf057"
            tipText: qsTr("clear") + trans.transString
            onClicked: {
                searchBar.clear()
            }
        }

        //搜索svg
        ButtonIconTransparent {
            id: searchBtn
            z: 3
            anchors {
                right: parent.right
                rightMargin: HcStyle.smallPadding
                verticalCenter: parent.verticalCenter
            }
            width: HcStyle.defaultControlHeight
            height: HcStyle.defaultControlHeight
            visible: true
            font.family: Fonts.icon
            font.pixelSize: HcStyle.defaultIconHeight
            text: "\uf002"
            tipText: qsTr("search") + trans.transString
            onClicked:{
                search(searchBar.text);
            }
        }

    }
}
