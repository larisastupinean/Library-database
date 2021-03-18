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
    public partial class Authors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void InsertButton_Click1(object sender, EventArgs e)
        {
            string con = ConfigurationManager.ConnectionStrings["db_library_connection"].ConnectionString;
            using (SqlConnection sql = new SqlConnection(con))
            {
                string query = "INSERT INTO Authors (AuthorID,Name) VALUES (@author_id,@name);";
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Connection = sql;
                    cmd.Parameters.AddWithValue("@author_id", TextBoxAuthorID.Text);
                    cmd.Parameters.AddWithValue("@name", TextBoxName.Text);

                    sql.Open();
                    cmd.ExecuteNonQuery();
                    sql.Close();
                }
            }
            GridView1.DataBind();
        }
    }
}