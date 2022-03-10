import QtQuick 2.9
import QtQuick.Controls 2.2
import HcThemes 1.0
import "./Pane/"

Rectangle{
    //    QML中加载字体图标库
    //    FontLoader{
    //        id: awe_loader
    //        source: HcImportPath + "/HcThemes/Basics/fonts/Font Awesome 6 Free-Solid-900.otf"
    //    }

    id: mainwindow
    objectName: "rootMainwindow";
    radius: 0
    color: HcStyle.secondarybackgroundColor
    width: 1440
    height: 960

    //Windows use native event for frameless
    //Other platform use CusResizeBorder
    ResizeBorder {
        id: resizeBorder
        visible: Qt.platform.os !== "windows"
        borderWidth: HcStyle.borderWidth * 2
        enabled: visible
        anchors.fill: mainwindow
        control: view
    }

    TitlePane {
        id: title
        width: parent.width
        height: HcStyle.largeControlHeight
    }

    Item {
        id: content
        width: parent.width - resizeBorder.borderWidth * 2
        x: resizeBorder.borderWidth
        anchors {
            top: title.bottom
            bottom: parent.bottom
            bottomMargin: resizeBorder.borderWidth
        }
        LeftPane {
            id: leftPane
            objectName: "leftPane"
            property real targetW: parent.width * 0.2
            width: targetW
            height: parent.height
            property bool isOpen: true
            x: isOpen ? 0 : -targetW
    //        X属性的动画时间
            Behavior on x {
                NumberAnimation { duration: 350}
            }
            onLoadHome: {
                rightPane.source = rightPane.homeUrl
            }
            onLoadContent: {
                rightPane.source = contentsPath + path
            }
        }

        RightPane {
            id: rightPane
            objectName: "contentRect"
            anchors {
                left: leftPane.right
                leftMargin: HcStyle.defaultPadding
                right: parent.right
                top: parent.top
                bottom: parent.bottom
            }
        }
    }

    ClickShow {
        anchors.fill: parent
        anchors.margins: HcStyle.smallPadding
    }

    //在这里中转返回HcStyle
    function getHcStyle(){
        return HcStyle;
    }
    function getReadonlyControlHeight(){
        return HcStyle.readonlyControlHeight;
    }
    function getDefaultControlHeight(){
        return HcStyle.defaultControlHeight;
    }
    //在这里中转调用HcStyle的方法
    function updateSizeProperty(scaleValue){
        HcStyle.updateSizeProperty(scaleValue);
    }

    //cpp调用这个函数
    function getTitleWidth()
    {
        return "title.width";
    }

}
