using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Runtime.Remoting.Messaging;

namespace WebApplicationLibrary_v2
{
    public partial class a_usrmng : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void getbutton_Click(object sender, EventArgs e)
        {
            getMember();
        }

        void getMember()
        {
            try
            {
                SqlConnection con = new SqlConnection(conn);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM member_master_tbl WHERE member_id = @mID;", con);
                cmd.Parameters.AddWithValue("@mID", memberid.Text.Trim());
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        memberid.Text = reader.GetString(0);
                        nametxt.Text = reader.GetString(2);
                        birthtxt.Text = reader.GetString(3);
                        numbertxt.Text = reader.GetString(4);
                        emailtxt.Text = reader.GetString(5);
                        statetxt.Text = reader.GetString(6);
                        citytxt.Text = reader.GetString(7);
                        pincodetxt.Text = reader.GetString(8);
                        addresstxt.Text = reader.GetString(9);
                        
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid Member ID')</script>");
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected void activatebutton_Click(object sender, EventArgs e)
        {
            updateMemberStatus("active");
        }

        protected void pendingbutton_Click(object sender, EventArgs e)
        {
            updateMemberStatus("pending");
        }

        protected void deactivatebutton_Click(object sender, EventArgs e)
        {
            updateMemberStatus("deactive");
        }

        void updateMemberStatus(string status)
        {
            try
            {
                SqlConnection con = new SqlConnection(conn);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE member_master_tbl SET account_status = @status WHERE member_id = @mID",con);
                cmd.Parameters.AddWithValue("@mID", memberid.Text.Trim());
                cmd.Parameters.AddWithValue ("@status", status);

                cmd.ExecuteNonQuery();
                con.Close( );
                Response.Write("<script>alert('Updated Successfully.')</script>");
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }

        }

        protected void deletebutton_Click(object sender, EventArgs e)
        {
            if (chechAutID() == false)
            {
                Response.Write("<script>alert('Unknown Member ID')</script>");
            }
            else
            {
                deleteUser();
                Response.Write("<script>alert('Member deleted succesfully.')</script>");
                GridView1.DataBind();
                clearForm();
            }
            clearForm();
        }

        void deleteUser()
        {
            try
            {
                SqlConnection con = new SqlConnection(conn);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM member_master_tbl WHERE member_id = @mID;", con);
                cmd.Parameters.AddWithValue("@mID", memberid.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void clearForm()
        {
            memberid.Text = null;
            nametxt.Text = null;
            birthtxt.Text = null;
            numbertxt.Text = null;
            emailtxt.Text = null;
            statetxt.Text = null;
            citytxt.Text = null;
            pincodetxt.Text = null;
            addresstxt.Text = null;
            
        }
        bool idcheck;
        bool chechAutID()
        {
            try
            {
                SqlConnection con = new SqlConnection(conn);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM member_master_tbl WHERE member_id = @mID;", con);
                cmd.Parameters.AddWithValue("@mID", memberid.Text.Trim());
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    idcheck = true;
                }
                else
                {
                    idcheck = false;
                }
               con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
            return idcheck;
        }
    }
}