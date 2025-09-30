import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.services

Variants {
  model: Quickshell.screens

  Scope {
    required property var modelData

    PanelWindow {
      id: top
      screen: modelData
      anchors {
        top: true
        left: true
        right: true
      }
      implicitHeight: Appearance.bar.top
      color: "transparent"
    }

    PanelWindow {
      id: bottom
      screen: modelData
      anchors {
        bottom: true
        left: true
        right: true
      }
      implicitHeight: Appearance.bar.bottom
      color: "transparent"
    }

    PanelWindow {
      id: left
      screen: modelData
      anchors {
        top: true
        bottom: true
        left: true
      }
      implicitWidth: Appearance.bar.left
      color: "transparent"
    }

    PanelWindow {
      id: right
      screen: modelData
      anchors {
        top: true
        bottom: true
        right: true
      }
      implicitWidth: Appearance.bar.right
      color: "transparent"
    }
  }
}
