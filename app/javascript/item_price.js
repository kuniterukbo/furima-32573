window.addEventListener('load', () => {
  const item_price = document.getElementById("item-price");
  const add_tax_price = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  item_price.addEventListener("input", () =>{
    const inputValue = item_price.value;
    add_tax_price.innerHTML = Math.floor(inputValue * 0.1)
    profit.innerHTML = inputValue - Math.floor((inputValue * 0.1))
  })
});