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
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_Login_Click(object sender, EventArgs e)
        {
            
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            conn.Open();
            string checkUser = "SELECT COUNT(*) FROM USERDATA WHERE USERNAME='" + TextBoxUsername.Text + "'";
            SqlCommand com = new SqlCommand(checkUser, conn);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            conn.Close();
            if (temp == 1)
            {

                try
                {
                    conn.Open();
                    string checkPassword = "SELECT PASSWORD FROM USERDATA WHERE PASSWORD='" + TextBoxPassword.Text + "'";
                    SqlCommand passCom = new SqlCommand(checkPassword, conn);
                   string password = passCom.ExecuteScalar().ToString().Replace(" ", "");
              
                    conn.Close();
                    if (password == TextBoxPassword.Text)
                    {
                        Session["New"] = TextBoxUsername.Text;
                        Response.Write("Password is correct");
                        Response.Redirect("Users.aspx");
                    }
                    else 
                    {
                        Response.Write("Password is Not correct");
                    }
                }
                catch (Exception ex)
                {

                    Response.Write(ex.Message);
                }

                // conn.Close();

            }
            else
            {
                Response.Write("Username is Not correct");
            }
             


        }
    }
}