pragma Singleton
import QtQuick 2.9

QtObject {
    id: themeStyle
    objectName: "themeStyle"

//    property FontLoader fontLoader
//    property string fontFamily: "微软雅黑"
//    默认分辨率（X），对应了所有size值，此分辨率只读
    readonly property double readonlyLogicX: 2560
    property string transString: typeof (trans) != "undefined" ? trans.transString : ""

//    默认分辨率（X）下控件的默认高度，根据此值来按比例缩放
    readonly property double readonlyControlHeight: 64
//    控件的高度
    property double smallControlHeight: 48
    property double defaultControlHeight: 64
    property double mediumControlHeight: 84
    property double largeControlHeight: 100
    property double maximumHeight: 120

//    图标的高度
    property double smallIconHeight: 32
    property double defaultIconHeight: 36
    property double mediumIconHeight: 48
    property double largeIconHeight: 58

//    margin/padding
    property double smallPadding: 10
    property double defaultPadding: 20
    property double mediumPadding: 32
    property double largePadding: 54

//    圆角CornerRadius
    property double defaultCornerRadius: 10

//    字体大小
    property double smallTextFontSize: 18
    property double defaultTextFontSize: 24
    property double smallHeadTextFontSize: 28
    property double headTextFontSize: 32
    property double largeTextFontSize: 36

//    Border的宽度
    property double borderWidth: 2

    property string svgPath: "file:///./../Resources/Icons/svgs/"
    Component.onCompleted: {
        if (typeof (svgPath) != "undefined" && svgPath !== null && svgPath.length > 0) {
            svgPath = svgPath
        }
        currentTheme = 0
    }

//    画刷
    property color themeColor
    property color themeNameColor
    property color backgroundColor
    property color secondarybackgroundColor
    property color thirdlybackgroundColor
    property color borderColor
    property color secondaryborderColor

    property color textColor
    property color secondarytextColor
    property color thirdlytextColor
    property color reversetextColor
    property color textIconColor

    property color dangerColor
    property color warningColor
    property color infoColor
    property color successColor

//    通用行为
    Behavior on themeColor {
        ColorAnimation {
            duration: 400
        }
    }
    Behavior on backgroundColor {
        ColorAnimation {
            duration: 400
        }
    }
//    Behavior on textColor {
//        ColorAnimation {
//            duration: 400
//        }
//    }

    property color control_hovered: Qt.darker(themeColor, 1.2)
    property color control_pressed: Qt.darker(themeColor, 1.4)
    property color control_disabled: Qt.lighter(backgroundColor, 2.0)

    function updateSizeProperty(scaleValue){
        //由于属性没有默认值，这里通过只读高度和当前高度来校正比例因子
        scaleValue = scaleValue * (readonlyControlHeight/defaultControlHeight);
        smallControlHeight = smallControlHeight * scaleValue;
        defaultControlHeight = defaultControlHeight * scaleValue;
        mediumControlHeight = mediumControlHeight * scaleValue;
        largeControlHeight = largeControlHeight * scaleValue;
        maximumHeight = maximumHeight * scaleValue;
        smallIconHeight = smallIconHeight * scaleValue;
        defaultIconHeight = defaultIconHeight * scaleValue;
        mediumIconHeight = mediumIconHeight * scaleValue;
        largeIconHeight = largeIconHeight * scaleValue;
        smallPadding = smallPadding * scaleValue;
        defaultPadding = defaultPadding * scaleValue;
        mediumPadding = mediumPadding * scaleValue;
        largePadding = largePadding * scaleValue;
        defaultCornerRadius = defaultCornerRadius * scaleValue;
        smallTextFontSize = smallTextFontSize * scaleValue;
        defaultTextFontSize = defaultTextFontSize * scaleValue;
        smallHeadTextFontSize = smallHeadTextFontSize * scaleValue;
        headTextFontSize = headTextFontSize * scaleValue;
        largeTextFontSize = largeTextFontSize * scaleValue;
        borderWidth = borderWidth * scaleValue;
    }

    property int currentTheme: -1
    onCurrentThemeChanged: {
        var t = themes.get(currentTheme)
        themeColor = t.themeColor
        themeNameColor = t.themeNameColor
        backgroundColor = t.backgroundColor
        secondarybackgroundColor = t.secondarybackgroundColor
        thirdlybackgroundColor = t.thirdlybackgroundColor
        borderColor = t.borderColor
        secondaryborderColor = t.secondaryborderColor
        textColor = t.textColor
        secondarytextColor = t.secondarytextColor
        thirdlytextColor = t.thirdlytextColor
        reversetextColor = t.reversetextColor
        textIconColor = t.textIconColor
        dangerColor = t.dangerColor
        warningColor = t.warningColor
        infoColor = t.infoColor
        successColor = t.successColor

//        control_hovered = t.control_hovered
//        control_pressed = t.control_pressed
//        control_disabled = t.control_disabled
    }
    property ListModel themes: ListModel {
        ListElement {
            name: "Default"
            themeColor: "#326cf3"
            themeNameColor: "#ffffff"
            backgroundColor: "#ffffff"
            secondarybackgroundColor: "#eeeeee"
            thirdlybackgroundColor: "#ffffff"
            borderColor: "#e0e0e0"
            secondaryborderColor: "#757575"
            textColor: "#212121"
            secondarytextColor: "#757575"
            thirdlytextColor: "#bdbdbd"

            reversetextColor: "#212121"
            textIconColor: "#ffffff"

            dangerColor: "#db3340"
            warningColor: "#e9af20"
            infoColor: "#00bcd4"
            successColor: "#2db84d"
        }
        ListElement {
            name: "Dark"
            themeColor: "#326cf3"
            themeNameColor: "#1c1c1c"
            backgroundColor: "#1c1c1c"
            secondarybackgroundColor: "#2d2d30"
            thirdlybackgroundColor: "#424242"
            borderColor: "#3f3f46"
            secondaryborderColor: "#555555"
            textColor: "#ffffff"
            secondarytextColor: "#757575"
            thirdlytextColor: "#3f3f46"

            reversetextColor: "#212121"
            textIconColor: "#ffffff"

            dangerColor: "#db3340"
            warningColor: "#e9af20"
            infoColor: "#00bcd4"
            successColor: "#2db84d"
        }
        ListElement {
            name: "Pink"
            themeColor: "#faa0c5"
            themeNameColor: "#faa0c5"
            backgroundColor: "#ffffff"
            secondarybackgroundColor: "#757575"
            thirdlybackgroundColor: "#3f3f46"
            borderColor: "#3f3f46"
            secondaryborderColor: "#555555"
            textColor: "#5c5c5c"
            secondarytextColor: "#757575"
            thirdlytextColor: "#3f3f46"

            reversetextColor: "#212121"
            textIconColor: "#ffffff"

            dangerColor: "#db3340"
            warningColor: "#e9af20"
            infoColor: "#00bcd4"
            successColor: "#2db84d"
        }
    }
}
