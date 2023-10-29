JavaScript 
        is a dynamic language, 
        supporting object-oriented, 
        imperative, and declarative (e.g. functional programming) styles.

=============================================================================================
*/BAsics
=============================================================================================
Variables 
        in JavaScript can be defined using the const, let or var keyword.

        A variable can reference different values over its lifetime when using let or var.

    --->    myFirstVariable can be defined and redefined many times using the assignment operator =:

            let myFirstVariable = 1;
            myFirstVariable = 'Some string';
            myFirstVariable = new SomeComplexClass();


    -->In contrast to let and var, variables that are defined with const can only be assigned once. This is used to define constants in JavaScript.

            const MY_FIRST_CONSTANT = 10;

                // Can not be re-assigned.
            MY_FIRST_CONSTANT = 20;
                // => TypeError: Assignment to constant variable.

Function Declarations : 

            In JavaScript, units of functionality are encapsulated in functions, usually grouping functions together in the same file if they belong together. These functions can take parameters (arguments), and can return a value using the return keyword. Functions are invoked using () syntax.

            function add(num1, num2) {
            return num1 + num2;
            }

            add(1, 3);
            // => 4

            💡 In JavaScript there are many different ways to declare a function. These other ways look different than using the function keyword. The track tries to gradually introduce them, but if you already know about them, feel free to use any of them. In most cases, using one or the other isn''t better or worse.

Exposing to Other Files : 

            To make a function, a constant, or a variable available in other files, they need to be exported using the export keyword. 
            
            Another file may then import these using the import keyword. This is also known as the module system. 
            A great example is how all the tests work. E 

            // file.js
                 export const MY_VALUE = 10;

                export function add(num1, num2) {
                return num1 + num2;
                }

            // file.spec.js
                import { MY_VALUE, add } from './file';

                add(MY_VALUE, 5);
            // => 15

=======================================================================================================================
Javascript Data Types
            JavaScript provides different data types to hold different types of values. 
            There are two types of data types in JavaScript.

            1.Primitive data type

                String	represents sequence of characters e.g. "hello"
                Number	represents numeric values e.g. 100
                Boolean	represents boolean value either false or true
                Undefined	represents undefined value
                Null	represents null i.e. no value at all

            2.Non-primitive (reference) data type
                Object	represents instance through which we can access members
                Array	represents group of similar values
                RegExp	represents regular expression
=================================================================================================================

Javascript Variables
            global 
            Local 
            
         A JavaScript global variable is declared outside the function or declared with window object. It can be accessed from any function.

            var value=50;//global variable  

            function a(){  
                alert(value);  
            }  
            function b(){  
                alert(value);  
            }  

            --------------

            function c(){
                d="this is also global variable beacause wecan not define `var` ";
                return d;
            }
            alert(c);

            
        A JavaScript local variable is declared inside block or function. It is accessible within the function or block only. For example:

            <script>  
                function abc(){  
                var x=10;//local variable  
                }  
            </script>  
===================================================================================================================

JavaScript Array
            JavaScript array is an object that represents a collection of similar type of elements.

            There are 3 ways to construct array in JavaScript

            1.By array literal
            2.By creating instance of Array directly (using new keyword)
            3.By using an Array constructor (using new keyword)


            1) JavaScript array literal
                The syntax of creating array using array literal is given below:

                var arrayname=[value1,value2.....valueN];  
                As you can see, values are contained inside [ ] and separated by , (comma).

                Lets see the simple example of creating and using array in JavaScript.

                <script>  
                    var emp=["Sonoo","Vimal","Ratan"];  
                    for (i=0;i<emp.length;i++){  
                        document.write(emp[i] + "<br/>");  
                    }  
                </script>  

            2) JavaScript Array directly (new keyword)
                The syntax of creating array directly is given below:

                var arrayname=new Array();  
                Here, new keyword is used to create instance of array.

                Lets see the example of creating array directly.

                <script>  
                    var i;  
                    var emp = new Array();  
                    emp[0] = "Arun";  
                    emp[1] = "Varun";  
                    emp[2] = "John";  
                    
                    for (i=0;i<emp.length;i++){  
                        document.write(emp[i] + "<br>");  
                    }  
                </script>  

                 
                Output  :

                Arun
                Varun
                John

             3) JavaScript array constructor (new keyword)

                Here, you need to create instance of array by passing arguments in constructor so that we dont have to provide value explicitly.

                The example of creating object by array constructor is given below.

                <script>  
                    var emp=new Array("Jai","Vijay","Smith");  
                    for (i=0;i<emp.length;i++){  
                        document.write(emp[i] + "<br>");  
                    }  
                </script>  
                
                Output :
                Jai
                Vijay
                Smith

