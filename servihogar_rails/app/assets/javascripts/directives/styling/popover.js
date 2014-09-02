viasam.directive('popover', function(){
  return {
    restrict: 'A',
    link: function ($scope, $element) {
      $element.on("mouseenter", function(e){
        e.preventDefault();
        $element.popover("show");
      });
      $element.on("mouseleave", function(e){
        e.preventDefault();
        $element.popover("hide");
      });
    }
  }
});
