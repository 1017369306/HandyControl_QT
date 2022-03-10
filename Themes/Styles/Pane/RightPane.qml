import QtQuick 2.9
import QtQuick.Controls 2.2
import HcThemes 1.0

Loader {
    id: rootLoader
    property string homeUrl: qmlPath + "Page/Home.qml"

    source: homeUrl
    clip: true
    Column {
        spacing: HcStyle.defaultPadding
        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
        }
        ButtonIconTransparent {
            objectName: "wizardBtn"
            visible: rootLoader.item && typeof (rootLoader.item.wizardModel) !== "undefined" && rootLoader.item.wizardModel.count > 0
            width: HcStyle.largeIconHeight
            height: HcStyle.largeIconHeight
            font.family: Fonts.icon
            font.pixelSize: HcStyle.largeIconHeight
            text: "\uf6e8"
            tipText: qsTr("Wizard") + trans.transString
            onClicked: {
                var pRoot = rootLoader
                while (pRoot.parent !== null) {
                    pRoot = pRoot.parent
                }
                rootLoader.item.wizardModel.hcTextColor = String(HcStyle.textIconColor)
                rootLoader.item.wizardModel.hcReversetextColor = String(HcStyle.textColor)
                wizardComp.createObject(pRoot, {model: rootLoader.item.wizardModel })
            }
        }
//        CusButton_ImageColorOverlay {
//            objectName: "wizardBtn"
//            width: 32
//            height: 32
//            visible: rootLoader.item && typeof (rootLoader.item.wizardModel) !== "undefined" && rootLoader.item.wizardModel.count > 0
//            btnImgNormal: imgPath + "Common/wizard.png"
//            tipText: qsTr("Wizard") + trans.transString
//            onClicked: {
//                var pRoot = rootLoader
//                while (pRoot.parent !== null) {
//                    pRoot = pRoot.parent
//                }
//                wizardComp.createObject(pRoot, {model: rootLoader.item.wizardModel })
//            }
//        }
//        CusButton_ImageColorOverlay {
//            width: 32
//            height: 32
//            visible: isDebug && source && source != homeUrl
//            btnImgNormal: imgPath + "Common/view.png"
//            tipText: qsTr("View Source Code") + trans.transString
//            onClicked: {
//                Qt.openUrlExternally(source)
//            }
//        }
    }
    Component {
        id: wizardComp
        Wizard {
            id: cusWizard
            anchors.fill: parent
            currentIndex: 0
            onWizardFinished: {
                destroy(cusWizard)
            }
        }
    }
}

