let viMode = true;
let notLocked = true;
const viToggle = document.getElementById("vi-toggle");

viToggle.addEventListener("click", () => {
  if (viMode) {
    viMode = false;
    viToggle.classList.remove("btn-secondary");
    viToggle.classList.add("btn-outline-secondary");
  } else {
    viMode = true;
    viToggle.classList.remove("btn-outline-secondary");
    viToggle.classList.add("btn-secondary");
  }
});

window.addEventListener("keydown", (event) => { 
  if ((viMode) && (notLocked) && (document.activeElement.tagName != "INPUT") && (document.activeElement.tagName != "TEXTAREA")) {
    notLocked = false;
    getInput(event.key);
    setTimeout(() => { notLocked = true }, 1000);
  }
});

function getInput(input) {
  const curPage = Number(document.getElementById("page-id").value);
  const pageListId = [];
  Array.from(document.getElementById("nav").children).forEach(navItem => {
    if (!navItem.getAttribute("data-no-nav")) {
      pageListId.push(navItem.getAttribute("data-pageid"));
    }
  });

  if (input == "j") {
    let nextPage = curPage + 1;
    if (nextPage <= Math.max(...pageListId)) {
      Turbo.visit(document.querySelector(`[data-pageid="${nextPage}"] > a`).getAttribute("href"));
    }
  } else if (input == "k") {
    let nextPage = curPage - 1;
    if (nextPage >= Math.min(...pageListId)) {
      Turbo.visit(document.querySelector(`[data-pageid="${nextPage}"] > a`).getAttribute("href"));
    }
  } else if (input == "g") {
    let nextPage = 1;
    if (curPage != nextPage) {
      Turbo.visit(document.querySelector(`[data-pageid="${nextPage}"] > a`).getAttribute("href"));
    }
  } else if (input == "G") {
    let nextPage = Math.max(...pageListId);
    if (curPage != nextPage) {
      Turbo.visit(document.querySelector(`[data-pageid="${nextPage}"] > a`).getAttribute("href"));
    }
  }
}
