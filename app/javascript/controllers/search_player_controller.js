// app/javascript/controllers/search_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("Hello from search controller");
    // Connectez votre contrôleur ici
  }

  send(event) {
    event.preventDefault();

    fetch(this.formTarget.action, {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
      },
      body: new FormData(this.formTarget),
    })
      .then((response) => response.json())
      .then((data) => {
        console.log(data);

        // Utilisez this.element.dispatchEvent pour déclencher l'événement
        this.element.dispatchEvent(new Event("click"));
      });
  }
}
