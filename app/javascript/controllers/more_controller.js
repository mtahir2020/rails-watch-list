import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="more"
export default class extends Controller {
  connect() {
    console.log('working!');
  }
}
