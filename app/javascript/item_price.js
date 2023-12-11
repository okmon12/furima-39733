document.addEventListener("DOMContentLoaded", () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

priceInput.addEventListener("input", () => {
  let inputAmount = parseFloat(priceInput.value); 

  let taxPercentage = 0.1; 

  let taxAmount = inputAmount * taxPercentage; 
  let roundedTaxAmount = Math.floor(taxAmount); 

  let profit = inputAmount - taxAmount;
  let roundedProfit = Math.floor(profit); 

  addTaxDom.innerHTML =  roundedTaxAmount;
  profitDom.innerHTML =  roundedProfit;
 });
});

