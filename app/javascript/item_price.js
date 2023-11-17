const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
 });

const addTaxDom = document.getElementById("add-tax-price");

const profitDom = document.getElementById("profit");

priceInput.addEventListener("input", () => {
  let inputAmount = parseFloat(priceInput.value); // ユーザーが入力した金額を取得

  let taxPercentage = 0.1; // 手数料率（仮に10%とします）

  let taxAmount = inputAmount * taxPercentage; // 販売手数料を計算
  let roundedTaxAmount = Math.floor(taxAmount); // 販売手数料を整数に丸める

  let expenses = 500; 
  let profit = inputAmount - expenses - taxAmount; // 利益を計算
  let roundedProfit = Math.floor(profit); // 利益を整数に丸める

  // HTMLに表示
  addTaxDom.innerHTML = "販売手数料は " + roundedTaxAmount + " 円です";
  profitDom.innerHTML = "販売利益は " + roundedProfit + " 円です";
});