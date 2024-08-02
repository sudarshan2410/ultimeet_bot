/****************************************************************************
**
** Copyright (C) 2021 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Qt Quick Controls 2 module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:COMM$
**
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** $QT_END_LICENSE$
**
**
**
**
**
**
**
**
**
**
**
**
**
**
**
**
****************************************************************************/

import QtQuick 2.12
import HelperWidgets 2.0
import QtQuick.Layouts 1.12

Column {
    width: parent.width

    Section {
        width: parent.width
        caption: qsTr("TextArea")

        SectionLayout {
            Label {
                text: qsTr("Placeholder")
                tooltip: qsTr("Placeholder text displayed when the editor is empty.")
            }
            SecondColumnLayout {
                LineEdit {
                    backendValue: backendValues.placeholderText
                    Layout.fillWidth: true
                }

            }

            Label {
                text: qsTr("Hover")
                tooltip: qsTr("Whether text area accepts hover events.")
            }
            SecondColumnLayout {
                CheckBox {
                    text: backendValues.hoverEnabled.valueToString
                    backendValue: backendValues.hoverEnabled
                    Layout.fillWidth: true
                }
            }
        }
    }

    Section {
        width: parent.width
        caption: qsTr("Placeholder Text Color")

        ColorEditor {
            caption: qsTr("Placeholder Text Color")
            backendValue: backendValues.placeholderTextColor
            supportGradient: false
        }
    }

    StandardTextSection {
        width: parent.width
        showIsWrapping: true
        showFormatProperty: true
        showVerticalAlignment: true
    }

    FontSection {
        width: parent.width
    }

    PaddingSection {
        width: parent.width
    }

    InsetSection {
        width: parent.width
    }
}