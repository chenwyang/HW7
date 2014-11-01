<%@ Page Language="VB" AutoEventWireup="false" CodeFile="xCoffeeDetails.aspx.vb" Inherits="CoffeeDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" type="text/css" href="css/StyleSheet.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="SqlDataSource1" Height="50px" Width="236px">
            <Fields>
                <asp:BoundField DataField="name" HeaderText="Name of Coffee" SortExpression="name" />
                <asp:BoundField DataField="type" HeaderText="Grind Type" SortExpression="type" />
                <asp:BoundField DataField="origin" HeaderText="Country of Origin" SortExpression="origin" />
                <asp:BoundField DataField="price" HeaderText="Price ($)" SortExpression="price" />
                <asp:BoundField DataField="measure" HeaderText="Measure" SortExpression="measure" />
                <asp:BoundField DataField="flavor" HeaderText="Flavor" SortExpression="flavor" />
                <asp:BoundField DataField="notes" HeaderText="Notes" SortExpression="notes" />
            </Fields>
        </asp:DetailsView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_stateFacts %>"   SelectCommand="SELECT * FROM [chenwyang_coffee] WHERE ([id] = @id)" >
            
            <SelectParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
            </SelectParameters>
            
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
