$(document).on("turbolinks:load", function(){
  $("#formLogin").submit(function(){
    $("#errorMessage").remove();
  });
});
