<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reginew.aspx.cs" Inherits="agriproject.reginew" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <style>
td{
  
  padding-top: 10px;
  padding-right: 10px;
  padding-bottom: 10px;
  padding-left: 10px;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server">
                      </asp:ScriptManager>    
    <div>
       <center>
       <table  cellspacing="10" cellpadding="10">
            <tr>
                <td colspan="3">
                  <h1>
                      
                      Registration Form</h1>  
                </td>
               
            </tr>
         
             <tr>
                <td>
                    
                    
                    <asp:Label ID="Label1" runat="server" Text="Enter Your Username:-"></asp:Label>
                </td>
                <td>

                    <asp:TextBox ID="txtname"  runat="server" Width="150"></asp:TextBox>

                </td>
                <td>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtname" ErrorMessage="Please Enter Username!" ForeColor="Red"></asp:RequiredFieldValidator>

                </td>
            </tr>
             <tr>
                <td>
                    
                    
                    <asp:Label ID="Label7" runat="server" Text="Enter your Age:-"></asp:Label>
                </td>
                <td>

                    <asp:TextBox ID="txtage" runat="server" Width="150" TextMode="Number"></asp:TextBox>

                </td>
                <td>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtage" ErrorMessage="Enter age Must!" ForeColor="Red"></asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td>
                    
                    
                    <asp:Label ID="Label8" runat="server" Text="Gender:-"></asp:Label>
                </td>
                <td>

                    <asp:DropDownList ID="ddlgender" runat="server" Width="150">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>

                </td>
                <td>

                    &nbsp;</td>
            </tr>
        
          
             <tr>
                <td>
                    
                    <asp:Label ID="Label4" runat="server" Text="Enter E-mail ID :-"></asp:Label>
                    
                </td>
                <td>

                    <asp:TextBox ID="txtmailid" runat="server" Width="150" TextMode="Email"></asp:TextBox>

                </td>
                <td>

                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtmailid" ErrorMessage="Enter Proper Email ID!" ForeColor="Red" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>

                </td>
            </tr>
           
           
             <tr>
                <td>
                    
                    <asp:Label ID="Label6" runat="server" Text="Select Security Question"></asp:Label>
                    
                </td>
                <td>

                    <asp:DropDownList ID="ddlsque" runat="server" Width="150">
                        <asp:ListItem Selected="True">Enter Your Nick Name?</asp:ListItem>
                        <asp:ListItem>Enter Your first Mobile Number? </asp:ListItem>
                        <asp:ListItem>Enter Your grandfather Name?</asp:ListItem>
                        <asp:ListItem>Enter Your Favrt Car Name?</asp:ListItem>
                        <asp:ListItem>Enter Your Frvrt Sport Name?</asp:ListItem>
                        <asp:ListItem>Enter Your school Name?</asp:ListItem>
                    </asp:DropDownList>

                </td>
                <td>

                </td>
            </tr>
             <tr>
                <td>
                    
                    <asp:Label ID="Label5" runat="server" Text="Security Answer:-"></asp:Label>
                    
                </td>
                <td>

                    <asp:TextBox ID="txtsans" runat="server"></asp:TextBox>

                </td>
                <td>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtsans" ErrorMessage="Please enter security questions answer!" ForeColor="Red"></asp:RequiredFieldValidator>

                </td>
            </tr>
             <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Text="Enter The Post:-"></asp:Label>
            </td>
            <td>
               <asp:DropDownList ID="ddlpost" runat="server" Width="150px" AutoPostBack="True" OnSelectedIndexChanged="ddlpost_SelectedIndexChanged" >
                   <asp:ListItem>User</asp:ListItem>
                   <asp:ListItem>Shop Owner</asp:ListItem>
                  <asp:ListItem>Professional Adviser</asp:ListItem>
                </asp:DropDownList>
            </td>
       
                <td></td>
               </tr>   
                    
           
       
           <tr>
               <td>
<asp:Label ID="Label10" runat="server" Text="Enter area Area" Visible="False"></asp:Label>
               </td>

                <td>
<asp:DropDownList ID="ddlarea" runat="server" Visible="False" AutoPostBack="True">
    <asp:ListItem>Higna</asp:ListItem>
    <asp:ListItem>Nandanwan</asp:ListItem>
    <asp:ListItem>Manewada</asp:ListItem>
    <asp:ListItem>Itwari</asp:ListItem>
    <asp:ListItem>Bardi</asp:ListItem>
    <asp:ListItem>Bus Stand</asp:ListItem>
                    </asp:DropDownList>
             
               </td>

                <td>

               </td>
           </tr>  
              <tr>
                <td>
                    
                    <asp:Label ID="Label2" runat="server" Text="Enter The Password :-"></asp:Label>
                    
                </td>
                <td>

                    <asp:TextBox ID="txtpasssword" runat="server" TextMode="Password" Width="150"></asp:TextBox>

                </td>
                <td>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtpasssword" ErrorMessage="Enter Password Must!!" ForeColor="Red"></asp:RequiredFieldValidator>

                </td>
            </tr>
             <tr>
                <td>
                    
                    <asp:Label ID="Label3" runat="server" Text="Enter Confrom Password :-"></asp:Label>
                    
                </td>
                <td>

                    <asp:TextBox ID="txtcnfrmpassword" runat="server" TextMode="Password" Width="150"></asp:TextBox>

                </td>
                <td>

                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtpasssword" ControlToValidate="txtcnfrmpassword" ErrorMessage="Password missmatch" ForeColor="Red"></asp:CompareValidator>

                </td>
            </tr>


           <tr>

               <td>
<asp:Button ID="Button1" runat="server" Text="Registration" class="btn btn-success" OnClick="Button1_Click1"></asp:Button>
               </td>
                <td>

                    <a href="loginnew.aspx">Login Page</a></td>
                <td>
<asp:Button ID="Button2" runat="server" Text="Clear" CausesValidation="False" class="btn btn-warning" OnClick="Button2_Click1" Height="27px" Width="72px"></asp:Button>
               </td>
           </tr>
           <tr>
               <td colspan="3"><asp:Label ID="lblerror" runat="server" ForeColor="Red"></asp:Label></td>
           </tr>
                                 
                 
                    </table>
    </center>
        </div>
           </form>
                </body>
