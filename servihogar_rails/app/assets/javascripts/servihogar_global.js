var servihogar = angular.module('servihogar', []);

// Close alerts throughout all the app

servihogar.directive('closeAlert', function() {
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
