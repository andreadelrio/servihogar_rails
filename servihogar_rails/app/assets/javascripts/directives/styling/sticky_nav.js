viasam.directive('stickyNav', function(){
  return {
    restrict: 'A',
    link: function($scope, $element) {
      $element.sticky();
    }
  }
});
