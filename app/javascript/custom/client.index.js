

$(document).on("turbolinks:load", function(){
  
	var $_divAllProducts = $("#allProducts");
	var $_divPreProductAdd = $("#preAddProduct");
	var $_divEachProduct = $("div.row-product");
	
	var _template = $_divPreProductAdd.html();

	$_divEachProduct.click(function(){
		var id = $(this).data("product").id;

		$.getJSON("clients/pre_add_product", { id: id }, function(res){
			var _rendered = Mustache.render(_template, res);
			$_divPreProductAdd.html(_rendered);
			$_divPreProductAdd.show();
			$_divAllProducts.hide();
		});

		return false;
	});

	$("#btnCancel").click(function(){
		$_divPreProductAdd.hide();
		$_divAllProducts.show();
		return false;
	});

	$("#btnAdd").click(function(){
		alert("mah oi");
		return false;
	});

});
