HEADERS += \
    $$PWD/Src/AppInfo.h

SOURCES += \
        $$PWD/Src/AppInfo.cpp \
        $$PWD/Src/main.cpp

CONFIG(debug, debug|release) {
    #debug模式直接用本地qml文件,不要qrc资源文件。这样调试快一些。
    win32{
        path=$$system("cd")
        path ~=s,\\\\,/,g
    } else {
        path=$$system("pwd")
    }
    qmlPath = \"file:///$${path}/Themes/Styles/\"
    imgPath = \"file:///$${path}/Themes/Basics/Images/\"
    svgPath = \"file:///$${path}/Themes/Basics/Icons/svgs/\"
    transDir = \"$${path}/Themes/Basics/Trans/\"
} else {
    #release模式用qrc、走资源文件。这样发布不会携带源码。
    RESOURCES += \
        $$PWD/Themes/Themes.qrc

    qmlPath = \"qrc:/Themes/\"
    imgPath = \"qrc:/Themes/Themes/Basics/Images/\"
    svgPath = \"qrc:/Themes/Themes/Basics/Icons/svgs/\"
    transDir= \"qrc:/Themes/Themes/Basics/Trans/\"
}
