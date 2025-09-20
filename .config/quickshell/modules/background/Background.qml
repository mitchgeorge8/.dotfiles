import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Effects
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

    PanelWindow {
      id: background
      screen: modelData
      anchors {
        top: true
        bottom: true
        left: true
        right: true
      }
      exclusionMode: ExclusionMode.Ignore
      aboveWindows: false
      color: "transparent"

      Rectangle {
        anchors.fill: parent
        color: Appearance.color.base00
      }

      Rectangle {
        width: image.width - (Appearance.bar.left + Appearance.bar.right) + 1
        height: image.height - (Appearance.bar.top + Appearance.bar.bottom) + 1
        x: Appearance.bar.left - 0.5
        y: Appearance.bar.top - 0.5
        radius: Appearance.bar.radius + 0.5
        color: Appearance.color.base06
      }

      Image {
        id: image
        source: "/usr/share/backgrounds/mountain-stream.jpg"
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        sourceSize.width: background.screen.width
        sourceSize.height: background.screen.height
        visible: false
      }

      MultiEffect {
        source: image
        anchors.fill: image
        maskEnabled: true
        maskSource: mask
        maskThresholdMin: 0.5
        maskSpreadAtMin: 1.0
      }

      Item {
        id: mask
        anchors.fill: image
        layer.enabled: true
        layer.smooth: true
        visible: false

        Rectangle {
          width: image.width - (Appearance.bar.left + Appearance.bar.right)
          height: image.height - (Appearance.bar.top + Appearance.bar.bottom)
          x: Appearance.bar.left
          y: Appearance.bar.top
          radius: Appearance.bar.radius
        }
      }
    }

    // function getBackground(workspace: string): string {
    //   let path = "/home/mitchell/config/home-manager/wallpapers/workspace" + workspace + ".jpg";
    //   if (workspace > 4) {
    //     path = "/home/mitchell/config/home-manager/wallpapers/workspace1.jpg";
    //   }
    //   return path;
    // }
  }
}
