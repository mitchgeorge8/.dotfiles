import Quickshell.Io
import Quickshell.Services.Pipewire
import QtQuick
import qs.components
import qs.services

CustomButton {
  id: volume
  buttonText.text: setVolume()
  mouseArea.onClicked: pavucontrol.running = true
  mouseArea.onWheel: wheel => {
    let currentVolume = Pipewire.defaultAudioSink.audio.volume;
    if (wheel.angleDelta.y > 0) {
      Pipewire.defaultAudioSink.audio.volume = currentVolume + 0.01;
    } else {
      Pipewire.defaultAudioSink.audio.volume = currentVolume - 0.01;
    }
  }

  Process {
    id: pavucontrol
    command: ["pavucontrol"]
  }

  PwObjectTracker {
    objects: [Pipewire.defaultAudioSink, Pipewire.defaultAudioSource]
  }

  function setVolume(): string {
    let newVolume = Pipewire.defaultAudioSink.audio.volume;
    let icon = "";
    if (newVolume == 0) {
      icon = "󰕿 ";
    } else if (newVolume < 0.5) {
      icon = "󰖀 ";
    } else {
      icon = "󰕾 ";
    }
    return icon + Math.round(newVolume * 100);
  }
}
