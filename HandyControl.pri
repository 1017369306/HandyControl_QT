#QT += gui quick qml quickcontrols2
#CONFIG += c++11

!build_Common_lib:{
    DEFINES +=Common_NO_LIB
}
INCLUDEPATH += $$PWD

HEADERS += \
    $$PWD/Common/Common/AllPath.h \
    $$PWD/Common/Common/FileReadWrite.h \
    $$PWD/Common/Common/JsonSerialize.h \
    $$PWD/Common/Common/MathHelp.h \
    $$PWD/Common/Common/ObjectMap.h \
    $$PWD/Common/Common/Package.h \
    $$PWD/Common/Common/PropertyHelper.h \
    $$PWD/Common/Common/Subject.h \
    $$PWD/Common/CommonGlobal.h \
    $$PWD/Common/Controls/Hello.h \
    $$PWD/Common/Frameless/FrameLessView.h \
    $$PWD/Common/Helps/DesktopHelper.h \
    $$PWD/Common/QuickTool/QuickTool.h \
    $$PWD/Common/Trans/Trans.h

SOURCES += \
    $$PWD/Common/Controls/Hello.cpp \
    $$PWD/Common/Helps/DesktopHelper.cpp \
    $$PWD/Common/QuickTool/QuickTool.cpp \
    $$PWD/Common/Trans/Trans.cpp

win32 {
    SOURCES += \
        $$PWD/Common/Frameless/FrameLessView_win.cpp
} else {
    SOURCES += \
        $$PWD/Common/Frameless/FrameLessView_unix.cpp
}

CONFIG(debug,debug|release){
    #debug模式直接用本地qml文件,不要qrc资源文件。这样调试快一些。
    win32{
        path=$$system("cd")
        path ~=s,\\\\,/,g
    } else {
        path=$$system("pwd")
    }
    HcImport=\"file:///$$path\"
    HcImage=\"file:///$$path/Themes/Basics/Images/\"
    HcSvg=\"file:///$$path/Themes/Basics/Icons/svgs/\"
#    DEFINES += HcImportPath=\\\"file:///$${path}\\\"
#    DEFINES += HcImagePath=\\\"file:///$${path}/Themes/Basics/Images/\\\"
#    DEFINES += HcSvgPath=\\\"file:///$${path}/Themes/Basics/Icons/svgs/\\\"
} else {
    #release模式用qrc、走资源文件。这样发布不会携带源码。
    RESOURCES += $$PWD/HcThemes/HcThemes.qrc

    # release mode set importPath with 'qrc:///'
    HcImport=\"qrc:/\"
    HcImage=\"qrc:/Themes/Basics/Images/\"
    HcSvg=\"qrc:/Themes/Basics/Icons/svgs/\"
#    DEFINES += HcImportPath=\\\"qrc:///\\\"
#    DEFINES += HcImagePath=\\\"qrc:/Themes/Basics/Images/\\\"
#    DEFINES += HcSvgPath=\\\"qrc:/Themes/Basics/Icons/svgs/\\\"
}

#如果此文件在内容文件夹内（HandyControl.pri在HandyControl文件夹内），这里的PATH需要指向当前目录的上一级目录；同理，如果此文件在内容文件夹的上一级目录，这里的PATH指向$$PWD
# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH	= $$PWD
QML2_IMPORT_PATH = $$PWD

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH = $$PWD

OTHER_FILES += \
#    LICENSE \
    $$PWD/.clang-format \
    $$PWD/.qmake.conf
#    .github/workflows/* \
#    scripts/* \
#    mkspecs/features/*

#RESOURCES += \
#    $$PWD/Tran.qrc

