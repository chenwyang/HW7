<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CoffeeDetails.aspx.vb" Inherits="CoffeeDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="SqlDataSource1" Height="50px" Width="160px">
            <Fields>
                <asp:BoundField DataField="name" HeaderText="Name of Coffee" SortExpression="name" />
                <asp:BoundField DataField="type" HeaderText="Grind Type" SortExpression="type" />
                <asp:BoundField DataField="origin" HeaderText="Country of Origin" SortExpression="origin" />
                <asp:BoundField DataField="price" HeaderText="Price ($)" SortExpression="price" />
                <asp:BoundField DataField="measure" HeaderText="Measure" SortExpression="measure" />
                <asp:BoundField DataField="flavor" HeaderText="Flavor" SortExpression="flavor" />
                <asp:BoundField DataField="notes" HeaderText="Notes" SortExpression="notes" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_stateFacts %>" DeleteCommand="DELETE FROM [chenwyang_coffee] WHERE [id] = @id" InsertCommand="INSERT INTO [chenwyang_coffee] ([name], [type], [origin], [price], [measure], [flavor], [notes]) VALUES (@name, @type, @origin, @price, @measure, @flavor, @notes)" SelectCommand="SELECT * FROM [chenwyang_coffee] WHERE ([id] = @id)" UpdateCommand="UPDATE [chenwyang_coffee] SET [name] = @name, [type] = @type, [origin] = @origin, [price] = @price, [measure] = @measure, [flavor] = @flavor, [notes] = @notes WHERE [id] = @id">
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
            <SelectParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
            </SelectParameters>
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
