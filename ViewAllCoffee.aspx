<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ViewAllCoffee.aspx.vb" Inherits="ViewAllCoffee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="name" HeaderText="Name of Country" SortExpression="name" />
                <asp:BoundField DataField="type" HeaderText="Grind Type" SortExpression="type" />
                <asp:BoundField DataField="origin" HeaderText="Country of Origin" SortExpression="origin" />
                <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="CoffeeDetails.aspx?id={0}" Text="Select" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_stateFacts %>" DeleteCommand="DELETE FROM [chenwyang_coffee] WHERE [id] = @id" InsertCommand="INSERT INTO [chenwyang_coffee] ([name], [type], [origin], [price], [measure], [flavor], [notes]) VALUES (@name, @type, @origin, @price, @measure, @flavor, @notes)" SelectCommand="SELECT * FROM [chenwyang_coffee]" UpdateCommand="UPDATE [chenwyang_coffee] SET [name] = @name, [type] = @type, [origin] = @origin, [price] = @price, [measure] = @measure, [flavor] = @flavor, [notes] = @notes WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="type" Type="String" />
                <asp:Parameter Name="origin" Type="String" />
                <asp:Parameter Name="price" Type="Decimal" />
                <asp:Parameter Name="measure" Type="String" />
                <asp:Parameter Name="flavor" Type="String" />
                <asp:Parameter Name="notes" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="type" Type="String" />
                <asp:Parameter Name="origin" Type="String" />
                <asp:Parameter Name="price" Type="Decimal" />
                <asp:Parameter Name="measure" Type="String" />
                <asp:Parameter Name="flavor" Type="String" />
                <asp:Parameter Name="notes" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
