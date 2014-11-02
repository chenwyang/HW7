<%@ Page Title="" Language="VB" MasterPageFile="~/coffee.master" AutoEventWireup="false" CodeFile="NewCoffee.aspx.vb" Inherits="admin_NewCoffee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Admin-Add a New Coffee
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
        <br />
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource1" DefaultMode="Insert">
            <EditItemTemplate>
                
            </EditItemTemplate>
            <InsertItemTemplate>
                <table>
                    <tr>
                        <td style="text-align:right;">
                            Name of Coffee: 
                        </td>
                        <td style="text-align:left;">
                             <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                        </td>
                        <td style="text-align:left;">
                            <asp:RequiredFieldValidator ID="rvf_name" runat="server" ErrorMessage="Please enter a name for your coffee." ControlToValidate="nameTextBox" CssClass="validationError"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <td style="text-align:right;">
                            Grind Type:
                        </td>
                        <td style="text-align:left;">
                            <asp:TextBox ID="typeTextBox" runat="server" Text='<%# Bind("type") %>' />
                        </td>
                        <td style="text-align:left;">
                            <asp:RequiredFieldValidator ID="rfv_type" runat="server" ErrorMessage="Please enter a grind type for your coffee." ControlToValidate="typeTextBox" CssClass="validationError"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <td style="text-align:right;">
                            Country of Origin: 
                        </td>
                        <td style="text-align:left;">
                            <asp:TextBox ID="originTextBox" runat="server" Text='<%# Bind("origin") %>' />
                        </td>
                        <td style="text-align:left;">
                            <asp:RequiredFieldValidator ID="rvf_origin" runat="server" ErrorMessage="Please enter the country of origin for your coffee." ControlToValidate="originTextBox" CssClass="validationError"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <td style="text-align:right;">
                            Price ($):
                        </td>
                        <td style="text-align:left;">
                            <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                        </td>
                        <td style="text-align:left;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter a price for your coffee." ControlToValidate="priceTextBox" CssClass="validationError"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <td style="text-align:right;">
                            Measure: 
                        </td>
                        <td style="text-align:left;">
                            <asp:TextBox ID="measureTextBox" runat="server" Text='<%# Bind("measure") %>' />
                        </td>
                        <td style="text-align:left;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter the way of measure for your coffee." ControlToValidate="measureTextBox" CssClass="validationError"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <td style="text-align:right;">
                            Flavor: 
                        </td>
                        <td style="text-align:left;">
                            <asp:TextBox ID="flavorTextBox" runat="server" Text='<%# Bind("flavor") %>' />
                        </td>
                    </tr>

                    <tr>
                        <td style="text-align:right;">
                            Notes: 
                        </td>
                        <td style="text-align:left;">
                            <asp:TextBox ID="notesTextBox" runat="server" Text='<%# Bind("notes") %>' />
                        </td>
                    </tr>

                    <tr>
                        <td style="text-align:right;">
                            <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="New" />
                        </td>
                        <td style="text-align:left;">
                            <asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </td>
                    </tr>
                </table>
          
            </InsertItemTemplate>
            <ItemTemplate>
               
            </ItemTemplate>
        </asp:FormView>
</asp:Content>

