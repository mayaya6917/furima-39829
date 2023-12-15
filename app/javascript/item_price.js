document.addEventListener("DOMContentLoaded", function() {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

  priceInput.addEventListener("input", function() {
    const price = parseFloat(priceInput.value);
  
    const tax = calculateTax(price);
    const profit = calculateProfit(price);

    addTaxDom.innerHTML = `${tax}`;
    profitDom.innerHTML = `${profit}`;
  });

  function calculateTax(price) {
    return Math.floor(price * 0.1);
  }

  function calculateProfit(price) {
    return Math.floor(price - calculateTax(price));
  }
});
