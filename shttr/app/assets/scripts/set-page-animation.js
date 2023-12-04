window.addEventListener("turbo:before-render", (e) => {
  const css = document.styleSheets[1];
  nextPage = e.detail.newBody.firstElementChild.value;

  //this is gross :(
  if (nextPage < curPage) {
    css.cssRules[1313].style.setProperty("animation-name", "fade-out-down");
    css.cssRules[1314].style.setProperty("animation-name", "fade-in-down");
  } else {
    css.cssRules[1313].style.setProperty("animation-name", "fade-out-up");
    css.cssRules[1314].style.setProperty("animation-name", "fade-in-up");
  }
});
