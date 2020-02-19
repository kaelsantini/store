$.fn.clear_form_errors = function() {
  this.find(".is-invalid").removeClass("is-invalid");
  this.find("div.invalid-feedback").remove();
};

$.fn.render_form_errors = function(model_name, errors) {
  _form = this;
  model_name = model_name ? model_name : "";
  this.clear_form_errors();

  $.each(errors, function(field, messages){
      _input = _form.find("input, select, textarea").filter(function(){
        _name = $(this).attr("name");
        if (_name) {
          return _name.match(new RegExp(model_name + '\\[' + field + '\\(?'));
        }
        return false;
      });
      _input.addClass("is-invalid");
      _input.parent().append("<div class='invalid-feedback'>" + $.map(messages, function(m){
        return m.charAt(0).toUpperCase() + m.slice(1);
      }).join("<br />") + "</div>");
  });
};

$.confirm_dialog = function(options) {
  _options = $.extend({
    title: "",
    message: "",
    okCallBack: $.noop,
    cancelCallBack: $.noop
  }, options);

  var $_modal = $("#modal").modal();
  $_modal.find("#modalTitle").html(_options.title);
  $_modal.find(".modal-body").html(_options.message);
  $_modal.find("#btnModalCancel").unbind().bind("click", function(){
    _options.cancelCallBack();
    $_modal.modal("hide");
    return false;
  });
  $_modal.find("#btnModalConfirm").unbind().bind("click", function(){
    _options.okCallBack();
    $_modal.modal("hide");
    return false;
  });
  $_modal.modal("show");
};

$(document).on("turbolinks:load", function() {

  $.ajaxSetup({
    error: function(response) {
      if ( response && response.responseJSON && response.responseJSON.message ) {
        $.toast_message({message: response.responseJSON.message});
      }
    }
  });

  $("form").on("ajax:error", function(ev){
    _model = $(this).attr("model");
    $(this).render_form_errors(_model, ev.detail[0]);
  });

  $("a.destroy-link").click(function(){
    var _this = $(this);
    var _idRowToDestroy = _this.attr("data-row-id");
    var _message = _this.attr("data-message");
    var _messageToShow = "This record will be destroyed: <br /><strong>" + _message + "</strong>";

    $.confirm_dialog({
      title: "Confirm destroy action",
      message: _messageToShow,
      okCallBack: function() {
        $.ajax({
          type: "DELETE",
          url: _this.attr("href"),
          success: function(){
            $("#" + _idRowToDestroy).remove();
          }
        });
      }
    });

    return false;
  });

});
