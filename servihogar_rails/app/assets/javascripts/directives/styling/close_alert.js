// Close alerts throughout all the app

viasam.directive('closeAlert', function() {
  return {
    restrict: "AC",
    link: function($scope, $element) {
      $element.click(function(e){
        e.preventDefault();
        $element.closest(".alert").fadeOut();
      });
    }
  }
});