=============================================================================================================================

JavaScript String :

            The JavaScript string is an object that represents a sequence of characters.

            There are 2 ways to create string in JavaScript

                1.By string literal
                2.By string object (using new keyword)
           
            1) By string literal
                The string literal is created using double quotes. The syntax of creating string using string literal is given below:

                var stringname="string value";  
           
             
                <script>  
                    var str="This is string literal";  
                    document.write(str);  
                </script>  
                 
                Output:

                This is string literal

            2) By string object (using new keyword)
            The syntax of creating string object using new keyword is given below:

                 var stringname=new String("string literal");  

            Here, new keyword is used to create instance of string.

            Lets see the example of creating string in JavaScript by new keyword.

                <script>  
                    var stringname=new String("hello javascript string");  
                    document.write(stringname);  
                </script>  
            
            Output:

            hello javascript string

============================================================================================================================

JavaScript Number Object

            The JavaScript number object enables you to represent a numeric value. It may be integer or floating-point. JavaScript number object follows IEEE standard to represent the floating-point numbers.

            By the help of Number() constructor, you can create number object in JavaScript. For example:

                         var n=new Number(value);  
           
            If value can t be converted to number, it returns NaN(Not a Number) that can be checked by isNaN() method.

            You can direct assign a number to a variable also. For example:

            var x=102;//integer value  
            var y=102.7;//floating point value  
            var z=13e4;//exponent value, output: 130000  
           
            var n=new Number(16);//integer value by number object  




            ----https://www.javatpoint.com/document-object-model

         Document Object Model

            Document Object Model (DOM) is a programming interface for web pages and XML documents. It allows programmers to interact with the content of a web page.
             
            The document object represents the whole html document.

            When html document is loaded in the browser, it becomes a document object. 



            Method	                    Description

            write("string")	            writes the given string on the doucment.
            writeln("string")	        writes the given string on the doucment with newline character at the end.
            getElementById()	        returns the element having the given id value.
            getElementsByName()	        returns all the elements having the given name value.
            getElementsByTagName()	    returns all the elements having the given tag name.
            getElementsByClassName()	returns all the elements having the given class nam

=========================================================================================================
                                    JavaScript OOPs
===========================================================================================================

JavaScript Classes
            In JavaScript, 
            classes are the special type of functions. 
            We can define the class just like function declarations and function expressions.

            The JavaScript class contains various class members within a body including methods or constructor. The class is executed in strict mode. So, the code containing the silent error or mistake throws an error.

            The class syntax contains two components:

               1. Class declarations
               2. Class expressions

        Class Declarations

            A class can be defined by using a class declaration. A class keyword is used to declare a class with any particular name. According to JavaScript naming conventions, the name of the class always starts with an uppercase letter.

           Example :

            <script>  
            //Declaring class  
                class Employee  
                {  
                //Initializing an object  
                    constructor(id,name)  
                    {  
                    this.id=id;  
                    this.name=name;  
                    }  

                //Declaring method  
                    detail()  
                    {  
                        document.writeln(this.id+" "+this.name+"<br>")  
                    }  
                }  
                //passing object to a variable   
                var e1=new Employee(101,"Martin Roy");  
                var e2=new Employee(102,"Duke William");  
                e1.detail(); //calling method  
                e2.detail();  
            </script>  
             
            Output:
                101 Martin Roy
                102 Duke William

        Class expressions:

            Another way to define a class is by using a class expression. Here, it is not mandatory to assign the name of the class. So, the class expression can be named or unnamed. The class expression allows us to fetch the class name. However, this will not be possible with class declaration.

            Unnamed Class Expression
            The class can be expressed without assigning any name to it.

            Lets see an example.

            <script>  
            var emp = class {  
            constructor(id, name) {  
                this.id = id;  
                this.name = name;  
            }  
            };  
            document.writeln(emp.name);  
            </script>  
            Test it Now
            Output:

            emp

