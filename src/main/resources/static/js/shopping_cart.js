$(document).ready(function(){
   
   $("input[type=checkbox]").on("change", function(){
      
      if($(this).hasClass("cart_checkbox_all")) {
         var total = parseInt(document.getElementById("total_pr").innerText);
         var total1 = parseInt(document.getElementById("total_pr1").innerText);
         var prd = document.getElementsByClassName("cart_checkbox");
         
         var selectedValues = [];
         $(".quantitySelect").each(function() {
             var selectedValue = $(this).val();
             selectedValues.push(selectedValue);
         });
         
         if($(this).is(":checked")) {
            $(".cart_checkbox").prop("checked", true);
            for(var i = 0; i < prd.length; i++ ) {
               var prd_price_str = prd.item(i).value;
               var prd_price = parseInt(prd_price_str);
               var quantity = parseInt(selectedValues[i]);
               var total_price = prd_price * quantity;
               total = total + total_price;
               total1 = total1 + total_price;
               document.getElementById("total_pr").innerHTML = total;
               document.getElementById("total_pr1").innerHTML = total1;
            }
         } else {
            $(".cart_checkbox").prop("checked", false);
            
            for(var i = 0; i < prd.length; i++) {
               var prd_price_str = prd.item(i).value;
               var prd_price = parseInt(prd_price_str);
               var quantity = parseInt(selectedValues[i]);
               var total_price = prd_price * quantity;
               total = total - total_price;
               total1 = total1 - total_price;
               document.getElementById("total_pr").innerHTML = total;
               document.getElementById("total_pr1").innerHTML = total1;
            }
         }
      } else if($(this).hasClass("cart_checkbox")) {
         var total = parseInt(document.getElementById("total_pr").innerText);
         var total1 = parseInt(document.getElementById("total_pr1").innerText);
         
         if($(this).is(":checked")) {
            var per_total_str = $(this).val();
            var per_total = parseInt(per_total_str);
            var quantity = $(this).siblings(".quantitySelect").val();
            var total_price = per_total * quantity;
            total = total + total_price;
            total1 = total1 + total_price;
            document.getElementById("total_pr").innerHTML = total;
            document.getElementById("total_pr1").innerHTML = total1;
         } else {
            var per_total_str = $(this).val();
            var per_total = parseInt(per_total_str);
            var quantity = $(this).siblings(".quantitySelect").val();
            var total_price = per_total * quantity;
            total = total - total_price;
            total1 = total1 - total_price;
            document.getElementById("total_pr").innerHTML = total;
            document.getElementById("total_pr1").innerHTML = total1;
         }
      }
      
      if(total1>=50000){
		  document.getElementById("shippingfee").innerText="무료";
	  } else if (total1<50000) {
		  document.getElementById("shippingfee").innerText= 3000 ;
	  }
      
   });
   
});