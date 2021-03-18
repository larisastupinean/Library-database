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
    public partial class Borrows : Page
    {
        protected void InsertButton_Click(object sender, EventArgs e)
        {
            string con = ConfigurationManager.ConnectionStrings["db_library_connection"].ConnectionString;
            using (SqlConnection sql = new SqlConnection(con))
            {
                string query = "INSERT INTO Borrows (BorrowID,StudentID,BookID,BorrowDate,DueDate) VALUES (@bor_id,@st_id,@book_id,@bor_date,@due_date);";
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Connection = sql;
                    cmd.Parameters.AddWithValue("@bor_id", TextBoxBorrowID.Text);
                    cmd.Parameters.AddWithValue("@st_id", DropDownListStudents.SelectedValue);
                    cmd.Parameters.AddWithValue("@book_id", DropDownListBooks.SelectedValue);
                    cmd.Parameters.AddWithValue("@bor_date", TextBoxBorrowDate.Text);
                    cmd.Parameters.AddWithValue("@due_date", TextBoxDueDate.Text);

                    sql.Open();
                    cmd.ExecuteNonQuery();
                    sql.Close();
                }
            }
            GridView1.DataBind();
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            string con = ConfigurationManager.ConnectionStrings["db_library_connection"].ConnectionString;
            using (SqlConnection sql = new SqlConnection(con))
            {
                string query = "UPDATE Borrows SET ReturnDate=@ret_date WHERE (BorrowId=@bor_id AND StudentId=@st_id AND BookId=@book_id)";
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Connection = sql;
                    cmd.Parameters.AddWithValue("@ret_date", TextBoxReturnDate.Text);
                    cmd.Parameters.AddWithValue("@st_id", DropDownListStudents.SelectedValue);
                    cmd.Parameters.AddWithValue("@book_id", DropDownListBooks.SelectedValue);
                    cmd.Parameters.AddWithValue("@bor_id", TextBoxBorrowID.Text);

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
                string query = "DELETE FROM Borrows WHERE (BorrowID=@bor_id AND StudentId=@st_id AND BookId=@book_id)";
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Connection = sql;
                    cmd.Parameters.AddWithValue("@st_id", DropDownListStudents.SelectedValue);
                    cmd.Parameters.AddWithValue("@book_id", DropDownListBooks.SelectedValue);
                    cmd.Parameters.AddWithValue("@bor_id", TextBoxBorrowID.Text);

                    sql.Open();
                    cmd.ExecuteNonQuery();
                    sql.Close();
                }
            }
            GridView1.DataBind();
        }
    }
}