======================================================================================================================================================================
----Event Bubbling or Event Capturing
    https://www.youtube.com/watch?v=cHUpfQGgskw


                Event bubbling and event capturing are two different phases of event propagation in the DOM (Document Object Model) when an event occurs on an HTML element. These phases determine the order in which event handlers are executed when multiple elements are nested within each other.

                Bydefault is "FASLE"--Bubbling--bottom-TO-top
                             "TRUE" --Capturing-TOP-To-Bottom

                addEventListener(event,function,usecapture)

                addEventListner("click",)

           Event Bubbling:

                In the event bubbling phase, the innermost element s event handler is executed first, and then the event propagates or "bubbles up" through the ancestor elements, triggering their event handlers in order. The event bubbles from the target element to the root of the document.

              
                    <div id="outer">
                        <button id="inner">Click me</button>
                    </div>
                    -------------
                    <script>
                        document.getElementById("inner").addEventListener("click", function() {
                            alert("Inner button clicked");
                        });

                        document.getElementById("outer").addEventListener("click", function() {
                            alert("Outer div clicked");
                        });
                    </script>
                    ---------------
                When you click the "Click me" button, the inner button s event handler is executed first, followed by the outer div s event handler.

            Event Capturing:

                In the event capturing phase, the "event starts at the root" of the document and trickles down through the ancestor elements to the target element. Event handlers on ancestor elements are executed before the event reaches the target element.

               
                    <div id="outer">
                        <button id="inner">Click me</button>
                    </div>

                    <script>
                        document.getElementById("inner").addEventListener("click", function() {
                            alert("Inner button clicked");
                        }, true);

                        document.getElementById("outer").addEventListener("click", function() {
                            alert("Outer div clicked");
                        }, true);
                    </script>



    Stop propagation

                when you clicked btn,then only btn cllicked other  parent element is not cllicked by using  " event.stopPropagation() "
            
            <!DOCTYPE html>
            <html>
            <head>
            <title>Event Propagation Example</title>
            </head>
            <body>
            <div id="outer" style="background-color: lightgray; padding: 20px;">
                <button id="inner" style="background-color: lightblue;">Click me</button>
            </div>

            <script>
                const innerButton = document.getElementById("inner");
                const outerDiv = document.getElementById("outer");

                innerButton.addEventListener("click", function(event) {
                alert("Inner button clicked");
                event.stopPropagation(); // Stop the event from propagating further
                });

                outerDiv.addEventListener("click", function() {
                alert("Outer div clicked");
                });
            </script>
            </body>
            </html>


---------------------------------------------------------------------------------------------------------------------------------------------------------------------

        JavaScript Hoisting
        
        JavaScript hoisting is a mechanism in the language that allows variable and function declarations to be moved to the top of their containing scope during the compilation phase. This means that you can use a variable or call a function before it s declared in your code. However, the assignment (initialization) of variables is not hoisted.

        

        Variable Hoisting:

                        Variable declarations using var are hoisted to the top of their containing function or global scope.
                        The variable declaration is moved to the top of the function, but the assignment (if any) remains in place.

                        
                console.log(x); // Outputs: undefined
                var x = 5;

                             The code above is treated like this during execution:

            
                var x;  // Declaration is hoisted
                console.log(x); // Outputs: undefined
                x = 5; // Initialization stays in place

            Note: Hoisting doesn t mean the variable is initialized to a value but to undefined by default.

        Function Hoisting:

                Function declarations are also hoisted to the top of their containing function or global scope.
                Function expressions, however, are not hoisted in the same way.
                
                foo(); // Outputs: "Hello, world!"
                function foo() {
                    console.log("Hello, world!");
                }

                                  The code above is treated like this during execution:

        
                function foo() {
                    console.log("Hello, world!");
                }
                foo(); // Outputs: "Hello, world!"

