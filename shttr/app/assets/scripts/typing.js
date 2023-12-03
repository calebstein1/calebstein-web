window.addEventListener("keydown", (event) => { 
  if ((document.activeElement.tagName != "INPUT") && (document.activeElement.tagName != "TEXTAREA")) {
    getInput(event.key);
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
