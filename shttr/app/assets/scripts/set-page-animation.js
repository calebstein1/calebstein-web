window.addEventListener("turbo:before-fetch-request", (e) => {
  const css = document.styleSheets[1];
  nextPage = document.querySelector(`[href="${e.detail.url.pathname}"]`).parentElement.getAttribute("data-pageid");

  //this is gross :(
  if (nextPage < curPage) {
    css.cssRules[1313].style.setProperty("animation-name", "fade-out-down");
    css.cssRules[1314].style.setProperty("animation-name", "fade-in-down");
  } else {
    css.cssRules[1313].style.setProperty("animation-name", "fade-out-up");
    css.cssRules[1314].style.setProperty("animation-name", "fade-in-up");
  }

  if (viaSwipe == "left") {
    css.cssRules[1313].style.setProperty("animation-name", "fade-out-left");
    css.cssRules[1314].style.setProperty("animation-name", "fade-in-left");
    viaSwipe = false;
  } else if (viaSwipe == "right") {
    css.cssRules[1313].style.setProperty("animation-name", "fade-out-right");
    css.cssRules[1314].style.setProperty("animation-name", "fade-in-right");
    viaSwipe = false;
  }
});