======================================================================================================================================================================
Node js with Mysql

    Create connection :

        var mysql = require('mysql');  
        var con = mysql.createConnection({
           
            host: "localhost",  
            user: "root",  
            password: "12345"  
        });

        con.connect(function(error){
            if(error) throw error;
            console.log("connected")
        });

    Create Database : 

        var mysql =require('mysql');
        var con = mysql.createConnection({
            host: "localhost",  
            user: "root",  
            password: "12345"
             
        });

        con.connect(function(err){
            if(err) throw err;
            console.log("connectd");

            con.query("create database javatpoint",function(err,result){
                if(err) throw err;
                console.log("Datebase Craeted");

            });
        });

    create Tabel :
        var mysql = require('mysql');  

        var con = mysql.createConnection({  
            host: "localhost",  
            user: "root",  
            password: "12345",  
            database: "javatpoint"  
        });  

        con.connect(function(err) {  
            if (err) throw err;  
             console.log("Connected!");  

            var sql = "CREATE TABLE employees (id INT, name VARCHAR(255), age INT(3), city VARCHAR(255))";  
            con.query(sql, function (err, result) {  
                if (err) throw err;  
                 console.log("Table created");  
            });  
        });  



    MySQL Insert Records

            :
                var mysql = require('mysql');  
                var con = mysql.createConnection({  
                    host: "localhost",  
                    user: "root",  
                    password: "12345",  
                    database: "javatpoint"  
                });  

                con.connect(function(err) {  
                    if (err) throw err;  
                    console.log("Connected!");  

                    var sql = "INSERT INTO employees (id, name, age, city) VALUES ('1', 'Ajeet Kumar', '27', 'Allahabad')";  

                    con.query(sql, function (err, result) {  
                        if (err) throw err;  
                        console.log("1 record inserted");  
                    });
                });  

        MySQL Update Records:

                var mysql = require('mysql');  
                var con = mysql.createConnection({  
                    host: "localhost",  
                    user: "root",  
                    password: "12345",  
                    database: "javatpoint"  
                });  

                con.connect(function(err) {  
                    if (err) throw err;  
                    var sql = "UPDATE employees SET city = 'Delhi' WHERE city = 'Allahabad'"; 

                    con.query(sql, function (err, result) {  
                        if (err) throw err;  
                        console.log(result.affectedRows + " record(s) updated");  
                    });  
                });  

        Mysql Delete Record :

                var mysql = require('mysql');  
                var con = mysql.createConnection({  
                    host: "localhost",  
                    user: "root",  
                    password: "12345",  
                    database: "javatpoint"  
                });  

                con.connect(function(err) {  
                    if (err) throw err;  
                    var sql = "DELETE FROM employees WHERE city = 'Delhi'";  

                    con.query(sql, function (err, result) {  
                        if (err) throw err;  
                        console.log("Number of records deleted: " + result.affectedRows);  
                    });  
                });  

        MySQL Select Records :

                var mysql = require('mysql');  
                var con = mysql.createConnection({  
                    host: "localhost",  
                    user: "root",  
                    password: "12345",  
                    database: "javatpoint"  
                });  

                con.connect(function(err) {  
                    if (err) throw err;  
                    con.query("SELECT * FROM employees", function (err, result) {  
                        if (err) throw err;  
                        console.log(result);  
                    });  
                });

        MySQL SELECT Unique Record :

                var mysql = require('mysql');  
                var con = mysql.createConnection({  
                    host: "localhost",  
                    user: "root",  
                    password: "12345",  
                    database: "javatpoint"  
                });  

                con.connect(function(err) {  
                    if (err) throw err;  
                    con.query("SELECT * FROM employees WHERE id = '1'", function (err, result) {   
                        if (err) throw err;  
                        console.log(result);  
                    });  
                });  

        MySQL Drop Table :

            var mysql = require('mysql');  
            var con = mysql.createConnection({  
                host: "localhost",  
                user: "root",  
                password: "12345",  
                database: "javatpoint"  
            });  

        con.connect(function(err) {  
            if (err) throw err;  
            con.query("DROP TABLE employee2", function (err, result) {  
                if (err) throw err;  
                console.log(result);  
            });  
        });  
======================================================================================================================================================================



======================================================================================================================================================================


                                                            JQuery

======================================================================================================================================================================


 jQuery event examples:https://www.youtube.com/watch?v=Yofox_h4zGQ

        Click Event:
                The click event is used when you want to trigger a function when an element is clicked.

                html
                Copy code
                <!DOCTYPE html>
                <html>
                <head>
                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                </head>
                <body>
                    <button id="myButton">Click Me</button>
                    <p id="message"></p>
                    
                    <script>
                        $(document).ready(function () {
                            $("#myButton").click(function () {
                                $("#message").text("Button Clicked!");
                            });
                        });
                    </script>
                </body>
                </html>

     Mouse Over and Mouse Out Events:
                These events are used to detect when the mouse pointer is over an element and when it leaves the element.
    
                <!DOCTYPE html>
                <html>
                <head>
                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                </head>
                <body>
                    <div id="myDiv">Hover over me</div>
                    <p id="message"></p>
                    
                    <script>
                        $(document).ready(function () {
                            $("#myDiv").mouseover(function () {
                                $("#message").text("Mouse over the div.");
                            });

                            $("#myDiv").mouseout(function () {
                                $("#message").text("Mouse out of the div.");
                            });
                        });
                    </script>
                </body>
                </html>

     Change Event:
                The change event is used to trigger a function when the value of an input element is changed.
    
                <!DOCTYPE html>
                <html>
                <head>
                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                </head>
                <body>
                    <input type="text" id="myInput" placeholder="Type something">
                    <p id="message"></p>
                    
                    <script>
                        $(document).ready(function () {
                            $("#myInput").change(function () {
                                $("#message").text("Input value changed to: " + $(this).val());
                            });
                        });
                    </script>
                </body>
                </html>

    Key Press Event:
                The keypress event is used to trigger a function when a key is pressed in an input field.

                
                <!DOCTYPE html>
                <html>
                <head>
                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                </head>
                <body>
                    <input type="text" id="myInput" placeholder="Type something">
                    <p id="message"></p>
                    
                    <script>
                        $(document).ready(function () {
                            $("#myInput").keypress(function (e) {
                                $("#message").text("Key pressed: " + String.fromCharCode(e.which));
                            });
                        });
                    </script>
                </body>
                </html>
