
Partial Class details
    Inherits System.Web.UI.Page

    Protected Sub FormView1_ItemDeleted(sender As Object, e As FormViewDeletedEventArgs) Handles FormView1.ItemDeleted
        Dim deletedM As String = e.Values("Title").ToString

        lbl_deletedM.Text = deletedM & " has been deleted form the database."

        Response.AddHeader("REFRESH", "2;URL=./Admin_Materials.aspx")

    End Sub


    Protected Sub FormView1_ItemUpdated(sender As Object, e As FormViewUpdatedEventArgs) Handles FormView1.ItemUpdated
        Response.AddHeader("REFRESH", "2;URL=./Admin_Materials.aspx")
    End Sub
End Class
