window.addEventListener("turbo:load", () => {
  if (viaScroll) {
    document.documentElement.scrollTop = document.body.scrollHeight;
    viaScroll = false;
  }

  const pageList = Array.from(document.getElementById("nav").children);
  let pageID = 1;
  pageList.forEach(navItem => {
    navItem.setAttribute("data-pageid", pageID);
    pageID++;
  });
  prevPage = curPage
  curPage = document.getElementById("page-id").value;

  if (Array.from(document.getElementById("navMenu").classList).includes("show")) {
    document.getElementById("btn-close").click();
  }

  if (colorScheme == "dark") {
    document.querySelector(`[data-pageid="${prevPage}"]`).classList.remove("bg-dark");
    document.querySelector(`[data-pageid="${curPage}"]`).classList.add("bg-dark");
  } else {
    document.querySelector(`[data-pageid="${prevPage}"]`).classList.remove("bg-light");
    document.querySelector(`[data-pageid="${curPage}"]`).classList.add("bg-light");
  }
});
