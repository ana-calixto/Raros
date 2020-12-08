// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'counter', 'topicId', 'button' ];

   refresh = () => {
    console.log('refresh')
     let id = this.topicIdTarget.innerText.trim();
    console.log(id)
    fetch(`/add-like-topic/${id}`, { method: "POST", headers: { accept: "application/json" }})
      .then(response => response.json())
      .then((data) => {
        // debugger
        if (data.liked) {
          this.buttonTarget.style.color = "#167FFB"
        } else {
          this.buttonTarget.style.color = "#167FFB"
        }
        this.counterTarget.innerText = data.counter;
      });
  }
}
