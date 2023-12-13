// app/javascript/controllers/modal_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["button", "myModalForm"];

  connect() {}

  toggle() {
    if (this.myModalFormTarget) {
      const isHidden = this.myModalFormTarget.classList.contains("d-none");

      if (isHidden) {
        this.myModalFormTarget.classList.remove("d-none");
      } else {
        this.myModalFormTarget.classList.add("d-none");
      }
    } else {
      console.error("Form element not found");
    }
  }
}
