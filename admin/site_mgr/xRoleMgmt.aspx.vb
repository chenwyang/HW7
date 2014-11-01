Imports System.Data.SqlClient
Imports System.Data


Partial Class Account_AddRole
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            BindRoles()
            BindUsers()
            lbl_addUserToRole.Text = String.Empty
            lbl_roleMgmt.Text = String.Empty
            lbl_removeRoleFromUser.Text = String.Empty

        End If

    End Sub


    Public Sub BindRoles()


        Dim queryString As String = "SELECT RoleName FROM dbo.aspnet_Roles"
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("db_stateFacts").ConnectionString

        Dim da As SqlDataAdapter = New SqlDataAdapter(queryString, connectionString)
        Dim ds As New DataSet

        da.Fill(ds, "Roles")

        list_Roles.DataSource = ds
        list_Roles.DataTextField = "RoleName"
        list_Roles.DataValueField = "RoleName"
        list_Roles.DataBind()

        list_currentRoles.DataSource = ds
        list_currentRoles.DataTextField = "RoleName"
        list_currentRoles.DataValueField = "RoleName"
        list_currentRoles.DataBind()

        list_allRoles.DataSource = ds
        list_allRoles.DataTextField = "RoleName"
        list_allRoles.DataValueField = "RoleName"
        list_allRoles.DataBind()

    End Sub

    Public Sub BindUsers()

        Dim queryString As String = "SELECT UserName FROM dbo.aspnet_Users"
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("db_stateFacts").ConnectionString

        Dim da As SqlDataAdapter = New SqlDataAdapter(queryString, connectionString)
        Dim ds As New DataSet

        da.Fill(ds, "Users")

        list_Users.DataSource = ds
        list_Users.DataTextField = "UserName"
        list_Users.DataValueField = "UserName"
        list_Users.DataBind()


        list_allUsers.DataSource = ds
        list_allUsers.DataTextField = "UserName"
        list_allUsers.DataValueField = "UserName"
        list_allUsers.DataBind()

    End Sub

    Protected Sub btn_deleteExistingRole_Click(sender As Object, e As EventArgs) Handles btn_deleteExistingRole.Click

        lbl_roleMgmt.Text = ""

        Try
            Roles.DeleteRole(list_currentRoles.SelectedItem.Text)
            BindUsers()
            BindRoles()
            lbl_roleMgmt.Text = "The Role Was Removed Successfully"
        Catch ex As Exception
            lbl_roleMgmt.Text = ex.Message
        End Try

        Response.AddHeader("REFRESH", "2;URL=RoleMgmt.aspx")

    End Sub

    Protected Sub btn_addNewRole_Click(sender As Object, e As EventArgs) Handles btn_addNewRole.Click

        lbl_roleMgmt.Text = ""

        Try
            If Not Roles.RoleExists(tb_newRole.Text) Then
                Roles.CreateRole(tb_newRole.Text)
                BindUsers()
                BindRoles()
                lbl_addUserToRole.Text = "The New Role Was Created Successfully"

            Else
                lbl_roleMgmt.Text = "The Role Already Exists"

            End If

        Catch ex As Exception
            lbl_roleMgmt.Text = ex.Message

        End Try
        Response.AddHeader("REFRESH", "2;URL=RoleMgmt.aspx")
    End Sub

    Protected Sub btn_AddUserToRole_Click(sender As Object, e As EventArgs) Handles btn_AddUserToRole.Click

        lbl_addUserToRole.Text = ""

        Try
            If Not Roles.IsUserInRole(list_Roles.SelectedItem.Text) Then
                Roles.AddUserToRole(list_Users.SelectedItem.Text, list_Roles.SelectedItem.Text)
                BindUsers()
                BindRoles()
                lbl_addUserToRole.Text = "User Assigned To User Successfully"
            Else
                lbl_addUserToRole.Text = "Role(s) Already Assigned To User"
            End If

        Catch ex As Exception
            lbl_addUserToRole.Text = ex.Message
        End Try

        Response.AddHeader("REFRESH", "2;URL=RoleMgmt.aspx")

    End Sub

    Protected Sub list_allUsers_SelectedIndexChanged(sender As Object, e As EventArgs) Handles list_allUsers.SelectedIndexChanged
        Dim queryString As String = "SELECT aspnet_Roles.RoleName FROM aspnet_Roles INNER JOIN aspnet_UsersInRoles ON aspnet_Roles.RoleId = aspnet_UsersInRoles.RoleId INNER JOIN aspnet_Users ON aspnet_UsersInRoles.UserId = aspnet_Users.UserId WHERE aspnet_Users.UserName LIKE "
        Dim selectedUser As String = list_allUsers.SelectedItem.Text
        Dim sqlStmt As String = queryString & "'" & selectedUser & "'"

        Dim connectionString As String = ConfigurationManager.ConnectionStrings("db_stateFacts").ConnectionString

        Dim da As SqlDataAdapter = New SqlDataAdapter(sqlStmt, connectionString)
        Dim ds As New DataSet

        da.Fill(ds, "Roles")

        list_rolesThisUserHas.DataSource = ds
        list_rolesThisUserHas.DataTextField = "RoleName"
        list_rolesThisUserHas.DataValueField = "RoleName"
        list_rolesThisUserHas.DataBind()

    End Sub

    Protected Sub btn_removeRoleFromUser_Click(sender As Object, e As EventArgs) Handles btn_removeRoleFromUser.Click

        lbl_removeRoleFromUser.Text = ""

        Try
            Roles.RemoveUserFromRole(list_allUsers.SelectedItem.Text, list_rolesThisUserHas.SelectedItem.Text)

            BindUsers()
            BindRoles()

            lbl_removeRoleFromUser.Text = "Role Has Been Removed From The User Successfully"

        Catch ex As Exception

            lbl_removeRoleFromUser.Text = ex.Message

        End Try

        Response.AddHeader("REFRESH", "2;URL=RoleMgmt.aspx")

    End Sub

    Protected Sub list_allRoles_SelectedIndexChanged(sender As Object, e As EventArgs) Handles list_allRoles.SelectedIndexChanged
        Dim queryString As String = "SELECT aspnet_Users.Username FROM aspnet_Roles INNER JOIN aspnet_UsersInRoles ON aspnet_Roles.RoleId = aspnet_UsersInRoles.RoleId INNER JOIN aspnet_Users ON aspnet_UsersInRoles.UserId = aspnet_Users.UserId WHERE aspnet_Roles.RoleName Like "
        Dim selectedRole As String = list_allRoles.SelectedItem.Text
        Dim sqlStmt As String = queryString & "'" & selectedRole & "'"

        Dim connectionString As String = ConfigurationManager.ConnectionStrings("db_stateFacts").ConnectionString

        Dim da As SqlDataAdapter = New SqlDataAdapter(sqlStmt, connectionString)
        Dim ds As New DataSet

        da.Fill(ds, "Roles")

        list_usersInThisRole.DataSource = ds
        list_usersInThisRole.DataTextField = "UserName"
        list_usersInThisRole.DataValueField = "UserName"
        list_usersInThisRole.DataBind()

    End Sub

    Protected Sub btn_removeUserFromRole_Click(sender As Object, e As EventArgs) Handles btn_removeUserFromRole.Click

        lbl_removeRoleFromUser.Text = ""

        Try
            Roles.RemoveUserFromRole(list_usersInThisRole.SelectedItem.Text, list_allRoles.SelectedItem.Text)

            BindUsers()
            BindRoles()


            lbl_removeUserFromRole.Text = "The User Has Been Removed From The Role Successfully"

        Catch ex As Exception

            lbl_removeUserFromRole.Text = ex.Message

        End Try

        Response.AddHeader("REFRESH", "2;URL=RoleMgmt.aspx")

    End Sub

   
End Class
