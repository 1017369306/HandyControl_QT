import QtQuick 2.9
import QtQuick.Controls 2.2
import HcThemes 1.0

Item {
    id: leftPaneItem
    signal loadContent(string path)
    signal loadHome

    RadiusRectangle{
        color: HcStyle.backgroundColor
        anchors.fill: parent
        anchors.margins: HcStyle.mediumPadding

        DefaultBorder{
            border.width: 0;
            anchors.fill: parent
            anchors.margins: HcStyle.defaultPadding

            //        首页
            ButtonIconTransparent {
                id: homeBtn
                anchors {
                    left: parent.left
                    top: parent.top
                }
                width: parent.width
                height: HcStyle.defaultControlHeight
                borderRectangle.color: HcStyle.secondarybackgroundColor
                //                borderRectangle.color: listView.currentIndex === -1 ? HcStyle.themeColor : HcStyle.secondarybackgroundColor
                tipText: qsTr("Home") + trans.transString

                contentItem:Rectangle{
                    anchors.centerIn: parent
                    color: "transparent"
                    Row{
                        anchors.centerIn: parent
                        //                    anchors.horizontalCenter: parent.horizontalCenter
                        spacing: HcStyle.defaultPadding
                        BaseText{
                            font.family: Fonts.icon
                            font.pixelSize: HcStyle.mediumIconHeight
                            anchors.verticalCenter: parent.verticalCenter
                            text: "\uf015"
                        }
                        BaseText{
                            font.pixelSize: HcStyle.headTextFontSize
                            anchors.verticalCenter: parent.verticalCenter
                            text: qsTr("Home") + trans.transString
                        }
                    }
                }

                onClicked: {
                    //                    listView.currentIndex = -1
                    loadHome()
                }
            }

            //搜索按钮
            SearchBar{
                id: searchInput
                objectName: "searchInput"
                width: parent.width
                anchors {
                    left: parent.left
                    top: homeBtn.bottom
                    topMargin: HcStyle.smallPadding
                }
                placeholderText: qsTr("Search") + trans.transString
                //手动添加事件
                onTextChanged: {
                    //                    demoModel.search(searchInput.text)
                }
                //响应事件
                onSearch: {
                    //                    demoModel.search(currentText)
                }
            }

        }

    }

}
