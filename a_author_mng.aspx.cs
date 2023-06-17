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
    public partial class a_author_mng : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addButton_Click(object sender, EventArgs e)
        {
            if (chechAutID())
            {
                Response.Write("<script>alert('Author ID is already taken')</script>");
            }
            else
            {
                addNewAuth();
            }
            clearForm();
            GridView1.DataBind();
        }

        protected void updateButton_Click(object sender, EventArgs e)
        {
            if (chechAutID() == false)
            {
                Response.Write("<script>alert('Please enter correct Author ID')</script>");
            }
            else
            {
                updateAuth();
            }
            clearForm();
            GridView1.DataBind();
        }

        protected void deleteButton_Click(object sender, EventArgs e)
        {
            if (chechAutID() == false)
            {
                Response.Write("<script>alert('Please enter correct Author ID')</script>");
            }
            else
            {
                deleteAuth();
            }
            clearForm();
            GridView1.DataBind();
        }

        protected void getButton_Click(object sender, EventArgs e)
        {
            getAuth();
        }
        bool checkidhelper;
        bool chechAutID()
        {
            try
            {
                SqlConnection con = new SqlConnection(conn);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM author_master_tbl WHERE author_id = @author_id;", con);
                cmd.Parameters.AddWithValue("@author_id", authorid.Text.Trim());
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

        void addNewAuth()
        {
            try
            {
                SqlConnection con = new SqlConnection(conn);
                if(con.State == ConnectionState.Closed)
                {
                    con.Open(); 
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO author_master_tbl (author_id,author_name) VALUES (@author_id,@author_name)", con);
                cmd.Parameters.AddWithValue("@author_id", authorid.Text.Trim());
                cmd.Parameters.AddWithValue("@author_name", authorName.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close() ;
                Response.Write("<script>alert('Author added succesfully.')</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void updateAuth()
        {
            try
            {
                SqlConnection con = new SqlConnection(conn);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE author_master_tbl SET author_name = @author_name WHERE author_id = @author_id;", con);
                cmd.Parameters.AddWithValue("@author_id", authorid.Text.Trim());
                cmd.Parameters.AddWithValue("@author_name", authorName.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author name updated succesfully.')</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void deleteAuth()
        {
            try
            {
                SqlConnection con = new SqlConnection(conn);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM author_master_tbl WHERE author_id = @author_id;", con);
                cmd.Parameters.AddWithValue("@author_id", authorid.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author deleted succesfully.')</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void getAuth()
        {
            try
            {
                SqlConnection con = new SqlConnection(conn);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM author_master_tbl WHERE author_id=@author_id;", con);
                cmd.Parameters.AddWithValue("@author_id", authorid.Text.Trim());
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable datatable = new DataTable();
                adapter.Fill(datatable);
                if (datatable.Rows.Count > 0)
                {
                    authorName.Text = datatable.Rows[0]["author_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid author ID')</script>");
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
            authorid.Text = null;
            authorName.Text = null;
        }
    }
}