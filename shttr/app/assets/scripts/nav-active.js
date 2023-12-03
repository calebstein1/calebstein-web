window.addEventListener("turbo:load", () => {
  const pageList = Array.from(document.getElementById("nav").children);
  let pageID = 1;
  pageList.forEach(navItem => {
    navItem.setAttribute("data-pageid", pageID);
    pageID++;
  });
  const curPage = document.getElementById("page-id").value;

  if (window.matchMedia('(prefers-color-scheme: dark)').matches) {
    document.querySelector(`[data-pageid="${curPage}"]`).classList.add("bg-dark");
  } else {
    document.querySelector(`[data-pageid="${curPage}"]`).classList.add("bg-light");
  }
});

window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', () => {
  const curPage = document.getElementById("page-id").value;

  if (window.matchMedia('(prefers-color-scheme: dark)').matches) {
    document.querySelector(`[data-pageid="${curPage}"]`).classList.remove("bg-light");
    document.querySelector(`[data-pageid="${curPage}"]`).classList.add("bg-dark");
  } else {
    document.querySelector(`[data-pageid="${curPage}"]`).classList.remove("bg-dark");
    document.querySelector(`[data-pageid="${curPage}"]`).classList.add("bg-light");
  }
});
