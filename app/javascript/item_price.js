const price = () => {

 




  const priceInput = document.getElementById('item-price');
  const taxDisplay = document.getElementById('add-tax-price');
  const profitDisplay = document.getElementById('profit');

  if (priceInput) {
    priceInput.addEventListener('input', () => {
      const price = parseInt(priceInput.value, 10);

      if (isNaN(price) || price < 300 || price > 9999999) {
        taxDisplay.textContent = ''; // 販売手数料の表示をクリア
        profitDisplay.textContent = ''; // 利益の表示をクリア
      } else {
        const tax = Math.floor(price * 0.1); // 販売手数料（10%）
        const profit = price - tax; // 販売利益

        taxDisplay.textContent = tax; // 販売手数料を表示
        profitDisplay.textContent = profit; // 販売利益を表示
      }
    });
  }

};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);