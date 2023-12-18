document.addEventListener('click', function(e) {
  window.lastClickedLink = e.target;
}, false);

window.addEventListener("turbo:before-fetch-request", (e) => {
  const css = document.documentElement;
  nextPage = document.querySelector(`[href="${e.detail.url.pathname}"]`).parentElement.getAttribute("data-pageid");

  //this is gross :(
  if (nextPage < curPage) {
    css.style.setProperty("--animation-name-exit", "fade-out-down");
    css.style.setProperty("--animation-name-enter", "fade-in-down");
  } else {
    css.style.setProperty("--animation-name-exit", "fade-out-up");
    css.style.setProperty("--animation-name-enter", "fade-in-up");
  }

  if (window.lastClickedLink && window.lastClickedLink.getAttribute("data-id") == "blogLink") {
    css.style.setProperty("--animation-name-exit", "fade-out-left");
    css.style.setProperty("--animation-name-enter", "fade-in-left");
  } else if (window.lastClickedLink && window.lastClickedLink.getAttribute("data-id") == "backToPosts") {
    css.style.setProperty("--animation-name-exit", "fade-out-right");
    css.style.setProperty("--animation-name-enter", "fade-in-right");
  }

  if (viaSwipe == "left") {
    css.style.setProperty("--animation-name-exit", "fade-out-left");
    css.style.setProperty("--animation-name-enter", "fade-in-left");
    viaSwipe = false;
  } else if (viaSwipe == "right") {
    css.style.setProperty("--animation-name-exit", "fade-out-right");
    css.style.setProperty("--animation-name-enter", "fade-in-right");
    viaSwipe = false;
  }
});
