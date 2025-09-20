pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell

Singleton {
  id: root

  property string theme: "kanagawa" // Change this to set current theme

  // Appearance.color
  property QtObject color: {
    if (root.theme == "kanagawa") {
      return root.kanagawa;
    } else if (root.theme == "gruvboxDarkSoft") {
      return root.gruvboxDarkSoft;
    } else {
      return root.custom;
    }
  }

  // Base16 color scheme
  // Guidelines: https://github.com/chriskempson/base16/blob/main/styling.md
  // Schemes: https://github.com/tinted-theming/base16-schemes/tree/main
  property QtObject custom
  custom: QtObject {
    property color base00: "#1C1C1C"
    // property color base01: ""
    property color base02: "#32174D"
    // property color base03: ""
    property color base04: "#808080"
    property color base05: "#FFFFFF"
    property color base06: "#FFFFFF"
    // property color base07: ""
    property color base08: "#ffb6b6"
    // property color base09: ""
    // property color base0A: ""
    property color base0B: "#b6ffb6"
    // property color base0C: ""
    // property color base0D: ""
    property color base0E: "#c5a5e4"
    // property color base0F: ""
  }

  property QtObject kanagawa
  kanagawa: QtObject {
    property color base00: "#1F1F28"
    property color base01: "#16161D"
    property color base02: "#223249"
    property color base03: "#54546D"
    property color base04: "#727169"
    property color base05: "#DCD7BA"
    property color base06: "#C8C093"
    property color base07: "#717C7C"
    property color base08: "#C34043"
    property color base09: "#FFA066"
    property color base0A: "#C0A36E"
    property color base0B: "#76946A"
    property color base0C: "#6A9589"
    property color base0D: "#7E9CD8"
    property color base0E: "#957FB8"
    property color base0F: "#D27E99"
  }

  property QtObject gruvboxDarkSoft
  gruvboxDarkSoft: QtObject {
    property color base00: "#32302f"
    property color base01: "#3c3836"
    property color base02: "#504945"
    property color base03: "#665c54"
    property color base04: "#bdae93"
    property color base05: "#d5c4a1"
    property color base06: "#ebdbb2"
    property color base07: "#fbf1c7"
    property color base08: "#fb4934"
    property color base09: "#fe8019"
    property color base0A: "#fabd2f"
    property color base0B: "#b8bb26"
    property color base0C: "#8ec07c"
    property color base0D: "#83a598"
    property color base0E: "#d3869b"
    property color base0F: "#d65d0e"
  }

  // Appearance.font
  property QtObject font
  font: QtObject {
    property string family: "SansSerif"
    property real size: 11
  }

  // Appearance.icon
  property QtObject icon
  icon: QtObject {
    property real size: 16
  }

  // Appearance.bar
  property QtObject bar
  bar: QtObject {
    property real top: 30
    property real bottom: 5
    property real left: 5
    property real right: 5
    property real radius: 10
  }

  // Appearance.button
  property QtObject button
  button: QtObject {
    property real horizontalMargin: 18
    property real verticalMargin: 5
    property real insidePadding: 5
    property real outsidePadding: 10
    property real radius: 100
  }
}
