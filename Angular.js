/*
Angular is Front-end Framework build using Javascript by Google.
        AngularJS (1.x) was a web application framework for JavaScript that was designed and developed in the United States by Google .

        In Angular  using -HTML,CSS,JAVASCRIPT

        It is also like Bootstrp css freamwork.It has pre Build  .


So Angular is a singlr page Application

Spa- : Single Page Application
        It doesnt need to reload the page duringits use and work within a web Browser.

        Facebook ,gmail,map,twitter,Drive,github.


Angular is Javascript Freamwork.


    You can invoke a directive by using:

            Element name
            Attribute
            Class
            Comment

            E for Element name
            A for Attribute
            C for Class
            M for Comment

            By default the value is EA, meaning that both Element names and attribute names can invoke the directive.

AngularJS ng-model Directive
    The ng-model directive binds the value of HTML controls (input, select, textarea) to application data.

    The ng-model Directive
             With the ng-model directive you can bind the value of an input field to a variable created in AngularJS.  
             
             
            <div ng-app="myApp" ng-controller="myCtrl">
                Name: <input ng-model="name">
            </div>

            <script>
                var app = angular.module('myApp', []);
                    app.controller('myCtrl', function($scope) {
                    $scope.name = "John Doe";
                });
            </script>




    Two Way Binding :
                
                </script>
                <body>

                <div ng-app="myApp" ng-controller="myCtrl">
                    Name: <input ng-model="name">
                    <h1>You entered: {{name}}</h1>
                </div>

                <script>
                    var app = angular.module('myApp', []);
                    app.controller('myCtrl', function($scope) {
                        $scope.name = "John Doe";
                    });
                </script>

    validate Email:
                    
            <form ng-app="" name="myForm">
                Email:
                    <input type="email" name="myAddress" ng-model="text">
                    <span ng-show="myForm.myAddress.$error.email">Not a valid e-mail address</span>
            </form>

    Application Status :

            The ng-model directive can provide status for application data (valid, dirty, touched, error):

            Example :

            <form ng-app="" name="myForm" ng-init="myText = 'post@myweb.com'">
                Email:
                <input type="email" name="myAddress" ng-model="myText" required>
                <h1>Status</h1>
                    {{myForm.myAddress.$valid}}
                    {{myForm.myAddress.$dirty}}
                    {{myForm.myAddress.$touched}}
            </form>

    CSS Classes :

            The ng-model directive provides CSS classes for HTML elements, depending on their status:

            Example
                <style>
                    input.ng-invalid {
                    background-color: lightblue;
                    }
                </style>
                <body>

                    <form ng-app="" name="myForm">
                        Enter your name:
                        <input name="myName" ng-model="myText" required>
                    </form>
                </body>

    */
