pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Hyprland

Singleton {
  id: root

  readonly property var toplevels: Hyprland.toplevels
  // readonly property QtObject workspaces: Hyprland.workspaces
  // readonly property QtObject windows: getWindows()
  // readonly property QtObject window: getWindow()

  Connections {
    target: Hyprland

    function onRawEvent(event: HyprlandEvent): void {
      const n = event.name;
      if (n.endsWith("v2")) {
        return;
      }

      if (n == "openwindow" || n == "closewindow" || n == "movewindow") {
        Hyprland.refreshToplevels();
      }

    // for (let i = 0; i < Hyprland.toplevels.values.length; i++) {
    //   console.log(Hyprland.toplevels.values[i].lastIpcObject.class);
    // }
    }
  }
}
