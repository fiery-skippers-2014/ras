$(document).ready(function() {
  var thing = tempImg.pop()
  $('img').attr("src", thing.src)
  $('body').on('click', ".nextPhoto", function(){
    var moment = tempImg.pop()
    $('img').fadeOut('slow', function(){
      $('img').attr("src", moment.src)
      $('img').fadeIn('slow')
    })
  })
});
