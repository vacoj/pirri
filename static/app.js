(function() {
    var app = angular.module('pirriweb', []);
    app.Root = '/';
    app.config(['$interpolateProvider',
        function($interpolateProvider) {
            $interpolateProvider.startSymbol('{[');
            $interpolateProvider.endSymbol(']}');
        }
    ]); 

    app.controller('PirriControl', function ($rootScope, $scope, $http) {
        $scope.currentPage = 'home'; // history / home / settings / add
        $scope.stations = undefined;
        $scope.showHome = true;
        $scope.showAdd = false;
        $scope.gpio_pins = undefined;
        $scope.searchResults = {};
        $scope.searchText = "";
        $scope.showSearchResults = false;
        $scope.gpio_add_model = {
            default_message: "Select GPIO",
            GPIO: undefined
        };
        $scope.show_gpio_diagram = false;

        this.filterForKeys = function(searchText) {
            $scope.searchResults = [];
            $scope.stations.forEach(function(k) {
                var n = k.search(searchText);
                if (n >= 0) {
                    $scope.searchResults[k] = true;
                }
            });
            if (Object.keys($scope.searchResults).length > 0) {
                $scope.showSearchResults = true;
            } else {
                $scope.showSearchResults = false;
            }
            if (searchText === "") {
                $scope.searchResults = [];
                $scope.showSearchResults = false;
            }
        };

        // $scope.publishChange = function() {
        //     var queryString = "";
        //     $http.get('/send?' + queryString)
        //     .success(function(data, status, headers, config) {
        //     })
        //     .error(function(data, status, headers, config) {})
        // };
        this.resetAddForm = function() {
            $scope.gpio_add_model = {
                default_message: "Select GPIO", 
                GPIO: undefined
            };
        };

        this.setGPIO = function(gpio) {
            $scope.gpio_add_model.GPIO = gpio;
        };

        this.setPage = function(pageName) {
            $scope.currentPage = pageName;
            if ($scope.currentPage == 'home') {
                $scope.showHome = true;
                $scope.showAdd = false;
                this.resetAddForm();
            }
            if ($scope.currentPage == 'add') {
                $scope.showAdd = true;
                $scope.showHome = false;
                this.resetAddForm();
            }
            console.log($scope.currentPage)
        };

        this.settingsPage = function(sid) {

        };

        this.historyPage = function(sid) {

        }

        this.loadStations = function() {
            $http.get('/station/list')
            .success(function(data, status, headers, config) {
                $scope.stations = data.stations;
            })
            .error(function(data, status, headers, config) {})
        };

        this.loadGPIO = function() {
            $http.get('/gpio/list')
            .success(function(data, status, headers, config) {
                $scope.gpio_pins = data.gpio_pins;
            })
            .error(function(data, status, headers, config) {})
        };

        this.loadStations();
        this.loadGPIO();
    });
})();