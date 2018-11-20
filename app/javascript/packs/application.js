import "bootstrap";

  document.querySelectorAll(".toggle-menu").forEach((x) => {
    x.addEventListener("click", (e) => {
    document.querySelector(".menupopup").classList.toggle("hidden");
    document.querySelector("#restofpage").classList.toggle("hidden");

    });
  });
