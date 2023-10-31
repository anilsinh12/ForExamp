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