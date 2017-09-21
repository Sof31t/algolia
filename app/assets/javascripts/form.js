$(document).ready(function() {

  $(document).on("click","#toggle",function() {
    $('#form').toggle("slow");
  });

  $(document).on("click","#hide",function() {
    $('#form').hide("slow");
  });

});
