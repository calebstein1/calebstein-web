let viMode = true;
let notLocked = true;
const viToggle = document.getElementById("vi-toggle");
const ua = navigator.userAgent;
const listener = SwipeListener(window);
let direction;

if ((ua.includes("iPhone")) || (ua.includes("iPad")) || (ua.includes("Android"))) {
  setTimeout(() => {
    document.getElementById("mobile-only").classList.remove("opacity-0");
    document.getElementById("mobile-only").classList.add("opacity-25");
  }, 10000);
  viToggle.style.display = "none";
  viMode = false;

  window.addEventListener("swipe", (e) => {
    direction = e.detail.directions;

    if ((direction.left) && (notLocked)) {
      notLocked = false;
      viaSwipe = "left";
      getInput("j");
      setTimeout(() => { notLocked = true }, 1000);
    } else if ((direction.right) && (notLocked)) {
      notLocked = false;
      viaSwipe = "right";
      getInput("k");
      setTimeout(() => { notLocked = true }, 1000);
    }
  });
}

window.addEventListener("wheel", (e) => {
  if ((e.wheelDeltaY > 0) && (notLocked)) {
    if (window.scrollY == 0) {
      notLocked = false;
      getInput("k");
      viaScroll = true;
      setTimeout(() => { notLocked = true }, 1000);
    }
  } else {
    if (((window.innerHeight + window.scrollY) >= document.body.scrollHeight) && (notLocked)) {
      notLocked = false;
      getInput("j");
      setTimeout(() => { notLocked = true }, 1000);
    }
  }
});

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
  curPage = Number(document.getElementById("page-id").value);
  const pageListId = [];
  Array.from(document.getElementById("nav").children).forEach(navItem => {
    if (!navItem.getAttribute("data-no-nav")) {
      pageListId.push(navItem.getAttribute("data-pageid"));
    }
  });

  if (input == "j") {
    nextPage = curPage + 1;
    if (nextPage <= Math.max(...pageListId)) {
      Turbo.visit(document.querySelector(`[data-pageid="${nextPage}"] > a`).getAttribute("href"));
    }
  } else if (input == "k") {
    nextPage = curPage - 1;
    if (nextPage >= Math.min(...pageListId)) {
      Turbo.visit(document.querySelector(`[data-pageid="${nextPage}"] > a`).getAttribute("href"));
    }
  } else if (input == "g") {
    nextPage = 1;
    if (curPage != nextPage) {
      Turbo.visit(document.querySelector(`[data-pageid="${nextPage}"] > a`).getAttribute("href"));
    }
  } else if (input == "G") {
    nextPage = Math.max(...pageListId);
    if (curPage != nextPage) {
      Turbo.visit(document.querySelector(`[data-pageid="${nextPage}"] > a`).getAttribute("href"));
    }
  }
}
