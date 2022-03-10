// Fonts.qml
//加载fontawesome5 otf
pragma Singleton

import QtQuick 2.9

Item {
    id: fonts

    readonly property FontLoader fontAwesomeSolid: FontLoader {
        source: "./Basics/fonts/Font Awesome 6 Free-Solid-900.otf"
    }
    readonly property FontLoader iconFont: FontLoader {
        source: "./Basics/fonts/webfont.ttf"
    }

        //导出字体名，供外部使用
    readonly property string font: fonts.iconFont.name
    readonly property string icon: fonts.fontAwesomeSolid.name

}


