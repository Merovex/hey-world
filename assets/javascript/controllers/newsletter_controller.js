import { Controller } from "../stimulus.min.js"

export default class extends Controller {
  static targets = ["email", "success"]

  connect() {
    // Check if user has already subscribed
    if (localStorage.getItem("newsletter_subscribed")) {
      this.showSuccess()
    }
  }

  submit(event) {
    // Let the form submit normally
    // After successful submission, show success message
    setTimeout(() => {
      localStorage.setItem("newsletter_subscribed", "true")
      this.showSuccess()
    }, 1000)
  }

  showSuccess() {
    if (this.hasSuccessTarget) {
      this.successTarget.style.display = "block"
      this.element.querySelector("form").style.display = "none"
    }
  }
}