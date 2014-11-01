
Partial Class search
    Inherits System.Web.UI.Page

    Protected Sub tb_Coffee_TextChanged(sender As Object, e As EventArgs) Handles tb_Coffee.TextChanged
        ' Declare a variable
        Dim searchWord As String

        ' Set the variable equal to the SQL statements to perform the search
        searchWord = "Select * From [chenwyang_coffee] WHERE (name LIKE '%" + tb_Coffee.Text.ToString() + "%')"

        ' Apply the variable (SQL statement) to the data source
        SqlDataSource1.SelectCommand = searchWord
    End Sub
End Class
