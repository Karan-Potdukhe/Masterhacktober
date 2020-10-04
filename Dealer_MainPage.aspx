<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dealer_MainPage.aspx.cs" Inherits="agriproject.Dealer_Reg" %>

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
<body><center>
    <form id="form1" runat="server">
    <div>
                           <asp:Button ID="btnback" runat="server" Text="Back" CssClass ="btn btn-primary btn-lg"  Height="39px" Width="110px" OnClick="btnback_Click" CausesValidation="False"  ></asp:Button>
                       
    <h1>Dealer Main Pages</h1>

        <table>

<tr>
    <td colspan="2"><h3>Product Entry System </h3></td>
</tr>
            <tr>

                <td>
                    <asp:Label ID="Label1" runat="server" Text="Enter Product Name:-"></asp:Label>
                </td>
               
                <td>
 <asp:TextBox ID="txtproductname" runat="server"></asp:TextBox>
                </td>
               </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Enter Product Quantity:-"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtproductqty" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
<asp:Button ID="btnaddproduct" runat="server" Text="Add Product" OnClick="btnaddproduct_Click"></asp:Button>
                </td>

                
            </tr>
            <tr>
                <td colspan="2">
                      <asp:GridView ID="GrvShowDetails" runat="server" AutoGenerateColumns="False" Height="148px" Width="607px" DataKeyNames="Idproduct" >
                                            <Columns>
                                              <asp:TemplateField HeaderText="Idproduct" Visible="False">  
                                <EditItemTemplate>  
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Idproduct") %>'></asp:TextBox>  
                                </EditItemTemplate>  
                                <ItemTemplate>  
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Idproduct") %>'></asp:Label>  
                                </ItemTemplate>  
                            </asp:TemplateField>    
                                               
                                              
                                               <asp:BoundField DataField="productname" HeaderText="Product Name" />
                                              
                                               <asp:BoundField DataField="productqty" HeaderText="Product Quantity" />
                                             
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
                </td>
            </tr>
       <tr>
           <td  colspan="2"> <asp:Label ID="lblerror" runat="server" ForeColor="Red"> </asp:Label>   </td>
       </tr>

             <tr>
           <td  colspan="2">  <asp:Button ID="Button1" runat="server" Text="Delete Item" OnClick="Button1_Click" />        </td>
       </tr>

  
  
         </table>
        </div>   
    </form>
    </center>
   
</body>
</html>
