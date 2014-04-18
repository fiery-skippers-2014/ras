$(window).resize(center_elements);

function center(element, rel_elt){
  var element = element || ("#container")
  var rel_elt = rel_elt || $(element).parent()

  $(element).css({
      position:'absolute',
      left: ($(rel_elt).width()  - $(element).outerWidth())/2,
      top:  ($(rel_elt).height() - $(element).outerHeight())/2
  });
}

function center_elements() {
  center("#container", window);
  center("#seed_form");
  center("#gallery");
}

function change_img(offset){
  current_image_index += offset;

  if (current_image_index >= tempImg.length) { current_image_index = 0; }
  if (current_image_index < 0) { current_image_index = tempImg.length - 1; }

  var moment = tempImg[current_image_index];

  $('#image').fadeOut(function(){
    $('#image').attr("src", moment.src);
    $('#image').fadeIn();
  })
}

function focus_seed() {
  $("#seed_input").focus().val("")
}

function bind_keys() {
  $("body").keydown(function(e) {
    if(e.keyCode == 37) { // left
      change_img(-1);
    }

    else if(e.keyCode == 39) { // right
      change_img(1);
    }
  });
}

$(document).ready(function(){
  center_elements();
  focus_seed();
  bind_keys();
});