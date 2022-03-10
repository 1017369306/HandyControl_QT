import QtQuick 2.9
import QtQuick.Controls 2.2
import HcThemes 1.0

//在qmldir文件中新增此行
//hcButton 1.0 Themes/Styles/Button.qml

ButtonDefault {
    id: buttonImage

    property string btnImgNormal
    property string btnImgHovered
    property string btnImgPressed
    property string btnImgDisbaled

    property double imgHeight:HcStyle.defaultIconHeight
    property double imgWidth:HcStyle.defaultIconHeight

    property string btnImgUrl: {
        if (!buttonImage.enabled) {
            return btnImgDisbaled
        } else if (buttonImage.pressed || selected) {
            return btnImgPressed
        } else if (buttonImage.hovered) {
            return btnImgHovered
        } else {
            return btnImgNormal
        }
    }
    contentItem:Image {
        id: contentImage
        source: btnImgUrl
        width: imgWidth
        height: imgHeight
        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter
    }

//    background: Item {
//        width: imgWidth
//        height: imgHeight
//        Image {
//            id: backImage
//            source: btnImgUrl
//            anchors.centerIn: parent
//        }
//    }
}
