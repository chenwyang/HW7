<%@ Page Title="" Language="VB" MasterPageFile="~/coffee.master" AutoEventWireup="false" CodeFile="search.aspx.vb" Inherits="search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Search
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br /><br />
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

    <br />
    <% If Not IsPostBack Then%>
        Search for a coffee by name: &nbsp; &nbsp; &nbsp;
        <asp:TextBox ID="tb_Coffee" runat="server" AutopostBack="True" Width="128px"></asp:TextBox>
 
    <% Else%>
        Search for another tool by name: &nbsp; &nbsp; &nbsp;
        <br />
        <asp:TextBox ID="tb_Coffee2" runat="server" AutopostBack="True" Width="128px"></asp:TextBox>
        <br />
        <asp:GridView runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                <asp:BoundField DataField="origin" HeaderText="origin" SortExpression="origin" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                <asp:BoundField DataField="measure" HeaderText="measure" SortExpression="measure" />
                <asp:BoundField DataField="flavor" HeaderText="flavor" SortExpression="flavor" />
                <asp:BoundField DataField="notes" HeaderText="notes" SortExpression="notes" />
            </Columns>
        </asp:GridView>

    <%End If%>
            
</asp:Content>

