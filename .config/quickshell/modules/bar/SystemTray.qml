import Quickshell
import Quickshell.Services.SystemTray
import QtQuick
import qs.components
import qs.services


Row {
  id: systemTray
  spacing: 0

  Repeater {
    model: SystemTray.items
    
    CustomButton {
      id: trayItem
      required property SystemTrayItem modelData
      buttonImage.source: modelData.icon
      mouseArea.acceptedButtons: Qt.LeftButton | Qt.RightButton
      mouseArea.onClicked: (mouse)=> {
        console.log(modelData.menu)
        if (mouse.button == Qt.LeftButton) {
          modelData.activate()
        } else {
          if (modelData.hasMenu) {
            modelData.display(bar, barRight.x + trayItem.x + mouse.x, mouse.y)
          }
        }
      }
    }
  }
}
