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
    public partial class Students : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            string con = ConfigurationManager.ConnectionStrings["db_library_connection"].ConnectionString;
            using (SqlConnection sql = new SqlConnection(con))
            {
                string query = "INSERT INTO Students (StudentID,Name,Birthdate,Class) VALUES (@stud_id,@name,@birth,@class);";
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Connection = sql;
                    cmd.Parameters.AddWithValue("@stud_id", TextBoxStudentID.Text);
                    cmd.Parameters.AddWithValue("@name", TextBoxName.Text);
                    cmd.Parameters.AddWithValue("@birth", TextBoxBirthdate.Text);
                    cmd.Parameters.AddWithValue("@class", RadioButtonListClass.SelectedValue);

                    sql.Open();
                    cmd.ExecuteNonQuery();
                    sql.Close();
                }
            }
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}