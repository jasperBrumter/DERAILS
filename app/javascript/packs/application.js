import "bootstrap";

  document.querySelectorAll(".toggle-menu").forEach((x) => {
    x.addEventListener("click", (e) => {
    document.querySelector(".menupopup").classList.toggle("hidden");
    document.querySelector("#restofpage").classList.toggle("hidden");

    });
  });


    const addressInput = document.getElementById('ticket_address');

    if (addressInput) {
      const places = require('places.js');
      const placesAutocomplete = places({
        container: addressInput
      });
      console.log(places)
    }

