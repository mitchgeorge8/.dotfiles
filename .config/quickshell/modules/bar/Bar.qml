import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.services

Variants {
  model: Quickshell.screens

  PanelWindow {
    id: bar
    required property var modelData
    screen: modelData
    anchors {
      top: true
      left: true
      right: true
    }
    exclusionMode: ExclusionMode.Ignore
    implicitHeight: Appearance.bar.top - 0.5 // Subtract the thickness of the border outline
    color: "transparent"

    Row {
      id: barLeft
      height: parent.height
      anchors.left: parent.left

      Menu {}
      Clock {}
    }

    Workspaces {
      id: barCenter
      height: parent.height
      anchors.centerIn: parent
    }

    Row {
      id: barRight
      height: parent.height
      anchors.right: parent.right

      SystemTray {}
      Volume {}
      // Network {}
      Power {}
    }
  }
}
