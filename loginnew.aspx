<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginnew.aspx.cs" Inherits="agriproject.loginnew" %>

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
    <div>
        <center>
      <table cellspacing="10" cellpadding="10" ">
        <tr>
            <td colspan="2">
<h1>***<em>Login Page</em>***</h1>
                <a href="AdminAlllow.aspx">Admin</a> </td>
            
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Enter The Username :-"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtusername" runat="server" class="form-control" Width="150px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtusername" ErrorMessage="Please Enter Username !" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>

        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Enter The Password:-"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtpass" runat="server" TextMode="Password" class="form-control" Width="150px"></asp:TextBox>
            </td>
            <td>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpass" ErrorMessage="Please Enter Password !" ForeColor="Red"></asp:RequiredFieldValidator>

            </td>
        </tr>
         <tr>
            <td>
                <asp:Label ID="Label3" runat="server"  Text="Enter The Post:-"></asp:Label>
            </td>
            <td>
               <asp:DropDownList ID="ddlpost" class="form-control" runat="server" Width="150px">
                   <asp:ListItem>User</asp:ListItem>
                   <asp:ListItem>Shop Owner</asp:ListItem>
                   <asp:ListItem>Professional Adviser</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>

                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" CssClass ="btn btn-success btn-lg" Text="Login" Width="103px" Height="45px" />
            </td>
            <td>
                <a href="reginew.aspx"> Go to Registration</a></td>
            <td> <asp:Button ID="btnclear" runat="server" Text="Clear" class="btn btn-warning" OnClick="btnclear_Click"></asp:Button></td>
        </tr>
    </table>
<asp:Label ID="lblerror" runat="server" Text=""></asp:Label>
   </center>
             </div>
    </form>
</body>
</html>
