<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Main_Page.aspx.cs" Inherits="agriproject.Main_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>

    <link href="Styles/nivo-slider.css" rel="stylesheet" type="text/css" />

    <link href="Styles/Default.css" rel="stylesheet" type="text/css" />

    <link href="Styles/nivo-slider.css" rel="stylesheet" type="text/css" />

    <script src="Scripts/Demo.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
     <script type="text/javascript">
        $(function () {
            $('[id*=video]').mouseenter(function () {
                $(this).get(0).play();
            });
            $('[id*=video]').mouseout(function () {
                $(this).get(0).pause();
            });
        });
        </script>

</head>
<body><center>
    <form id="form1" runat="server">
    <div>                       <asp:Button ID="btnback" runat="server" Text="Back" CssClass ="btn btn-primary btn-lg"  Height="39px" Width="110px" OnClick="btnback_Click"  ></asp:Button>
                   
        <h1>WelCome To Agriculture online farmer support and Store Details </h1>


    

          <div>
<%--<div style="width: 92%; height: 450px; overflow: scroll">--%>
            <asp:GridView ID="GridView1" ShowHeaderWhenEmpty="true"  runat="server" AutoGenerateColumns="false" Width="99%" Height="450px">  
                <EmptyDataTemplate>  
                    <div class="text-center">No Data Found <strong>Upload New Video</strong></div>  
                </EmptyDataTemplate>  
           <Columns>  
                   <%-- <asp:BoundField HeaderText="videoId" DataField="videoId"/>  
                    <asp:BoundField HeaderText="Name" DataField="Name" /> --%> 
                <asp:TemplateField HeaderText="Videos">  
                        <ItemTemplate>  
                            <video width="40%" height="200px" controls class="border">  
                                <source src='<%#Eval("videopath")%>' type="video/mp4">  

                            </video>  
           
                        </ItemTemplate>  
                    </asp:TemplateField>   
                </Columns> 
            </asp:GridView>  
       </div>
        
 
    <%--chat bot part--%>
       <asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table>
            <tr>
                <td>Country:</td>
                <td><asp:DropDownList ID="ddlCountries" runat="server" AutoPostBack = "true" OnSelectedIndexChanged = "Country_Changed">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>State:</td>
                <td>
                    <asp:DropDownList ID="ddlStates" runat="server" AutoPostBack = "true" OnSelectedIndexChanged = "State_Changed">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>City:</td>
                <td>
                    <asp:DropDownList ID="ddlCities" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>
    </div>
    </form>   
    </center>   
</body>

       
</html>