=================================================================================================================
            <!DOCTYPE html>
            <html>
            <head>
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            </head>
            <body>
                <button id="myButton">Click to Hide</button>
                <div id="myBox" style="width: 200px; height: 100px; background-color: lightblue;"></div>

                <script>
                    $(document).ready(function () {
                        $("#myButton").click(function () {
                            
                            $("#myBox").hide(3000);
                            alert("Box is hidden!");
                             
                        });

                        //here it take 3 sec for run this line ,when it runnig it execute the next line then 
                            completting 3 sec then it will hide 

                            means befor hidding box it will show the alert meassege
                            so that we required callBack function
                    --   ------------------------------------------------  
                        $("#myButton").click(function () {
                            
                            $("#myBox").hide(1000, function () {
                                // This function is called after the hide animation is complete
                                alert("Box is hidden!");
                            });
                        });
                    });
                </script>
            </body>
            </html>
=================================================================================================================
    
    Chaining in jQuery:

                Chaining in jQuery allows you to perform multiple operations on the same set of elements in a single line of code.

                <!DOCTYPE html>
                <html>
                <head>
                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                </head>
                <body>
                    <button id="myButton">Click Me</button>
                    <p id="myParagraph">Hello, World!</p>

                    <script>
                        $(document).ready(function () {
                            $("#myButton")
                                .css("background-color", "blue")  // Change button background color
                                .css("color", "white")             // Change button text color
                                .click(function () {              // Attach a click event handler
                                    $("#myParagraph")
                                        .html("Button Clicked!")  // Change paragraph text
                                        .css("color", "red");      // Change paragraph text color
                                });
                        });
                    </script>
                </body>
                </html>



=================================================================================================================

    Example 1: Update HTML Content with jQuery

            In this example, we update the HTML content of a <div> element with new HTML content using jQuery.
 
                <!DOCTYPE html>
                <html>
                <head>
                    <title>Update HTML Content with jQuery</title>
                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                </head>
                <body>
                    <div id="demo">Original HTML Content</div>
                    <button id="updateHTMLButton">Update HTML Content</button>

                    <script>
                        $(document).ready(function() {
                            $("#updateHTMLButton").click(function() {
                                $("#demo").html("<strong>Updated HTML Content</strong>");
                            });
                        });
                    </script>
                </body>
                </html>

        Example 2: Update Text Content with jQuery
        
                In this example, we update the text content of a <p> element with new text using jQuery.

               
                <!DOCTYPE html>
                <html>
                <head>
                    <title>Update Text Content with jQuery</title>
                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                </head>
                <body>
                    <p id="demo">Original Text Content</p>
                    <button id="updateTextButton">Update Text Content</button>

                    <script>
                        $(document).ready(function() {
                            $("#updateTextButton").click(function() {
                                $("#demo").text("Updated Text Content");
                            });
                        });
                    </script>
                </body>
                </html>
=================================================================================================================

for  How using (val()---> return value of input  filed)

            <!DOCTYPE html>
            <html>
            <head>
                <title>Input Value Alert with jQuery</title>
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            </head>
            <body>
                <h2>Input Value Alert</h2>
                <form>
                    <label for="inputField">Enter a value: </label>
                    <input type="text" id="inputField">
                    <button id="alertButton">Alert Value</button>
                </form>

                <script>
                    $(document).ready(function() {
                        $("#alertButton").click(function() {
                            var inputValue = $("#inputField").val();
                            alert("You entered: " + inputValue);
                        });
                    });
                </script>
            </body>
            </html>
=================================================================================================================

    change attributes using jQuery:

        Suppose you have an HTML element like this:

             
            <img id="myImage" src="original.jpg" alt="Original Image">

        You can change the src attribute of the image using jQuery:

             
            $(document).ready(function() {
                // Change the src attribute of the image
                $("#myImage").attr("src", "new.jpg");
            });
            
        In this example, we use the attr() method to change the src attribute of the image with the ID myImage to a new image file, "new.jpg". The same approach can be used to change other attributes like alt, href, class, etc.

        Here s how you can change the alt attribute of the image:
 
            $(document).ready(function() {
                // Change the alt attribute of the image
                $("#myImage").attr("alt", "New Image");
            });



            -- -------------------
            $(document).ready(function() {
                // Change or add multiple attributes 
                $("#myLink").attr({
                    "href": "https://example.com",
                    "target": "_self",
                    "title": "Visit Example.com"
                });
            });
