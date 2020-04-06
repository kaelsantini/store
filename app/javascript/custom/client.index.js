

$(document).on("turbolinks:load", function(){
  
	var _currentProduct;
	
	var $_divAllProducts = $("#allProducts");
	var $_divPreProductAdd = $("#preAddProduct");
	var $_divEachProduct = $("div.row-product");
	var $_divClientCart = $("#divClientCart");
	var $_divProductsCount = $(".productsCount");
	var $_divProductsAmount = $(".productsAmount");

	var $_productName = $(".product-name");
	var $_productPrice = $(".product-price");
	var $_productDescription = $(".product-description");
	var $_inputQty = $("#inputQty");

	$_divEachProduct.click(function(){
		var id = $(this).data("product").id;

		$.getJSON("clients/pre_add_product", { product: id }, function(res){
			_currentProduct = res;
			$_productName.text(res.name);
			$_productPrice.text("$ " + res.price);
			$_productDescription.text( res.description );
			$_divPreProductAdd.show();
			$_divAllProducts.hide();
		});

		return false;
	});

	
	$("#btnCancel").click(function(){
		$_divPreProductAdd.hide();
		$_divAllProducts.show();
		$_inputQty.val( 1 );
		return false;
	});

	$("#btnAdd").click(function(){

		$.post("/clients/add_product", {
			product: _currentProduct.id,
			quantity: $_inputQty.val()
		}, function(res){
			$_divPreProductAdd.hide();
			$_divAllProducts.show();
			$_inputQty.val( 1 );
			_fnRefreshClientCart( res );
		});

		return false;
	});

	$("#btnAddQty").click(function(){
		$_inputQty.val( parseInt( $_inputQty.val() ) + 1 );
		return false;
	});
	
	$("#btnRmvQty").click(function(){
		var qty = $_inputQty.val();
		if ( qty > 0 )
			$_inputQty.val( parseInt( $_inputQty.val() ) - 1 );
		return false;
	});
		
	
	var _fnRefreshClientCart = function(products) {
		$_divProductsCount.html( products.length );
		var _total = 0;
		for ( var i = 0; i < products.length; i++ ) {
			_total += products[0].total_product;
		}
		$_divProductsAmount.html( _total );
	};

});
