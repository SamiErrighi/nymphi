var app = angular.module('app', ['ui.router']);

app.config(function($stateProvider, $urlRouterProvider) {
  //
  // For any unmatched url, redirect to /state1
  $urlRouterProvider.otherwise(function($injector, $location) {
     $state = $injector.get("$state");
     $state.go("home");
  });
  //
  // Now set up the states
  $stateProvider
    .state('home', {
      url: "/home",
      templateUrl: "partials/home.html",
      controller: 'homeCtrl'
    })
    .state('profile', {
        url: "/profile",
        templateUrl: "partials/profile.html",
        controller: 'profileCtrl'
    })
    .state('profile.update', {
        url: "/update",
        templateUrl: "partials/profile/update.html",
        controller: 'updateCtrl'
    });
});