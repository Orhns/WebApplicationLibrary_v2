using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationLibrary_v2
{
    public partial class userlogin : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {      
            checkUserLogin();
        }
        bool chckUsr;
        bool checkUserLogin()
        {
            try
            {
                SqlConnection con = new SqlConnection(conn);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM member_master_tbl WHERE email = @email AND password = @mpass ;", con);
                cmd.Parameters.AddWithValue("@email", email.Text.Trim());
                cmd.Parameters.AddWithValue("@mpass", mpassword.Text.Trim());
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        Response.Write("<script>alert('logged in successfully');</script>");
                        Session["memberid"] = reader.GetValue(0);
                        Session["fullname"] = reader.GetValue(2).ToString();
                        Session["role"] = "user";
                        Session["status"] = reader.GetValue(10).ToString();
                    }
                    chckUsr = true;
                    Response.Redirect("home.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid e-mail or password.');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
            return chckUsr;
        }

    }
}