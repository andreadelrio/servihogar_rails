// WHYJOIN
viasam.directive('smoothScroll', function(){
  return {
    restrict: 'A',
    link: function($scope, $element) {
      $element.click(function(event){
          var $anchor = $(this);

          $('html, body').stop().animate({
              scrollTop: $($anchor.attr('href')).offset().top
          }, 1500,'easeInOutExpo');
          
          event.preventDefault();
      });
    }
  }
});
