using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace WebApplicationLibrary_v2
{
    public partial class a_publisher_mng : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addbutton_Click(object sender, EventArgs e)
        {
            if (chechPublisherID())
            {
                Response.Write("<script>alert('Publisher ID is already taken')</script>");
            }
            else
            {
                addNewPublisher();
            }
            clearForm();
            GridView1.DataBind();
        }

        protected void updatebutton_Click(object sender, EventArgs e)
        {
            if (chechPublisherID() == false)
            {
                Response.Write("<script>alert('Please enter correct Publisher ID')</script>");
            }
            else
            {
                updatePublisher();
            }
            clearForm();
            GridView1.DataBind();
        }

        protected void deletebutton_Click(object sender, EventArgs e)
        {
            if (chechPublisherID() == false)
            {
                Response.Write("<script>alert('Please enter correct Publisher ID')</script>");
            }
            else
            {
                deletePublisher();
            }
            clearForm();
            GridView1.DataBind();
        }

        protected void getbutton_Click(object sender, EventArgs e)
        {
            getPublisher();
        }

        bool checkidhelper;
        bool chechPublisherID()
        {
            try
            {
                SqlConnection con = new SqlConnection(conn);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM publisher_master_tbl WHERE publisher_id = @pbID ;", con);
                cmd.Parameters.AddWithValue("@pbID",publisherid.Text.Trim());
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    checkidhelper = true;
                }
                else
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

        void addNewPublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(conn);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO publisher_master_tbl (publisher_id,publisher_name) VALUES (@pbID,@pbName)", con);
                cmd.Parameters.AddWithValue("@pbID", publisherid.Text.Trim());
                cmd.Parameters.AddWithValue("@pbName", publishername.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Publisher added succesfully.')</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void updatePublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(conn);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE publisher_master_tbl SET publisher_name = @pbName WHERE publisher_id = @pbID;", con);
                cmd.Parameters.AddWithValue("@pbID", publisherid.Text.Trim());
                cmd.Parameters.AddWithValue("@pbName", publishername.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Publisher name updated succesfully.')</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void deletePublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(conn);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM publisher_master_tbl WHERE publisher_id = @pbID;", con);
                cmd.Parameters.AddWithValue("@pbID", publisherid.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Publisher deleted succesfully.')</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void getPublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(conn);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM publisher_master_tbl WHERE publisher_id = @publisher_id;", con);
                cmd.Parameters.AddWithValue("@publisher_id", publisherid.Text.Trim());
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        publishername.Text = reader.GetString(1);
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid publisher ID')</script>");
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }

        }

        void clearForm()
        {
            publisherid.Text = null;
            publishername.Text = null;
        }
    }
}