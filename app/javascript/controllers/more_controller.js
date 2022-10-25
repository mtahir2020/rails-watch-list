import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="more"
export default class extends Controller {
static targets = [ "dots", "button", "span" ]

  connect() {
    console.log('working!');
    console.log(this.spanTarget);
  }

  readMore() {
    console.log('clicked!');
    if (this.spanTarget.style.display === "none") {
      console.log(this.spanTarget);
      this.spanTarget.style.display = "inline";
      this.dotsTarget.style.display = "none";
      this.buttonTarget.innerText = "Read less"
    } else {
      this.spanTarget.style.display = "none"
      this.dotsTarget.style.display = "inline"
      this.buttonTarget.innerText = "Read more"
    }

  }
}
