import QtQuick 2.9
import QtQuick.Controls 2.2
import HcThemes 1.0

TextField {
    id: textField
    height: HcStyle.defaultControlHeight
    hoverEnabled: enabled
    selectByMouse: true
    color: HcStyle.textColor
    maximumLength: HcStyle.defaultControlHeight
    selectionColor: HcStyle.themeColor
    selectedTextColor: HcStyle.themeColor
    font.pixelSize: HcStyle.defaultTextFontSize
    background: DefaultBorder {
        color: (textField.enabled && !textField.readOnly) ? HcStyle.backgroundColor : HcStyle.control_disabled
        border.color: (textField.enabled && !textField.readOnly && (textField.hovered || textField.focus)) ? HcStyle.control_hovered : HcStyle.borderColor
    }
}
