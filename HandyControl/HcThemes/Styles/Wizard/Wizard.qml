import QtQuick 2.9
import QtQuick.Controls 2.2
import HcThemes 1.0

Item {
    id: wizardItem
    signal wizardFinished
    property string totlaString: qsTr("Wizard %1/%2 >").arg(currentIndex + 1).arg(count) + HcStyle.transString
    property string operatorString: qsTr("Click any area to show next") + HcStyle.transString
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            currentIndex++
            if (currentIndex >= count) {
                wizardFinished()
            }
        }
    }
    property var model
    property int count: model.count
    property int currentIndex: 0
    Repeater {
        model: wizardItem.model
        delegate: WizardPage {
            anchors.fill: parent
            visible: index === currentIndex
            wizardName: model.name
            wizardDescript: model.descript
            targetObjectName: model.targetObjectName
            pageType: model.arrowType
            textColor: model.textColor
        }
    }
    BaseText {
        z: 999
        id: centerText
        anchors {
            right: parent.right
            bottom: parent.bottom
            rightMargin: HcStyle.maximumHeight * 4
            bottomMargin: HcStyle.maximumHeight * 2
        }
        text: totlaString
        color: model.get(currentIndex).textColor
        font.pixelSize: HcStyle.headTextFontSize
    }
    BaseText {
        z: 999
        anchors {
            left: centerText.left
            top: centerText.bottom
            topMargin: HcStyle.defaultPadding
//            horizontalCenterOffset: HcStyle.maximumHeight * 2
//            verticalCenterOffset: HcStyle.maximumHeight + centerText.height
        }
        color: model.get(currentIndex).textColor
        text: operatorString
    }
}
