function initializePriceInput() {
  const priceInput = document.getElementById("item-price");
  if (priceInput) {
    priceInput.removeEventListener("input", updatePrices);
    priceInput.addEventListener("input", updatePrices);
  }
}

function updatePrices() {
  const priceInput = document.getElementById("item-price");
  if (!priceInput) return;

  const addTaxDom = document.getElementById("add-tax-price");
  const addProfitDom = document.getElementById("profit");

  addTaxDom.innerHTML = Math.round(priceInput.value * 0.1);
  addProfitDom.innerHTML = Math.round(priceInput.value - Math.round(priceInput.value * 0.1));
}

document.addEventListener('turbo:load', initializePriceInput);
document.addEventListener('turbo:render', initializePriceInput);

document.addEventListener('turbo:load', updatePrices);
document.addEventListener('turbo:render', updatePrices);
