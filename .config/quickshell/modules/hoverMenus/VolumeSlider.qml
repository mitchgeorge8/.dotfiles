import Quickshell.Io
import Quickshell.Services.Pipewire
// import QtQuick
import QtQuick.Controls
import qs.components
import qs.services

Slider {
  id: volumeSlider
  from: 0
  to: 100
  value: Math.round(Pipewire.defaultAudioSink.audio.volume * 100)
  orientation: Qt.Vertical
  implicitWidth: 50

  PwObjectTracker {
    objects: [Pipewire.defaultAudioSink, Pipewire.defaultAudioSource]
  }
}
