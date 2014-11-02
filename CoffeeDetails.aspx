<%@ Page Title="" Language="VB" MasterPageFile="~/coffee.master" AutoEventWireup="false" CodeFile="CoffeeDetails.aspx.vb" Inherits="CoffeeDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Coffee Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/StyleSheet.css"/>
    <br /><br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="SqlDataSource1" Height="50px" Width="236px" CssClass="cssdetailsview">
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
</asp:Content>

