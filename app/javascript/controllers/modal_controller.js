// app/javascript/controllers/modal_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["button", "myModalForm"];

  connect() {
    if (this.buttonTarget) {
      this.buttonTarget.addEventListener(
        "click",
        this.handleButtonClick.bind(this)
      );
    }
  }

  handleButtonClick(event) {
    event.preventDefault(); // Prevent the default behavior of the button if needed

    if (this.myModalFormTarget) {
      this.myModalFormTarget.classList.toggle("d-none");
    } else {
      console.error("Form element not found");
    }
  }
}
