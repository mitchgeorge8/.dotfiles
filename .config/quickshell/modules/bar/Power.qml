import QtQuick
import Quickshell.Io
import qs.components
import qs.services

Row {
  id: powerMenu
  spacing: 0
  layoutDirection: Qt.RightToLeft

  CustomButton {
    id: shutdown
    buttonText.text: ""
    buttonText.color: Appearance.color.base08
    mouseArea.onClicked: shutdownProcess.running = true
  }

  Row {
    id: otherOptions
    spacing: 0
    layoutDirection: Qt.RightToLeft
    width: 0
    clip: true

    CustomButton {
      id: reboot
      buttonText.text: ""
      buttonText.color: Appearance.color.base0B
      mouseArea.onClicked: rebootProcess.running = true
    }

    CustomButton {
      id: lock
      buttonText.text: ""
      buttonText.color: Appearance.color.base0E
      mouseArea.onClicked: lockProcess.running = true
    }
  }

  states: State {
    name: "hover"
    when: shutdown.mouseArea.containsMouse || reboot.mouseArea.containsMouse || lock.mouseArea.containsMouse
    PropertyChanges {
      otherOptions.width: reboot.width + lock.width
    }
  }

  transitions: Transition {
    to: "hover"
    reversible: true
    NumberAnimation {
      properties: "width"
      duration: 300
      easing.type: Easing.InOutQuad
    }
  }

  Process {
    id: shutdownProcess
    command: ["shutdown", "now"]
  }

  Process {
    id: rebootProcess
    command: ["reboot"]
  }

  Process {
    id: lockProcess
    command: ["hyprlock"]
  }
}
