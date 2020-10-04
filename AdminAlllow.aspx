<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminAlllow.aspx.cs" Inherits="agriproject.AdminAlllow" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel ="shortcut icon" href ="Background\crmlogo.jpeg" />
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <style>

    <title></title>
     
   
    <style type="text/css">
        .auto-style1 {
            width: 535px;
        }
    </style>
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

    <table style="height: 435px; width: 505px" >
        <tr>
        <td colspan ="2" class="auto-style1">
                             
      <h1>Admin Allow/Deny Page</h1> 
         
                        </td>
                    </tr>
               <tr>
                   <td colspan ="2" class="auto-style1">
                       <asp:Button ID="btnback" runat="server" Text="Back" CssClass ="btn btn-primary btn-lg"  Height="39px" Width="110px" OnClick="btnback_Click"  ></asp:Button>
                   </td>
              </tr>
               <tr>
                   <td colspan ="2" class="auto-style1">
                       <asp:Label ID="Label1" ForeColor ="#ff0066" Font-Size="X-Large" runat="server" Text="When approved value is 0 then User is Disable User and approved value is 1 Then Enable User." style="color: #669900"></asp:Label>
                       
                       </td>
               </tr>
        <tr>
 <td colspan ="2" class="auto-style1">
                      <h1>New User Enable/Disable Page</h1>
                   </td>
        </tr>
           <tr>         
           <td colspan ="2" class="auto-style1">      
  
                  
        <div>      
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="6" OnRowCancelingEdit="GridView1_RowCancelingEdit"   
  
OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">  
            <Columns>  
                <asp:TemplateField>  
                    <ItemTemplate>  
                        <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" />  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update"/>  
                        <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel"/>  
                    </EditItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Unique ID">  
                    <ItemTemplate>  
                        <asp:Label ID="Id" runat="server" Text='<%#Eval("Id") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Username">  
                    <ItemTemplate>  
                        <asp:Label ID="txtname" runat="server" Text='<%#Eval("txtname") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txtname" runat="server" Text='<%#Eval("txtname") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Password">  
                    <ItemTemplate>  
                        <asp:Label ID="txtpasssword" runat="server" Text='<%#Eval("txtpasssword") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txtpasssword" runat="server" Text='<%#Eval("txtpasssword") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  
                   <asp:TemplateField HeaderText="Approved Status">  
                    <ItemTemplate>  
                        <asp:Label ID="approved" runat="server" Text='<%#Eval("approved") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="approved" runat="server" Text='<%#Eval("approved") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  
                  <asp:TemplateField HeaderText="Post">  
                    <ItemTemplate>  
                        <asp:Label ID="ddlpost" runat="server" Text='<%#Eval("ddlpost") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="ddlpost" runat="server" Text='<%#Eval("ddlpost") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  
                  <asp:TemplateField HeaderText="Email ID">  
                    <ItemTemplate>  
                        <asp:Label ID="txtmailid" runat="server" Text='<%#Eval("txtmailid") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txtmailid" runat="server" Text='<%#Eval("txtmailid") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  

            </Columns>  
            <HeaderStyle BackColor="#663300" ForeColor="#ffffff"/>  
            <RowStyle BackColor="#e7ceb6"/>  
        </asp:GridView>  
      
    </div>  
      </td>  </tr >
           
    

   
 
</table>
    </div>
        
        </center>
    </form>
</body>
</html>
