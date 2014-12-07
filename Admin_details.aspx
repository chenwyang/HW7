<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Admin_Details.aspx.vb" Inherits="details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
    <br />



    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SouthLiberty %>" DeleteCommand="DELETE FROM [project_Materials2] WHERE [MID] = @MID" InsertCommand="INSERT INTO [project_Materials2] ([Title], [Author], [Publisher], [Copyright], [ISBN], [Description], [Availability], [Type]) VALUES (@Title, @Author, @Publisher, @Copyright, @ISBN, @Description, @Availability, @Type)" SelectCommand="SELECT * FROM [project_Materials2] WHERE ([MID]=@MID)" UpdateCommand="UPDATE [project_Materials2] SET [Title] = @Title, [Author] = @Author, [Publisher] = @Publisher, [Copyright] = @Copyright, [ISBN] = @ISBN, [Description] = @Description, [Availability] = @Availability, [Type] = @Type WHERE [MID] = @MID">
        <SelectParameters>
            <asp:QueryStringParameter Name="MID" QueryStringField="MID" Type="Int32" />
        </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SouthLiberty %>" SelectCommand="SELECT Project_User.UserID, Project_User.FirstName, Project_User.LastName, Project_User.City, Project_User.State FROM project_Borrow INNER JOIN Project_User ON project_Borrow.PID = Project_User.UserID WHERE (project_Borrow.MID = @MID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="MID" QueryStringField ="MID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>


        <asp:HyperLink ID="materials0" runat="server" NavigateUrl="~/librarian/Admin_Materials.aspx">Back to Materials page</asp:HyperLink>
    <br />
    </li>    
    <br />
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="MID" DataSourceID="SqlDataSource1" Width="576px">
        <EditItemTemplate>
           
            <table class="table table-bordered">
			<tr>
				<td id="title"; style="text-align:right">  
                    Material ID: 
				</td>
                <td id="content"; style="text-align:left">
                    <asp:Textbox ID="tb_MID" runat="server" Text='<%# Bind("MID")%>' />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_MID" runat="server" ErrorMessage="Please enter a material ID." ControlToValidate="tb_MID"></asp:RequiredFieldValidator>
                </td>
			</tr>
            
             <tr>
				<td id="title"; style="text-align:right">  
                   Title: 
				</td>
                <td id="content"; style="text-align:left">
                    <asp:Textbox ID="tb_Title" runat="server" Text='<%# Bind("Title")%>' />
                </td>
                 <td>
                    <asp:RequiredFieldValidator ID="rfv_Title" runat="server" ErrorMessage="Please enter a material title." ControlToValidate="tb_Title"></asp:RequiredFieldValidator>
                </td>
			</tr>
			
            <tr>
				<td id="title"; style="text-align:right">  
                   Author:
				</td>
                <td id="content"; style="text-align:left">
                    <asp:Textbox ID="tb_Author" runat="server" Text='<%# Bind("Author")%>' />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_author" runat="server" ErrorMessage="Please enter the author for the material." ControlToValidate="tb_Author"></asp:RequiredFieldValidator>
                </td>
			</tr>
			
              <tr>
				<td id="title"; style="text-align:right">  
                   Publisher:
				</td>
                <td id="content"; style="text-align:left">
                    <asp:Textbox ID="tb_Publisher" runat="server" Text='<%# Bind("Publisher")%>' />
                </td>
                 <td>

                 </td>
			</tr>
		
              <tr>
				<td id="title"; style="text-align:right">  
                   Copyright:
				</td>
                <td id="content"; style="text-align:left">
                    <asp:Textbox ID="tb_Copyright" runat="server" Text='<%# Bind("Copyright")%>' />
                </td>
                 <td>

                 </td>
			</tr>
        
            <tr>
				<td id="title"; style="text-align:right">  
                  ISBN: 
				</td>
                <td id="content"; style="text-align:left">
                    <asp:Textbox ID="tb_ISBN" runat="server" Text='<%# Bind("ISBN")%>' />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_ISBN" runat="server" ErrorMessage="Please enter the ISBN." ControlToValidate="tb_ISBN"></asp:RequiredFieldValidator>
                </td>
			</tr>
            
            <tr>
				<td id="title"; style="text-align:right">  
                  Description: 
				</td>
                <td id="content"; style="text-align:left">
                   <asp:Textbox ID="tb_Description" runat="server" Text='<%# Bind("Description")%>' />
                </td>
                 <td>

                 </td>
			</tr>

             
             <tr>
				<td id="title"; style="text-align:right">  
                  Availability: 
				</td>
                <td id="content"; style="text-align:left">
                   <asp:Textbox ID="tb_Availability" runat="server" Text='<%# Bind("Availability")%>' />
                </td>
                 <td>
                    <asp:RequiredFieldValidator ID="rfv_Availability" runat="server" ErrorMessage="Please indicate the availability of the material." ControlToValidate="tb_Availability"></asp:RequiredFieldValidator>
                </td>
			</tr>
      
			<tr>
				<td id="title"; style="text-align:right">  
                  Type:
				</td>
                <td id="content"; style="text-align:left">
                   <asp:Textbox ID="tb_Type" runat="server" Text='<%# Bind("Type")%>' />
                </td>
                    <td>

                 </td>
			</tr>

            <tr>
                 <td style="text-align:right;">
                       <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                  </td>
                  <td style="text-align:left;">
                        <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                  </td>
                    <td>

                 </td>
            </tr>
            
		</table>

        </EditItemTemplate>
        <InsertItemTemplate>
            
        </InsertItemTemplate>
        <ItemTemplate>


            <table class="table table-bordered">
			<tr>
				<td id="title"; style="text-align:right">  
                    *Material ID: 
				</td>
                <td id="content"; style="text-align:left">
                    <asp:Label ID="MIDLabel" runat="server" Text='<%# Eval("MID")%>' />
                </td>
			</tr>
            
             <tr>
				<td id="title"; style="text-align:right">  
                   *Title: 
				</td>
                <td id="content"; style="text-align:left">
                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Bind("Title")%>' />
                </td>
			</tr>
			
            <tr>
				<td id="title"; style="text-align:right">  
                   *Author:
				</td>
                <td id="content"; style="text-align:left">
                    <asp:Label ID="AuthorLabel" runat="server" Text='<%# Bind("Author")%>' />
                </td>
			</tr>
			
              <tr>
				<td id="title"; style="text-align:right">  
                   Publisher:
				</td>
                <td id="content"; style="text-align:left">
                    <asp:Label ID="PublisherLabel" runat="server" Text='<%# Bind("Publisher")%>' />
                </td>
			</tr>
		
              <tr>
				<td id="title"; style="text-align:right">  
                   Copyright:
				</td>
                <td id="content"; style="text-align:left">
                    <asp:Label ID="CopyrightLabel" runat="server" Text='<%# Bind("Copyright")%>' />
                </td>
			</tr>
        
            <tr>
				<td id="title"; style="text-align:right">  
                  *ISBN: 
				</td>
                <td id="content"; style="text-align:left">
                    <asp:Label ID="ISBNLabel" runat="server" Text='<%# Bind("ISBN")%>' />
                </td>
			</tr>
            
            <tr>
				<td id="title"; style="text-align:right">  
                  Description: 
				</td>
                <td id="content"; style="text-align:left">
                   <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Bind("Description")%>' />
                </td>
			</tr>

             
             <tr>
				<td id="title"; style="text-align:right">  
                  *Availability: 
				</td>
                <td id="content"; style="text-align:left">
                   <asp:Label ID="AvailabilityLabel" runat="server" Text='<%# Bind("Availability")%>' />
                </td>
			</tr>
      
			<tr>
				<td id="title"; style="text-align:right">  
                  Type:
				</td>
                <td id="content"; style="text-align:left">
                   <asp:Label ID="TypeLabel" runat="server" Text='<%# Bind("Type")%>' />
                </td>
			</tr>

            <tr>
                 <td style="text-align:right;">
                       <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Edit" Text="Edit" />
                  </td>
                  <td style="text-align:left;">
                        <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                  </td>
            </tr>
            
		</table>

           
        </ItemTemplate>
    </asp:FormView>
    <asp:Label ID="lbl_deletedM" runat="server"></asp:Label>
    <br />
    <br />
    If book is not available it here is the information about the patron:<br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="UserID" DataSourceID="SqlDataSource2" Width="563px" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="UserID" HeaderText="UserID" ReadOnly="True" SortExpression="UserID" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <br />
    <br />
    <br />
    <br />

</asp:Content>

