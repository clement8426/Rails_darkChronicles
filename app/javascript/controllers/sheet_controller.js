import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="sheet"
export default class extends Controller {
  conect() {}

  loadSheetDetails(event) {
    event.preventDefault();

    const sheetId = event.currentTarget.dataset.sheetId;
    console.log("Clicked button with sheet_id:", sheetId);

    // Effectuez une requête AJAX pour récupérer les détails de la feuille
    fetch(`/sheets/${sheetId}`)
      .then((response) => response.json())
      .then((data) => {
        // Mettez à jour l'affichage des détails de la feuille avec les données récupérées.
        console.log("Sheet details:", data);
        // Ajoutez votre logique d'affichage ici
      })
      .catch((error) => {
        console.error("Error:", error);
        return Promise.reject(error); // Rejeter la promesse pour passer au bloc suivant
      })
      .then((errorMessage) => console.error("Error message:", errorMessage));
  }
}