=================================================================================================================
----    prepend   append   before   after

    --before
    <ul class="ul">
        --prepend
        <li>one</li>
        <li>two</li>
        <li>three</li>
        --append
    </ul>
    --after



        1. prepend(): Inserts content inside the selected elements, as the first child.

                 
                <div id="myDiv">
                    <p>Existing content</p>
                </div>
                
                $(document).ready(function() {
                    $("#myDiv").prepend("<p>New content at the beginning</p>");
                });

            This will result in:
                 
                <div id="myDiv">
                    <p>New content at the beginning</p>
                    <p>Existing content</p>
                </div>

        2. append(): Inserts content inside the selected elements, as the last child.

                <div id="myDiv">
                    <p>Existing content</p>
                </div>
               
                $(document).ready(function() {
                    $("#myDiv").append("<p>New content at the end</p>");
                });

            This will result in:
 
                <div id="myDiv">
                    <p>Existing content</p>
                    <p>New content at the end</p>
                </div>

        3. before(): Inserts content before the selected elements.
              
                <div id="myDiv">
                    <p>Existing content</p>
                </div>
                 
                $(document).ready(function() {
                    $("#myDiv").before("<p>Content before the div</p>");
                });


           This will result in:

               <p>Content before the div</p>
                <div id="myDiv">
                    <p>Existing content</p>
                </div>

        4. after(): Inserts content after the selected elements.

                
                <div id="myDiv">
                    <p>Existing content</p>
                </div>
                

                $(document).ready(function() {
                    $("#myDiv").after("<p>Content after the div</p>");
                });

             This will result in:
 
                <div id="myDiv">
                    <p>Existing content</p>
                </div>
                <p>Content after the div</p>



        5.  empty():
                The empty() method in jQuery is used to remove all child nodes and content from the selected element(s) while      preserving the element itself. It effectively clears the content of the selected element(s).

            Example:

               
                $("#myDiv").empty();
                Suppose you have the following HTML structure:

                
                <div id="myDiv">
                    <p>Some text content</p>
                    <ul>
                        <li>Item 1</li>
                        <li>Item 2</li>
                        <li>Item 3</li>
                    </ul>
                </div>


            After executing $("#myDiv").empty();, the HTML structure will be:
 
                <div id="myDiv"></div>

        6. remove(): 
                he remove() method in jQuery is used to remove the selected element(s) from the DOM entirely, along with all of its descendants. It effectively deletes the element from the HTML structure.

            Example:

                $("#myDiv").remove();

                executing $("#myDiv").remove(); will completely remove the myDiv element and its contents from the DOM.
=================================================================================================================

-- addClass and removeClass

    1. addClass():
             The addClass() method is used to add one or more CSS classes to the selected element(s). It allows you to dynamically apply one or more CSS classes to elements on your web page. You can use it to change the styling or appearance of elements.

        Example:

                $("#myElement").addClass("highlighted");

            Suppose you have an HTML element like this:
 
                 <div id="myElement">Some text content</div>

            After executing $("#myElement").addClass("highlighted");, the element will have the "highlighted" class applied to it:

           
                    <div id="myElement" class="highlighted">Some text content</div>

     2. removeClass():
             The removeClass() method is used to remove one or more CSS classes from the selected element(s). It allows you to dynamically remove one or more CSS classes from elements, which can be helpful for changing the styling or appearance of elements.

            Example:
                
                <div id="myElement" class="highlighted">Some text content</div>

                
                $("#myElement").removeClass("highlighted");

                If the same HTML element has the "highlighted" class applied, executing $("#myElement").removeClass("highlighted"); will remove the class:
                
                <div id="myElement">Some text content</div>

        3.tooggleClass
                addclass and removeclass

                
==================================================================================================================================

 -- width hieght innerwidth innerhieght outerwidth and outerHiegth



            1. Width and Height:

                .width(): Get the current computed width of the first element in the set.
                .height(): Get the current computed height of the first element in the set.

                var elementWidth = $("#myElement").width();
                var elementHeight = $("#myElement").height();
                console.log(element...)


            2. Inner Width and Inner Height:

                .innerWidth(): Get the current computed width of the first element, including padding.
                .innerHeight(): Get the current computed height of the first element, including padding.
            Example:

                
                var innerWidth = $("#myElement").innerWidth();
                var innerHeight = $("#myElement").innerHeight();

                console.log(inner...)

            3. Outer Width and Outer Height:

                .outerWidth(): Get the current computed width of the first element, including padding and border.
                .outerHeight(): Get the current computed height of the first element, including padding and border.
                .outerWidth(true): Get the current computed width of the first element, including padding, border, and margin.
                .outerHeight(true): Get the current computed height of the first element, including padding, border, and margin.

            Example:

               
                var outerWidth = $("#myElement").outerWidth();
                var outerHeight = $("#myElement").outerHeight();
                var outerWidthWithMargin = $("#myElement").outerWidth(true);
                var outerHeightWithMargin = $("#myElement").outerHeight(true);

                console.log(outer...)
