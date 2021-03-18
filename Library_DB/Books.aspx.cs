using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Library_DB
{
    public partial class Books : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            string con = ConfigurationManager.ConnectionStrings["db_library_connection"].ConnectionString;
            using (SqlConnection sql = new SqlConnection(con))
            {
                string query ="INSERT INTO Books (BookID,Title,NoPages,AuthorID,GenreID) " +
                    "VALUES (@book_id,@title,@no_pages,(SELECT AuthorID FROM Authors WHERE Name=@aut_name),(SELECT GenreID FROM Genres WHERE Name=@gen_name));";
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Connection = sql;
                    cmd.Parameters.AddWithValue("@book_id", TextBoxBookID.Text);
                    cmd.Parameters.AddWithValue("@title", TextBoxTitle.Text);
                    cmd.Parameters.AddWithValue("@no_pages", TextBoxNoPages.Text);
                    cmd.Parameters.AddWithValue("@aut_name", DropDownListAuthors.SelectedValue);
                    cmd.Parameters.AddWithValue("@gen_name", DropDownListGenres.SelectedValue);

                    sql.Open();
                    cmd.ExecuteNonQuery();
                    sql.Close();
                }
            }
            GridView1.DataBind();
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            string con = ConfigurationManager.ConnectionStrings["db_library_connection"].ConnectionString;
            using (SqlConnection sql = new SqlConnection(con))
            {
                string query = "DELETE FROM Books WHERE BookID=@book_id AND AuthorID=(SELECT AuthorID FROM Authors WHERE Name=@aut_name)";
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Connection = sql;
                    cmd.Parameters.AddWithValue("@book_id", TextBoxBookID.Text);
                    cmd.Parameters.AddWithValue("@aut_name", DropDownListAuthors.SelectedValue);

                    sql.Open();
                    cmd.ExecuteNonQuery();
                    sql.Close();
                }
            }
            GridView1.DataBind();
        }
    }
}