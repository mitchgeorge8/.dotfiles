import QtQuick
import QtQuick.Controls
import Quickshell
import qs.services

Rectangle {
  id: background
  implicitWidth: buttonWidth() + Appearance.button.horizontalMargin
  implicitHeight: Appearance.bar.top
  color: Appearance.color.base00
  clip: true
  property alias buttonImage: buttonImage
  property alias buttonText: buttonText
  property alias mouseArea: mouseArea

  Image {
    id: buttonImage
    width: Appearance.icon.size
    height: Appearance.icon.size
    anchors.centerIn: background
  }

  Text {
    id: buttonText
    anchors.centerIn: background
    font.family: Appearance.font.family
    font.pointSize: Appearance.font.size
    color: Appearance.color.base05
  }

  MouseArea {
    id: mouseArea
    anchors.fill: background
    hoverEnabled: true
  }

  states: State {
    name: "hover"
    when: mouseArea.containsMouse
    PropertyChanges {
      background.color: Appearance.color.base02
    }
  }

  transitions: Transition {
    to: "hover"
    reversible: true
    ColorAnimation {
      duration: 100
    }
  }

  function buttonWidth(): real {
    let width = 0;
    if (buttonImage.source != "") {
      width = buttonImage.width;
    } else {
      width = buttonText.implicitWidth;
    }
    return width;
  }
}
