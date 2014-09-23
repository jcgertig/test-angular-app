/*jshint strict:false */
angular.module('testApp').controller('HomeCtrl', function($scope, $log, Item, Notice){
  $scope.items = [];
  $scope.newItem = { name: '' };

  $scope.createItem = function() {
    Item.create($scope.newItem, function(res){
      Notice.add(res.message);
      $scope.getAllItems();
    });
    
    $scope.newItem = { name: '' };
  };

  $scope.getAllItems = function() {
    Item.getAllItems({}, function(res){
      $scope.items = res.items;
      $log.info($scope.items);
    });
  };

  $scope.init = function() {
    Notice.init();
    $log.info($scope.items);
    $scope.getAllItems();
  };
});
