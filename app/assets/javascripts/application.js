// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require masonry/jquery.masonry
//= require foundation
//= require isotope/jquery.isotope
//= require_tree .

$(function(){ 
  $(document).foundation(); 

  $(".hoodchecker").html('<i class="fa fa-map-marker"</i> <span>Your Neighbourhood</span>')
  $(".hoodcheckerheader").html('<i class="fa fa-map-marker"</i> <span>Meet Your Street</span>')

  $(".addpost").html('<i class="fa fa-plus"</i> <span>Add Post</span>')
  $(".howto").html('<i class="fa fa-question"</i> <span>How To</span>')


  $(".file-upload").html('Upload User Image')
  $(".file-upload-post").html('Upload Post Image')

  $(".videocontainer").prop('muted', true); //mute

   $(".anchor").click(function(e){
      $('html, body').animate({
       scrollTop: $($(this).attr('href')).offset().top
      }, 1000);
   });

  $('#arrow').addClass('animated infinite bounce');

  function checkWindow() {
    var video = $('video');
    if (window.innerWidth >= 640) {
      video.attr('class', 'play');
      video.currentTime = 0;
      video[0].play();
      return "play";
    } else if (window.innerWidth < 640) {
      video.attr('class', 'pause');
      video[0].pause();
      return "pause";
    };
  }
  
  $(window).resize(checkWindow);
  checkWindow();

});
