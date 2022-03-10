TEMPLATE = app
TARGET = HandyControl_Demo

QT += gui quick qml quickcontrols2 svg
#CONFIG += c++11
CONFIG += c++17 qtquickcompiler utf8_source

win32:mingw  {
    LIBS += -lDwmapi
}

include($$PWD/../../HandyControl/HandyControl.pri)
include($$PWD/HandyControl_Demo.pri)

DEFINES += QMAKE_GEN_GlobalData
!build_pass {
    headerContents = \
        "$${LITERAL_HASH}pragma once" \
        "$${LITERAL_HASH}define HcImport $${HcImport}" \
        "$${LITERAL_HASH}define HcImage $${HcImage}" \
        "$${LITERAL_HASH}define HcSvg $${HcSvg}" \
        "$${LITERAL_HASH}define qmlPath $${qmlPath}" \
        "$${LITERAL_HASH}define imgPath $${imgPath}" \
        "$${LITERAL_HASH}define transDir $${transDir}"

    write_file($$PWD/../../HandyControl/Common/Common/AllPath.h, headerContents)
}
