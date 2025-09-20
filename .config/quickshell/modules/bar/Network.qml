import Quickshell.Io
import QtQuick
import qs.components
import qs.services

CustomButton {
    id: network
    buttonText.text: setIcon()
    mouseArea.onClicked: networkmanager.running = true

    Process {
        id: getCurrentNetwork
        running: true
        command: ["nmcli", "connection", "show", "--active"]
        stdout: StdioCollector {
            onStreamFinished: console.log(this.text)
        }
    }

    Process {
        id: networkmanager
        command: ["nm-connection-editor"]
    }

    function setIcon(): string {
        let currentNetwork = "";
        let icon = "";
        return icon;
    }
}
