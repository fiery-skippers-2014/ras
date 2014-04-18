$(window).resize(center_elements);

function center(element, rel_elt){
  element = element || ("#container")
  rel_elt = rel_elt || $(element).parent()

  $(element).css({
      position:'absolute',
      left: ($(rel_elt).width()  - $(element).outerWidth())/2,
      top:  ($(rel_elt).height() - $(element).outerHeight())/2
  });
}

function center_elements() {
    center("#container", window);
    center("#seed_form");
  }

$(document).ready(function(){
  center_elements();
  $("#seed_input").focus().val("")

  var thing = tempImg.pop()
  $('img').attr("src", thing.src)
  $('body').on('click', ".nextPhoto", function(){
    var moment = tempImg.pop()
    $('img').fadeOut('slow', function(){
      $('img').attr("src", moment.src)
      $('img').fadeIn('slow')
    })
  })

  window.onload = setInterval(function(){
    $.ajax({
      type: "get",
      url: "/moments"
    })
    .done(function(data){
      $(".script").replaceWith(data)
    })
    .fail(function(){console.log("fail")})
  },3000);
});