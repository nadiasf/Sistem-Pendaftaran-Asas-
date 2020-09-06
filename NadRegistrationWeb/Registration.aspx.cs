using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace NadRegistrationWeb
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                conn2.Open();
                string checkUser = "SELECT COUNT(*) FROM USERDATA WHERE USERNAME='" + TextBox1UN.Text + "'";
                SqlCommand com2 = new SqlCommand(checkUser, conn2);
                int temp = Convert.ToInt32(com2.ExecuteScalar().ToString());
                conn2.Close();
                if (temp < 1)
                {
                    Guid newGUID = Guid.NewGuid();
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                    conn.Open();

                    string insertQuery = "insert into UserData (Id,UserName,Email,Password,Country) values ( @id, @Uname, @email, @password, @country)";
                    SqlCommand com = new SqlCommand(insertQuery, conn);
                    com.Parameters.AddWithValue("@id", newGUID.ToString());
                    com.Parameters.AddWithValue("@Uname", TextBox1UN.Text);
                    com.Parameters.AddWithValue("@email", TextBoxEmail.Text);
                    com.Parameters.AddWithValue("@password", TextBox3Pass.Text);
                    com.Parameters.AddWithValue("@country", DropDownList1Country.SelectedItem.ToString());


                    com.ExecuteNonQuery();
                   // Response.Redirect("Manager.aspx");
                    Response.Write("Registration is successful");
                    conn.Close();

                    //Response.Write("Your Registration is successful");
                }
                else
                {
                    Response.Write("This username is already used");
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error:" + ex.ToString());
            }
        }

    }
}
