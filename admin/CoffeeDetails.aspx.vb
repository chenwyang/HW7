
Partial Class CoffeeDetails
    Inherits System.Web.UI.Page

    Protected Sub DetailsView1_ItemDeleted(sender As Object, e As DetailsViewDeletedEventArgs) Handles DetailsView1.ItemDeleted
        Response.AddHeader("REFRESH", "1;URL=./ViewAllCoffee.aspx")
    End Sub


End Class
