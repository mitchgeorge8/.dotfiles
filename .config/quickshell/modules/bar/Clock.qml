import qs.components
import qs.services

CustomButton {
  id: clock
  buttonText.text: Time.format("dddd, MMMM d h:mm AP")
}
