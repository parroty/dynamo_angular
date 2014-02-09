var app = angular.module('app', ["ngResource", "ngRoute"]).
  config(function ($routeProvider, $locationProvider) {
    $routeProvider.
        when("/",         {templateUrl: "/static/list.html", controller: "AppCtrl"}).
        when("/new",      {templateUrl: "/static/edit.html", controller: "NewCtrl"}).
        when("/edit/:id", {templateUrl: "/static/edit.html", controller: "EditCtrl"}).
        otherwise({redirectTo: "/"});
  }).
  config(["$httpProvider", function(provider) {
    provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
  }]);

app.factory("Crew", function($resource) {
  return $resource("/crews/:id", {id: "@id"}, {update: {method: "PUT"}, destroy: {method: "DELETE"}});
});

function EditCtrl($scope, $location, $routeParams, Crew) {
  $scope.title = "Edit Crew";
  $scope.person = Crew.get({id: $routeParams.id});

  $scope.save = function() {
    Crew.update($scope.person, "", function(response){
      $location.path("/");
    });
  }
}

function NewCtrl($scope, $location, Crew) {
  $scope.title = "New Crew";
  $scope.person = new Crew({name: "", description: ""});

  $scope.save = function() {
    Crew.save($scope.person, "", function(response) {
      $scope.crew.push(response);
      $location.path("/");
    });
  }
}

function AppCtrl($scope, $location, Crew){
  $scope.crew = Crew.query();

  $scope.destroy = function(id) {
    if (confirm("Are you sure?")) {
      Crew.remove({id: id}, function(response){
        angular.forEach($scope.crew, function(e, i) {
          if(e.id === id) {
            $scope.crew.splice(i, 1);
            return;
          }
        });
      });
    }
  };
}