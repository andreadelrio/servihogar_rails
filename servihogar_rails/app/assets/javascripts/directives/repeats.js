// Hide last datepicker unless the Repeats select is changed

viasam.directive('repeats', function(){
  return {
    restrict: 'C',
    link: function($scope, $element) {
      $element.on('change', function(){
        $('.boundary').removeClass('hidden');
      });
    }
  }
});
