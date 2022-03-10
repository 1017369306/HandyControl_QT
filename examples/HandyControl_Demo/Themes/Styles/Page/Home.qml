import QtQuick 2.9
import QtQuick.Controls 2.2
import HcThemes 1.0

Item {
    id: homeItem
    anchors.centerIn: parent

    Rectangle{
        anchors.top: parent.top
        anchors.topMargin: HcStyle.defaultPadding
        anchors.left: parent.left
        anchors.leftMargin: HcStyle.defaultPadding
//        anchors.verticalCenter: parent.verticalCenter
        color: HcStyle.backgroundColor
        width: gridDemo.width + HcStyle.defaultPadding * 2
        height: 300

        Grid{
            id: gridDemo
            columns: 4
            columnSpacing: HcStyle.defaultPadding

            anchors.top: parent.top
            anchors.topMargin: HcStyle.defaultPadding
            anchors.horizontalCenter: parent.horizontalCenter

            ButtonDefault{
                id: buttonBaseStyle
                text: qsTr("Welcome") + trans.transString
            }
            ButtonDefault{
                id: buttonBaseStyle1
                text: qsTr("Monday") + trans.transString
            }
            ButtonDefault{
                id: buttonBaseStyle2
                text: qsTr("Tuesday") + trans.transString
            }
            ButtonDefault{
                id: buttonBaseStyle3
                text: qsTr("Wednesday") + trans.transString
            }
        }
    }

    BaseText {
        text: qsTr("TaoQuick provides a set of controls that can be used to build complete interfaces in Qt Quick.") + trans.transString
        wrapMode: Label.Wrap
        anchors.centerIn: parent
    }
    property ListModel wizardModel: ListModel {
//        property string hcTextColor: String(HcStyle.textIconColor)
//        property string hcReversetextColor: String(HcStyle.textColor)

        // 1. 属性值由外部更新，这里不能绑定
        property string hcTextColor: "#ffffff"
        property string hcReversetextColor: "#ffffff"
        id: wizardModels

        // 1. Initialize the list model:
        property bool completed: false
        Component.onCompleted: {
            //ListElement在初始化时不能绑定值，在onCompleted中新增绑定
            clear();
            append({"name": "TitleBar",
                    "descript": "drag change window pos, double click change window state",
                    "targetObjectName": "blankItem",
                    arrowType: Qt.UpArrow,
                    textColor: wizardModels.hcTextColor});
            append({"name": "Control Buttons",
                    "descript": "minimize, maximize, normal or close main window",
                    "targetObjectName": "controlButtonsRow",
                    arrowType: Qt.UpArrow,
                    textColor: wizardModels.hcTextColor});
            append({"name": "Skin Button",
                    "descript": "switch theme",
                    "targetObjectName": "skinBtn",
                    arrowType: Qt.UpArrow,
                    textColor: wizardModels.hcTextColor});
            append({"name": "Language Button",
                    "descript": "switch language",
                    "targetObjectName": "langBtn",
                    arrowType: Qt.UpArrow,
                    textColor: wizardModels.hcTextColor});
            append({"name": "Left Pane",
                    "descript": "show content list",
                    "targetObjectName": "leftPane",
                    arrowType: Qt.LeftArrow,
                    textColor: wizardModels.hcTextColor});
            append({"name": "Content Pane",
                    "descript": "show current selected content by list",
                    "targetObjectName": "contentRect",
                    arrowType: Qt.RightArrow,
                    textColor: wizardModels.hcReversetextColor});
            append({"name": "Tool Buttons",
                    "descript": "special function buttons such as Wizard, View Source Code and so on",
                    "targetObjectName": "wizardBtn",
                    arrowType: Qt.RightArrow,
                    textColor: wizardModels.hcTextColor});
            completed = true;
        }
        // 2. Update the list model:
        onHcTextColorChanged: {
            if(completed) setProperty(0, "textColor", wizardModels.hcTextColor);
            if(completed) setProperty(1, "textColor", wizardModels.hcTextColor);
            if(completed) setProperty(2, "textColor", wizardModels.hcTextColor);
            if(completed) setProperty(3, "textColor", wizardModels.hcTextColor);
            if(completed) setProperty(4, "textColor", wizardModels.hcTextColor);
            if(completed) setProperty(6, "textColor", wizardModels.hcTextColor);
        }
        onHcReversetextColorChanged: {
            if(completed) setProperty(5, "textColor", wizardModels.hcReversetextColor);
        }
    }
}

