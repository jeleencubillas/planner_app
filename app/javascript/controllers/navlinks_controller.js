import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "current", "next" ]

  toggle() {
    this.currentTarget.classList.remove("active");
    this.nextTarget.classList.add("active");
  }
}
