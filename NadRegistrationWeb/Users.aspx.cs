using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace NadRegistrationWeb
{
    public partial class Users : System.Web.UI.Page
    {
        //string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Integrated Security=true;Initial Catalog=C:\USERS\NADIA\DESKTOP\NADREGISTRATIONWEB\NADREGISTRATIONWEB\APP_DATA\REGISTRATION.MDF";
        string connectionString = ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString;
        //@"Data Source = (LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Nadia\Desktop\NadRegistrationWeb\NadRegistrationWeb\App_Data\Registration.mdf;Integrated Security = True";
        //SqlConnection connectionString = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["New"] != null)
                {
                    Label_welcome.Text += Session["New"].ToString();
                    PopulateGridview();
                }
                else
                    Response.Redirect("Login.aspx");
            }

        }

        protected void Button_Logout_Click(object sender, EventArgs e)
        {
            Session["New"] = null;
            Response.Redirect("Login.aspx");
        }


        void PopulateGridview()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM UserData ", sqlCon);
                sqlDa.Fill(dtbl);
                if (dtbl.Rows.Count > 0)
                {
                    GridViewUser.DataSource = dtbl;
                    GridViewUser.DataBind();
                }
                else
                {
                    dtbl.Rows.Add(dtbl.NewRow());
                    GridViewUser.DataSource = dtbl;
                    GridViewUser.DataBind();
                    GridViewUser.Rows[0].Cells.Clear();
                    GridViewUser.Rows[0].Cells.Add(new TableCell());
                    GridViewUser.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                    GridViewUser.Rows[0].Cells[0].Text = "No Data Found ..!";
                    GridViewUser.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                }
            }

        }
        protected void gvUser_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewUser.EditIndex = e.NewEditIndex;

        }

        protected void gvUser_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewUser.EditIndex = -1;
            PopulateGridview();
        }

        protected void gvUser_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    var user = (GridViewUser.Rows[e.RowIndex].FindControl("txtUserName") as TextBox).Text.Trim();
                    var email = (GridViewUser.Rows[e.RowIndex].FindControl("txtEmail") as TextBox).Text.Trim();
                    string query = "UPDATE USERDATA SET UserName=@UserName , Email=@Email WHERE ID = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", GridViewUser.DataKeys[e.RowIndex].Value);
                    sqlCmd.Parameters.AddWithValue("@UserName", user);
                    sqlCmd.Parameters.AddWithValue("@Email", email);
                    var res = sqlCmd.ExecuteNonQuery();
                    GridViewUser.EditIndex = -1;
                    PopulateGridview();
                    lblSuccessMsg.Text = "Selected Record Updated";
                    lblErrorMsg.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }

        protected void gvUser_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM USERDATA WHERE ID = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", GridViewUser.DataKeys[e.RowIndex].Value);
                    sqlCmd.ExecuteNonQuery();
                    PopulateGridview();
                    lblSuccessMsg.Text = "Selected Record Deleted";
                    lblErrorMsg.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }

    }
}