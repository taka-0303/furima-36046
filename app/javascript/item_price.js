window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitRate = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    addTaxDom.innerHTML = `${Math.floor(inputValue / 10)}`;

    const taxResult = addTaxDom.innerHTML;
    profitRate.innerHTML = `${(inputValue - taxResult)}`;
  });

  
});