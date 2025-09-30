import QtQuick
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
import qs.components
import qs.services

Row {
  id: workspaces
  spacing: 0

  Repeater {
    model: Hyprland.workspaces

    CustomButton {
      id: workspace
      required property HyprlandWorkspace modelData
      buttonText.text: wsIcons()
      buttonText.color: Appearance.color.base04
      mouseArea.onClicked: modelData.activate()

      states: [
        State {
          name: "active"
          when: modelData.active
          PropertyChanges {
            workspace.buttonText.color: Appearance.color.base05
          }
        }
      ]

      transitions: Transition {
        to: "active"
        reversible: true
        ColorAnimation {
          duration: 100
        }
      }

      function wsIcons(): string {
        Hyprland.refreshToplevels();
        let icons = "";
        for (let i = 0; i < modelData.toplevels.values.length; i++) {
          const winClass = modelData.toplevels.values[i].lastIpcObject.class;
          const winName = DesktopEntries.heuristicLookup(winClass).name;
          console.log(winName);
          let icon = "";

          if (winName == "LibreWolf") {
            icon = "󰖟";
          } else if (winName == "kitty") {
            icon = "";
          } else if (winName == "mpv Media Player") {
            icon = "";
          } else if (winName == "Volume Control") {
            icon = "";
          } else if (winName == "Omnissa Horizon Client") {
            icon = "";
          } else if (winName == "Steam") {
            icon = "";
          }

          if (icons == "") {
            icons = icon;
          } else {
            icons = icons + " " + icon;
          }
        }
        return icons == "" ? modelData.name : icons;
      }
    }
  }
}
