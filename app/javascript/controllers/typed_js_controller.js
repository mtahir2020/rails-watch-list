import { Controller } from "@hotwired/stimulus"
import Typed from 'typed.js'

// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
    console.log('yep, typed connected');
    new Typed(this.element, {
      strings: ["My movies...", "My lists...", "MyCinema"],
      typeSpeed: 20,
      loop: true
    })
  }
}
