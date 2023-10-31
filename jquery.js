======================================================================================================================================================================


                                                            JQuery == January 2006 by John Resig 

======================================================================================================================================================================

All jQuery selectors start with a dollor sign and parenthesis e.g. $(). 
It is known as the factory function.



What is jQuery

    jQuery is a small and lightweight JavaScript library.
    jQuery is cross-platform.
    jQuery means "write less do more".
    jQuery simplifies AJAX call and DOM manipulation.


    jQuery Features :

        Following are the important features of jQuery.

        HTML manipulation
        DOM manipulation
        DOM element selection
        CSS manipulation
        Effects and Animations
        Utilities
        AJAX
        HTML event methods
        JSON Parsing
        Extensibility through plug-ins



    Jquery Effects :

                 

    Display :

            Hide():
            Show():
            toggle():


    Fadding :
            fadeIn():
            fadeOut():
            faseToggle():
            fadeTo():


    Sliding :

        SlidDown():
        SlidUp():
        slideToggle():


    other Effect :
        animate():
        delay():




 jQuery event examples:https://www.youtube.com/watch?v=Yofox_h4zGQ

        Click Event:
        
                The click event is used when you want to trigger a function when an element is clicked.

               
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
