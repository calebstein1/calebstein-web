window.addEventListener('DOMContentLoaded', () => {
  setColorScheme();
});
window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', () => {
  setColorScheme();
});

function setColorScheme() {
  if (window.matchMedia('(prefers-color-scheme: dark)').matches) {
    document.documentElement.setAttribute('data-bs-theme', 'dark');
  } else {
    document.documentElement.setAttribute('data-bs-theme', 'light');
  }
}
