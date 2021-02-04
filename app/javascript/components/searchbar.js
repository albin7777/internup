const searchbar = document.querySelector("#search-internships")
if (searchbar) {
  searchbar.addEventListener("submit", (event) => {
  event.preventDefault();
  const keyword = document.querySelector("#search_query").value;

});
}


export { searchbar };
