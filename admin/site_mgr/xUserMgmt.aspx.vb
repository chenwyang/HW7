Imports System.Data.SqlClient
Imports System.Data

Partial Class site_mgr_AddNewUser
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then


            BindUsers()
            lbl_deletedUser.Text = String.Empty
            
        End If

    End Sub


    Protected Sub CreateUserWizard1_CreatedUser(sender As Object, e As EventArgs) Handles CreateUserWizard1.CreatedUser

        Dim p As MembershipCreateStatus = MembershipCreateStatus.Success
        Membership.CreateUser(CreateUserWizard1.UserName, CreateUserWizard1.Password, CreateUserWizard1.Email, CreateUserWizard1.Question, CreateUserWizard1.Answer, True, p)

        Response.Redirect("./RoleMgmt.aspx")

    End Sub

    Public Sub BindUsers()

        Dim queryString As String = "SELECT UserName FROM dbo.aspnet_Users"
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("db_stateFacts").ConnectionString

        Dim da As SqlDataAdapter = New SqlDataAdapter(queryString, connectionString)
        Dim ds As New DataSet

        da.Fill(ds, "Users")

        list_allUsers.DataSource = ds
        list_allUsers.DataTextField = "UserName"
        list_allUsers.DataValueField = "UserName"
        list_allUsers.DataBind()

    End Sub




    Protected Sub btn_deleteUser_Click(sender As Object, e As EventArgs) Handles btn_deleteUser.Click

        lbl_deletedUser.Text = ""

        Try
            Membership.DeleteUser((list_allUsers.SelectedItem.Text), deleteAllRelatedData:=True)
            BindUsers()
            lbl_deletedUser.Text = "The User Was Removed Successfully"
        Catch ex As Exception
            lbl_deletedUser.Text = ex.Message
        End Try

        Response.AddHeader("REFRESH", "2;URL=UserMgmt.aspx")

    End Sub


End Class
