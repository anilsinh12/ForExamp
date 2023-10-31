1.   Label and Button controls

    <%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Welcome to ASP.NET</title>
    </head>
    <body>
        <form id="form1" runat="server">
            <h1>Welcome to ASP.NET</h1>

            <asp:Button ID="btnShowMessage" runat="server" Text="Click" OnClick="btnShowMessage_Click" />
            
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        </form>
    </body>
    </html>

    _Default.aspx.cs

    using System;

    public partial class Default : System.Web.UI.Page
    {
        protected void btnShowMessage_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "Welcome to the world of ASP.NET";
        }
    }


============================================================================
 
 2 . marks 

 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Grade Calculator</title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Student Grade Calculator</h1>

        <div>
            <asp:Label ID="lblEnrollmentNo" runat="server" Text="Enrollment No:"></asp:Label>
            <asp:TextBox ID="txtEnrollmentNo" runat="server"></asp:TextBox>
        </div>

        <div>
            <asp:Label ID="lblStudentName" runat="server" Text="Student Name:"></asp:Label>
            <asp:TextBox ID="txtStudentName" runat="server"></asp:TextBox>
        </div>

        <div>
            <asp:Label ID="lblMarks" runat="server" Text="Enter Marks for 5 Subjects (comma-separated):"></asp:Label>
            <asp:TextBox ID="txtMarks" runat="server"></asp:TextBox>
        </div>

        <asp:Button ID="btnCalculate" runat="server" Text="Calculate" OnClick="btnCalculate_Click" />
        
        <div>
            <asp:Label ID="lblTotal" runat="server" Text="Total Marks:"></asp:Label>
            <asp:Label ID="lblPercentage" runat="server" Text="Percentage:"></asp:Label>
            <asp:Label ID="lblGrade" runat="server" Text="Grade:"></asp:Label>
        </div>
    </form>
</body>
</html>

Default.aspx.cs

using System;

public partial class Default : System.Web.UI.Page
{
    protected void btnCalculate_Click(object sender, EventArgs e)
    {
        string[] marks = txtMarks.Text.Split(',');
        int totalMarks = 0;

        foreach (string mark in marks)
        {
            int subjectMarks;
            if (int.TryParse(mark, out subjectMarks))
            {
                totalMarks += subjectMarks;
            }
        }

        lblTotal.Text = "Total Marks: " + totalMarks.ToString();
        
        if (totalMarks > 0)
        {
            double percentage = (totalMarks / 500.0) * 100;
            lblPercentage.Text = "Percentage: " + percentage.ToString("0.00") + "%";
        }

        string grade = CalculateGrade(totalMarks);
        lblGrade.Text = "Grade: " + grade;
    }

    private string CalculateGrade(int totalMarks)
    {
        if (totalMarks >= 450)
        {
            return "A+";
        }
        else if (totalMarks >= 400)
        {
            return "A";
        }
        else if (totalMarks >= 350)
        {
            return "B";
        }
        else if (totalMarks >= 300)
        {
            return "C";
        }
        else if (totalMarks >= 250)
        {
            return "D";
        }
        else
        {
            return "F";
        }
    }
}


 
 =================================================

 4. Use of Radio button
 -Default.cs
 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gender Selection</title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Gender Selection</h1>
        
        <asp:RadioButton ID="maleRadio" runat="server" Text="Male" AutoPostBack="True" OnCheckedChanged="GenderSelection_CheckedChanged" GroupName="gender" />
        <br />
        <asp:RadioButton ID="femaleRadio" runat="server" Text="Female" AutoPostBack="True" OnCheckedChanged="GenderSelection_CheckedChanged" GroupName="gender" />
        
        <p>Selected gender: <asp:Label ID="genderLabel" runat="server" Text="Select a gender"></asp:Label></p>
    </form>
</body>
</html>


--Default.aspx.cs
using System;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void GenderSelection_CheckedChanged(object sender, EventArgs e)
    {
        RadioButton selectedRadio = sender as RadioButton;

        if (selectedRadio != null)
        {
            genderLabel.Text = selectedRadio.Text;
        }
    }
}
======================================
5 . List box and Image controls

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Image Viewer</title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Image Viewer</h1>
        
        <asp:ListBox ID="imageListBox" runat="server" AutoPostBack="True" OnSelectedIndexChanged="imageListBox_SelectedIndexChanged">
            <asp:ListItem Text="Select an image" Value="" />
            <asp:ListItem Text="Image 1" Value="image1.jpg" />
            <asp:ListItem Text="Image 2" Value="image2.jpg" />
            <asp:ListItem Text="Image 3" Value="image3.jpg" />
        </asp:ListBox>
        
        <asp:Image ID="displayImage" runat="server" CssClass="image" />
    </form>
</body>
</html>

--Default.aspx.cs
using System;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Initialize the ListBox selection.
            imageListBox.SelectedIndex = 0;
            DisplaySelectedImage();
        }
    }

    protected void imageListBox_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Display the selected image when a ListBox item is selected.
        DisplaySelectedImage();
    }

    private void DisplaySelectedImage()
    {
        string selectedImage = imageListBox.SelectedValue;
        displayImage.ImageUrl = string.IsNullOrEmpty(selectedImage) ? "" : $"Images/{selectedImage}";
    }
}

===========================================
 6.  Write a program that has a form taking the user's name as input. Store this name in a permanent 
cookie & whenever the page is opened again, then value of the name field should be attached with 
the cookie's content.


        <%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

        <!DOCTYPE html>

        <html xmlns="http://www.w3.org/1999/xhtml">
        <head runat="server">
            <title>Cookie Example</title>
        </head>
        <body>
            <form id="form1" runat="server">
                <div>
                    <asp:Label ID="lblMessage" runat="server" Text="Enter your name:" AssociatedControlID="txtName"></asp:Label>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                </div>
            </form>
        </body>
        </html>


        using System;
        using System.Web;

        public partial class Default : System.Web.UI.Page
        {
            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    if (Request.Cookies["UserName"] != null)
                    {
                        txtName.Text = Request.Cookies["UserName"].Value;
                    }
                }
            }

            protected void btnSave_Click(object sender, EventArgs e)
            {
                HttpCookie cookie = new HttpCookie("UserName");
                cookie.Value = txtName.Text;
                cookie.Expires = DateTime.Now.AddYears(1); // Set the cookie to expire in a year
                Response.Cookies.Add(cookie);
            }
        }