==================================================================================================================================
--prentsUntill("ul")---select some specified element
--prents---sselect all  prents
-----perent  

         parent() method is used to select the immediate parent element of the selected element.
                 It s helpful when you want to access or manipulate the parent element of a particular element. Here s an example:

                Suppose you have the following HTML structure:

                    <div id="parent">
                        <p>This is the parent element</p>
                        <div id="child">
                            <p>This is the child element</p>
                        </div>
                    </div>

                You can use jQuery to select the parent element of the element with the ID "child" and perform actions on it. Here s how you can do it:
 
                // Select the parent element of #child
                // Perform some action, e.g., change the parent s background color
                    
                    var parentElement = $("#child").parent();
                    parentElement.css("background-color", "lightblue");


children--only one children--not grandchildren
    children() method is used to select all the child elements of the selected element. It allows you to access and manipulate the immediate child elements within a parent element. Here s an example:

                Suppose you have the following HTML structure:
 
                <div id="parent">
                    <p>Child 1</p>
                    <p>Child 2</p>
                    <p>Child 3</p>
                </div>

                You can use jQuery to select all the child elements of the element with the ID "parent" and perform actions on them.
                 Here s how you can do it:
 
                // Select all child elements of #parent
                // Perform some action, e.g., change the text of each child element


                var childElements = $("#parent").children();

                
                childElements.text("Updated Text");

==================================================================================================================================
            find() method 
                is used to select all the descendant elements that match a selector within the set of selected elements.
                It's a powerful way to search for elements within a specific context. Here's an example:

                Suppose you have the following HTML structure:

               
                    <div id="container">
                        <div class="box">
                            <p>Paragraph 1</p>
                        </div>
                        <div class="box">
                            <p>Paragraph 2</p>
                        </div>
                    </div>


                You can use jQuery to select and manipulate the <p> elements within the #container element using the find() method:
 
                // Select all <p> elements within #container using the find method
                // Perform some action, e.g., change the text of each <p> element

                    var paragraphElements = $("#container").find("p");
                    paragraphElements.text("Updated Text");
==================================================================================================================================

-- ____ noConflict() Method

    if there are one more fremwork  are used '$' sign, at that time  JQuery conflict


    

       //
       
       var jq = $.noConflict();
        jq(document).ready(function() {
            jq("#myElement").text("this is string");
        });
    
        var jQueryAlias = jQuery.noConflict();

        jQueryAlias(document).ready(function() {
            jQueryAlias("#myElement").text("this is string");
        });

==================================================================================================================================
==================================================================================================================================


                                                            node js


===================================================================================================================================

 setTimeout :
    
     const fun = (p1) =>{
            console.log("this is function "+p1);
     }
    setTimeout(fun,4000,1);
    setTimeout(fun,4000,1,2); // function,time expire,parameter 1, parameter 2



    it will print after 4 seconds


setInterval :
    
     const fun = (p1) =>{
            console.log("this is function "+p1);
     }
    setTimeout(fun,4000,1);
    setTimeout(fun,4000,1,2); // function,time expire,parameter 1, parameter 2


    here it will print in a loop form after "seconds"


        ----------------------------------------------------
        ------------------------------------------------------

    Que : print hello world,every second ,stop after 5 seconds,adn after 5 times ,print "Done"  and let node exit


 
              let count = 0;
  
                const interval = setInterval(()=>{
                    console.log("Hello World")
                    count++;

                    if(count>4){
                        clearInterval(interval);
                        console.log("Done")
                    }

                },1000);


                ------- another way----

                  let count = 0;
  
                    const  myfunc =()=>{
                        console.log("Hello World")
                        count+=1;
                        
                        if(count === 5){
                            clearTimeout(timeid);
                            console.log("Done")
                        }
                    }
  
                    const timeid = setInterval(myfunc,1000);
                    

        Output :

            Hello World
            Hello World
            Hello World
            Hello World
            Hello World
            Done




    -----------------------------------------------------
            Async ,await and promise

    var p = new Promise((resolve,reject) =>{
        setTimeout(()=>{
            resolve("one");
        },3000);
    });
 
    async function call(){
        let aw = await p;
        console.log(aw);
    }
    call();

    -----------------------------------------
    // 
    Function that returns a Promise to simulate fetching data

        function fetchData() {
            return new Promise((resolve, reject) => {
                setTimeout(() => {
                    const data = "Data from the server";
                    resolve(data);
                }, 2000); // Simulating a 2-second delay
           });
        }

            // Asynchronous function using async/await
        async function getData() {
            try {
                console.log("Fetching data...");
                const result = await fetchData(); // Wait for the Promise to resolve
                console.log("Data received:", result);
            } catch (error) {
                console.error("Error:", error);
           }
        }

            
            getData();


