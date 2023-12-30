document.addEventListener('DOMContentLoaded', () => {
  const priceInput = document.getElementById("item-price");

  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1);

      const addProfitDom = document.getElementById("profit");
      addProfitDom.innerHTML = Math.floor(priceInput.value - Math.round(priceInput.value * 0.1));
    });
  } else {
    console.error("Element with id 'item-price' not found");
  }
});