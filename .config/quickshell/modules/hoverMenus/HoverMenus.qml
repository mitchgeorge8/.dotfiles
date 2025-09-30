import Quickshell
import QtQuick
import QtQuick.Shapes
import qs.services

Variants {
  model: Quickshell.screens

  Scope {
    required property var modelData

    PanelWindow {
      id: rightMenu
      screen: modelData
      anchors {
        top: true
        bottom: true
        right: true
      }
      exclusionMode: ExclusionMode.Ignore
      implicitWidth: drawer.width
      color: "transparent"

      Rectangle {
        id: drawer
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        width: 100
        height: 100
        color: "white"

        MouseArea {
          id: mouseArea
          anchors.fill: drawer
          hoverEnabled: true

          states: State {
            name: "hover"
            when: mouseArea.containsMouse
            PropertyChanges {
              drawer.width: 50
            }
          }

          transitions: Transition {
            to: "hover"
            reversible: true
            NumberAnimation {
              properties: "width"
              duration: 100
              easing.type: Easing.InOutQuad
            }
          }
        }
      }
      Shape {
        id: corner
        width: 10
        height: 10
        anchors.right: drawer.right
        anchors.bottom: drawer.top

        ShapePath {
          strokeWidth: 2
          strokeColor: "white"
          fillColor: "transparent"

          startX: corner.width
          startY: 0
          PathArc {
            x: 0
            y: corner.height
            radiusX: 10
            radiusY: 10
          }
        }
      }
    }
  }
}
