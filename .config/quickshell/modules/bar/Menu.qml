import Quickshell.Io
import qs.components
import qs.services

CustomButton {
  id: menu
  buttonText.text: ""
  buttonText.font.pointSize: Appearance.font.size + 2
  buttonText.bottomPadding: 3
  buttonText.color: "#51A2DA"
  mouseArea.onClicked: {
    openMenu.running = true;
  }

  Process {
    id: openMenu
    command: ["wofi", "--show", "drun"]
  }
}
