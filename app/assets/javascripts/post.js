$(document).ready(function(){
  $("#new_article").on("ajax:success", function(response){
    console.log(response);
    console.log("helloS!");
    $("#new_article").html(xhr.responseText);
  }).on( "ajax:error", function(e, xhr, status, error) {
      $("#new_article").append("<p>ERROR</p>")
    });
});
