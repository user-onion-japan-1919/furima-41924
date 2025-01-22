document.addEventListener('DOMContentLoaded', () => {
  const priceInput = document.getElementById('item-price');
  const taxDisplay = document.getElementById('add-tax-price');
  const profitDisplay = document.getElementById('profit');

  priceInput.addEventListener('input', () => {
    const price = parseInt(priceInput.value, 10);
    if (isNaN(price) || price < 300 || price > 9999999) {
      taxDisplay.textContent = '';
      profitDisplay.textContent = '';
    } else {
      const tax = Math.floor(price * 0.1); // 販売手数料（10%）
      const profit = price - tax;         // 販売利益
      taxDisplay.textContent = tax;
      profitDisplay.textContent = profit;
    }
  });
});