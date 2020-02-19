$.toast_message = function(options) {
  var _options = $.extend({
    message: null
  }, options);

  $("#toastMessage").html(_options.message);
  $("#toast").show();
  $("#toast").children().toast({delay:5000}).toast("show");
};