--------------------------------------------------------------------------------------------------------------------------------------------------------------------


         Compressing a File:

             To compress a file, you can use the zlib module to create a compressed stream and pipe the input file stream to it. Here s an example:
                
                const fs = require('fs');
                const zlib = require('zlib');

                const inputFilePath = 'input.txt';
                const outputFilePath = 'compressed.gz';

                const input = fs.createReadStream(inputFilePath);
                const output = fs.createWriteStream(outputFilePath);

                const gzip = zlib.createGzip();

                input.pipe(gzip).pipe(output);

                console.log('File compressed successfully.');
                In this example, it reads the content of input.txt, compresses it using Gzip, and writes the compressed content to compressed.gz.

        Decompressing a File:

                     To decompress a file, you can use a similar approach by creating a decompression stream:

                
                        const fs = require('fs');
                        const zlib = require('zlib');

                        const inputFilePath = 'compressed.gz';
                        const outputFilePath = 'decompressed.txt';

                        const input = fs.createReadStream(inputFilePath);
                        const output = fs.createWriteStream(outputFilePath);

                        const gunzip = zlib.createGunzip();

                        input.pipe(gunzip).pipe(output);

                        console.log('File decompressed successfully.');


--------------------------------------------------------------------------------------

Assertion  

        var assertion = require("assert");
        
        function add(a,b){
            return a+b;
        }
        
        var expected = add(3,1);
        
        assertion(expected === 6,"there is some error")
        assertion(expected === 4,"there is some error")// output : not give any error
    
    output:
            assert.js:386
            throw err;
            ^

            AssertionError [ERR_ASSERTION]: there is some error
                at Object.<anonymous> (/home/cg/root/652bc4844aaf6/main.js:10:2)
                at Module._compile (internal/modules/cjs/loader.js:999:30)
                at Object.Module._extensions..js (internal/modules/cjs/loader.js:1027:10)
                at Module.load (internal/modules/cjs/loader.js:863:32)
                at Function.Module._load (internal/modules/cjs/loader.js:708:14)
                at Function.executeUserEntryPoint [as runMain] (internal/modules/run_main.js:60:12)
                at internal/main/run_main_module.js:17:47 {
            generatedMessage: false,
            code: 'ERR_ASSERTION',
            actual: false,
            expected: true,
            operator: '=='
            }

--------------------------------------------------------------------------------------------------------------------------------------------------------------

    callBack

            1. Callbacks:
                Callback is an asynchronous equivalent for a function. It is called at the completion of each task.
                Callbacks are functions passed as arguments to other functions. They are used to handle asynchronous operations, ensuring that code executes in the correct order. Callbacks are vital in Node.js for non-blocking I/O operations.

            2. Blocking vs. Non-Blocking:

                Blocking: 
                    In traditional, synchronous programming, operations that take time to complete can block the entire process. During this time, other code doesn t execute, causing delays and inefficiencies.

                Non-Blocking: 
                    In Node.js, the goal is to avoid blocking operations. Non-blocking operations allow the program to continue executing while waiting for a potentially slow operation to complete. This keeps the system responsive and efficient.
                Examples:

            Blocking I/O (Synchronous):

            
                const fs = require('fs');

                const data = fs.readFileSync('file.txt'); // Blocking operation
                console.log('Read file: ', data);
                console.log('Program continues...');

                In the example above, the program will block until the file is read. This isn t ideal for handling many concurrent operations.

            Non-Blocking I/O (Asynchronous with Callbacks):
            
                const fs = require('fs');

                fs.readFile('file.txt', (err, data) => {
                    if (err) {
                        console.error(err);
                    } else {
                        console.log('Read file: ', data);
                    }
                });

                console.log('Program continues...');


Difference between Events and Callbacks:

                Events and Callbacks look similar but the differences lies in the fact that 
                
                callback functions are called when an asynchronous function returns its result where as event handling works on the observer pattern. 
                Whenever an event gets fired, its listener function starts executing. 


Events :

        const emitter = require('events');

        const myEmitter = new emitter.EventEmitter();
        //const { myEmitter }= new EventEmitter();

        const eventhandler = () =>{
            console.log("event is fired");
        }

        myEmitter.on("fired",eventhandler);
        myEmitter.emit("CustomEvent");


--first module required
--create instancenof EventEmitter class
--define EventHandler function
--register the event Handler custom event named 'customEvent'--on("eventnmae",handler)
--Emit the 'customEvent' event.---.emit("eventname")