<%@ Page Title="" Language="VB" MasterPageFile="~/coffee.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"> 
    Home page
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
    <br />
    <h2>Site Administration</h2>
       <asp:Image ID="img_coffee" runat="server" Height="200px" ImageUrl="~/images/CoffeeBean.jpg" Width="300px" />
        <br />
     <asp:hyperlink runat="server" NavigateUrl="~/admin/ViewAllCoffee.aspx">Edit a Coffee</asp:hyperlink>
        <br />
    <asp:hyperlink runat="server" NavigateUrl="~/admin/NewCoffee.aspx">Add a New Coffee</asp:hyperlink>
        <br />
    <asp:hyperlink runat="server" NavigateUrl="~/admin/site_mgr/UserMgmt.aspx">Manage Users</asp:hyperlink>
        <br />
    <asp:hyperlink runat="server" NavigateUrl="~/admin/site_mgr/RoleMgmt.aspx">Manage Roles</asp:hyperlink>
      
</asp:Content>

