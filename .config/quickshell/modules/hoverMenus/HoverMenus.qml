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
      implicitWidth: menu.width
      color: "transparent"

      Rectangle {
        id: menu
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: rightMenu.left
        width: 100
        height: 100
        color: "white"

        MouseArea {
          id: mouseArea
          anchors.fill: menu
          anchors.rightMargin: 5
          hoverEnabled: true

          states: State {
            name: "hover"
            when: mouseArea.containsMouse
            PropertyChanges {
              target: menu
              anchors.left: rightMenu.left
            }
          }

          transitions: Transition {
            to: "hover"
            reversible: true
            PropertyAnimation {
              properties: "anchors"
              duration: 100
              easing.type: Easing.InOutQuad
            }
          }
        }
      }
    }
  }
}
