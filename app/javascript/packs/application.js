document.addEventListener("DOMContentLoaded", function() {
  const priceInput = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  priceInput.addEventListener("input", function() {
    const price = parseFloat(priceInput.value);
    if (!isNaN(price)) {
      const taxPrice = Math.floor(price * 0.1);
      const profitValue = Math.floor(price - taxPrice);
      addTaxPrice.textContent = taxPrice;
      profit.textContent = profitValue;
    }
  });
});
