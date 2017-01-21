function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).parent().prev().append(content.replace(regexp, new_id));
  return false;
}

function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".tasks").fadeOut();
}

$(document).ready(function(){
  $("button").click(function(){
    $(".test").toggle();
  });
});
