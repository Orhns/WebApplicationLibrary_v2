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
    public partial class signup : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //signup button
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkID())
            {
                Response.Write("<script>alert('userid is already taken')</script>");
            }
            else
            {
                signupNewUser();
            }   
        }

        bool checkidhelper;
        bool checkID()
        {  
            try
            {
                SqlConnection con = new SqlConnection(conn);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM member_master_tbl WHERE member_id =@mid", con);
                cmd.Parameters.AddWithValue("@mid", memberid.Text.Trim());
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows) {
                    checkidhelper = true;
                } else
                {
                    checkidhelper = false;
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
            return checkidhelper;
        }
        
        void signupNewUser()
        {
            try
            {
                SqlConnection con = new SqlConnection(conn);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO member_master_tbl" +
                    "([member_id],[password],[full_name],[birthdate],[contact_no],[email],[state]," +
                    "[city],[pincode],[full_address],[account_status]) VALUES " +
                    "(@member_id,@password,@full_name,@birthdate,@contact_no," +
                    "@email,@state,@city,@pincode,@full_address,@account_status)", con);

                cmd.Parameters.AddWithValue("@member_id", memberid.Text.Trim());
                cmd.Parameters.AddWithValue("@password", password.Text.Trim());
                cmd.Parameters.AddWithValue("@full_name", fullname.Text.Trim());
                cmd.Parameters.AddWithValue("@birthdate", birthdate.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", number.Text.Trim());
                cmd.Parameters.AddWithValue("@email", email.Text.Trim());
                cmd.Parameters.AddWithValue("@state", DropDownList1state.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", city.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", pincode.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", fulladdress.Text.Trim());
                cmd.Parameters.AddWithValue("@account_status", "pending");

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Singup Succesfull. Go back to user login to login.')</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
    }
}