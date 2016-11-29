$(document).ready(function(){
  function navbarWhite() {
    // Turn navbar white
    $('.navbar').css({"background-color": "#fff", "border-bottom": "1px solid #444" });
    $('#logo-light').addClass("no-display");
    $('#logo-dark').removeClass("no-display");
  }

  function navbarTransparent() {
    // Turn navbar transparent
    $('.navbar').css({"background-color": "transparent", "border-bottom": "none" });
    $('.logo-light').removeClass("invisible");
    $('.logo-dark').addClass("invisible");
  }

  $(window).scroll(function() {
    var scroll = $(window).scrollTop(); // how many pixels user has scrolled
    var banner_height = $('#banner').height(); // height of div1 in pixels
    var navbar_height = 70; // height of navbar
    if(scroll > (banner_height + navbar_height)) {
        navbarWhite();
    } else {
      navbarTransparent();
    }
  });
});
