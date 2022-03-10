import QtQuick 2.9
import QtQuick.Controls 2.2
import HcThemes 1.0

Rectangle {
    id: titlePane
    color: HcStyle.backgroundColor
    anchors.left: parent.left
    anchors.top: parent.top

    property bool isMaxed: view.isMax

    //logo和名称
    Row {
        id: logoArea
        anchors.left: parent.left
        anchors.leftMargin: HcStyle.defaultPadding
        anchors.verticalCenter: parent.verticalCenter
        spacing: HcStyle.defaultPadding//相邻项的间隔

        //            Image {
        //                id: imageLogo
        //                source: imgPath + "logo.png"
        //                width: HcStyle.largeIconHeight
        //                height: HcStyle.largeIconHeight
        //                anchors.verticalCenter: parent.verticalCenter
        //            }
        BaseText{
            font.family: Fonts.icon
            font.pixelSize: HcStyle.largeIconHeight
            font.bold: true
            color: HcStyle.themeColor
            text: "\uf787"
        }
        BaseText {
            id: applicationTitle
            font.pixelSize: HcStyle.largeTextFontSize
            font.bold: true
            color: HcStyle.textColor
            text: qsTr("HandyControl") + trans.transString
        }
    }

    //中间空白区域
    //        Rectangle{
    //            id: blankItem
    //            anchors.left: logoArea.right
    //            anchors.right: toolRow.left
    //            anchors.verticalCenter: parent.verticalCenter
    //            color: "#db3340"

    //            Component.onCompleted: {
    //                view.setTitleItem(blankItem)
    //            }
    //        }

    //        主题、语言设置区域
    Row {
        id: toolRow
        //            anchors.left: blankItem.right
        anchors.right: splitLine.left
        anchors.rightMargin: HcStyle.smallPadding
        anchors.verticalCenter: parent.verticalCenter
        spacing: HcStyle.defaultPadding//相邻项的间隔

        ButtonIconTransparent {
            objectName: "skinBtn"
            width: HcStyle.defaultControlHeight
            height: HcStyle.defaultControlHeight
            font.family: Fonts.icon
            font.pixelSize: HcStyle.defaultIconHeight
            text: "\uf5bc"
            tipText: qsTr("skin") + trans.transString
            onClicked: {
                skinBox.show()
            }
            PopupDefault {
                id: skinBox
                //                    backgroundWidth: skinContentItem.cellWidth * 2 + HcStyle.defaultPadding*3
                //                    backgroundHeight: skinContentItem.count%2==0? skinContentItem.count/2 + HcStyle.defaultPadding*3 : Math.round(skinContentItem.count/2,0)+1 + + HcStyle.defaultPadding*3
                backgroundWidth : skinContentItem.cellWidth * 2 + HcStyle.defaultPadding*2
                backgroundHeight : skinContentItem.contentHeight + HcStyle.defaultPadding * 2
                contentItem: GridView {
                    id: skinContentItem
                    anchors.fill: parent
                    anchors.margins: HcStyle.defaultPadding
                    model: HcStyle.themes
                    cellWidth: HcStyle.maximumHeight
                    cellHeight: HcStyle.maximumHeight
                    clip: true
                    delegate: Item {
                        width: HcStyle.maximumHeight
                        height: HcStyle.maximumHeight
                        //主题色
                        Rectangle {
                            anchors.fill: parent
                            anchors.margins: HcStyle.borderWidth*2
                            color: model.themeNameColor
                        }
                        //鼠标移动上来的效果
                        Rectangle {
                            anchors.fill: parent
                            color: "transparent"
                            border.color: model.themeNameColor
                            border.width: HcStyle.borderWidth
                            visible: a.containsMouse
                        }
                        //文本
                        BaseText {
                            anchors {
                                centerIn: parent
                            }
                            text: qsTr(model.name) + trans.transString
                        }
                        //选中效果
                        Rectangle {
                            x: parent.width - width
                            y: parent.height - height
                            width: HcStyle.smallIconHeight
                            height: width
                            radius: width / 2
                            color: model.themeNameColor
                            border.width: HcStyle.borderWidth*2
                            border.color: HcStyle.borderColor
                            visible: HcStyle.currentTheme === index
                        }
                        //点击区域
                        MouseArea {
                            id: a
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                            onClicked: {
                                HcStyle.currentTheme = index
                            }
                        }
                    }
                }
            }
        }
        ButtonIconTransparent {
            objectName: "langBtn"
            width: HcStyle.defaultControlHeight
            height: HcStyle.defaultControlHeight
            font.family: Fonts.icon
            font.pixelSize: HcStyle.defaultIconHeight
            text: "\uf1ab"
            tipText: qsTr("Language") + trans.transString
            onClicked: {
                pop.show();
            }
            PopupDefault {
                id: pop
                backgroundWidth: HcStyle.maximumHeight + HcStyle.borderWidth*4
                backgroundHeight: langListView.contentHeight > 500 ? 500 : langListView.contentHeight + HcStyle.borderWidth*4
                contentItem: ListView {
                    id: langListView
                    anchors.fill: parent
                    anchors.margins: HcStyle.borderWidth*2
                    model: trans.languages
                    interactive: false
                    clip: true
                    delegate: Item {
                        width: HcStyle.maximumHeight
                        height: HcStyle.defaultControlHeight
                        ButtonDefault {
                            id: dBtn
                            anchors {
                                fill: parent
                                margins: HcStyle.borderWidth*2
                            }
                            text: modelData
                            //                                backgroundColor: trans.currentLang === modelData ? CusConfig.controlColor_pressed : (hovered || pressed ? CusConfig.controlColor_hovered : pop.barColor)
                            onClicked: {
                                trans.setCurrentLang(modelData);
                                pop.hide();
                            }
                        }
                    }
                }
            }
        }
    }

    //        分隔符
    Rectangle {
        id: splitLine
        height: parent.height * 0.4
        width: HcStyle.borderWidth
        //            anchors.left: toolRow.right
        anchors.right: controlButtons.left
        anchors.rightMargin: HcStyle.smallPadding
        anchors.verticalCenter: parent.verticalCenter
        color: "#eeeeee"
    }

    //        最小化、最大化、关闭区域
    Row {
        id: controlButtons
        objectName: "controlButtonsRow"
        anchors.right: parent.right
        anchors.rightMargin: HcStyle.defaultPadding
        anchors.verticalCenter: parent.verticalCenter
        spacing: HcStyle.defaultPadding
        ButtonIconTransparent {
            width: HcStyle.defaultControlHeight
            height: HcStyle.defaultControlHeight
            font.family: Fonts.icon
            font.pixelSize: HcStyle.defaultIconHeight
            text: "\uf146"
            //                Text.color: "#2db84d"
            tipText: qsTr("minimal") + trans.transString
            onClicked: {
                view.showMinimized()
            }
        }
        ButtonIconTransparent {
            visible: !isMaxed
            width: HcStyle.defaultControlHeight
            height: HcStyle.defaultControlHeight
            font.family: Fonts.icon
            font.pixelSize: HcStyle.defaultIconHeight
            text: "\uf2d0"
            tipText: qsTr("maximize") + trans.transString
            onClicked: {
                view.showMaximized()
            }
        }
        ButtonIconTransparent {
            visible: isMaxed
            width: HcStyle.defaultControlHeight
            height: HcStyle.defaultControlHeight
            font.family: Fonts.icon
            font.pixelSize: HcStyle.defaultIconHeight
            text: "\uf2d2"
            tipText: qsTr("normal") + trans.transString
            onClicked: {
                view.showNormal()
            }
        }
        ButtonIconTransparent {
            width: HcStyle.defaultControlHeight
            height: HcStyle.defaultControlHeight
            font.family: Fonts.icon
            font.pixelSize: HcStyle.defaultIconHeight
            text: "\uf410"
            tipText: qsTr("Close") + trans.transString
            onClicked: {
                view.close()
            }
        }
    }

    property alias blankItem: blankItem
    Item {
        id: blankItem
        objectName: "blankItem"
        anchors {
            left: parent.left
            leftMargin: 4
            right: toolRow.left
            top: parent.top
            topMargin: 4
            bottom: parent.bottom
        }
        Component.onCompleted: {
            view.setTitleItem(blankItem)
        }
    }

}
