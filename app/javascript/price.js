window.addEventListener('input', () => {

  const priceInput = document.getElementById("item-price");
    const inputValue = priceInput.value;
    console.log(inputValue);

  const addTaxDom= document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
    console.log(addTaxDom);

  const salesProfit  = document.getElementById("profit");
  const value_result = inputValue * 0.1;
    console.log(value_result);
    salesProfit.innerHTML = (Math.floor(inputValue - value_result));
      console.log(salesProfit ); 
})


