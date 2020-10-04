<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="videoadd.aspx.cs" Inherits="agriproject.videoadd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <style>

 <style>
td{
  
  padding-top: 10px;
  padding-right: 10px;
  padding-bottom: 10px;
  padding-left: 10px;
}
</style>     

</head>
<body><center>
    <form id="form1" runat="server">
        <asp:Button ID="btnback" runat="server" Text="Back" CssClass ="btn btn-primary btn-lg"  Height="39px" Width="110px" OnClick="btnback_Click" CausesValidation="False"  ></asp:Button>
            <h2 class="text-center text-uppercase">How to upload video in database and play using asp.net</h2>  
           
                    <asp:Label ID="Label2" runat="server" Text="Choose Video using browse button:-"></asp:Label> 
                   
                         
                                <asp:FileUpload ID="FileUpload1" CssClass="custom-file-input" runat="server" />  
                           
                          <asp:Label ID="Label1" runat="server" Text="Enter Name without space:-"></asp:Label> <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtname" ErrorMessage="Please Enter Name without space!!!" ForeColor="Red"></asp:RequiredFieldValidator>
                  <asp:Button ID="btnUpload" CssClass="btn btn-outline-secondary" runat="server" Text="Upload" OnClick="btnUpload_Click" />          
                
         
            <asp:Label ID="lblMessage" runat="server"></asp:Label>  
       
<%--<div style="width: 100%; height: 400px; overflow: scroll">--%>
            <asp:GridView ID="GridView1" ShowHeaderWhenEmpty="True"  runat="server" AutoGenerateColumns="false" Width="90%" Height="450px">  
                <EmptyDataTemplate>  
                    <div class="text-center">No Data Found <strong>Upload New Video</strong></div>  
                </EmptyDataTemplate>  
                <Columns>  
                     <asp:TemplateField HeaderText="Idproduct" Visible="False">  
                                <EditItemTemplate>  
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("videoId") %>'></asp:TextBox>  
                                </EditItemTemplate>  
                                <ItemTemplate>  
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("videoId") %>'></asp:Label>  
                                </ItemTemplate>  
                            </asp:TemplateField>   
                    <asp:BoundField HeaderText="videoId" DataField="videoId"/>  
                    <asp:BoundField HeaderText="Name" DataField="Name" />  
                    <asp:TemplateField HeaderText="Videos">  
                        <ItemTemplate>  
                            <video width="250" height="130" controls class="border">  
                                <source src='<%#Eval("videopath")%>' type="video/mp4">  

                            </video>  
           
                        </ItemTemplate>  
                    </asp:TemplateField>  
                     <asp:TemplateField HeaderText="Select Item for Delete">
                                                    <EditItemTemplate>
                                                        <asp:CheckBox ID="CheckBox1" runat="server" />
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="CheckBox1" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                </Columns>  
            </asp:GridView>  
        <%-- </div>--%>
               
          <div>
   
    </div> 
        
  <asp:Button ID="btndelet" runat="server" Text="Delete Item" OnClick="btndelet_Click" CausesValidation="False" />   
        
        
    </form></center>
</body>
</html>
