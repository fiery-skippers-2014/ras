$(document).ready(function() {
  var thing = moments.pop()
  $('img').attr('src', thing)
  $('body').on('click', ".nextPhoto", function(){
    var moment = moments.pop()
    $('img').attr('src', moment)
  })
});
