using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationLibrary_v2
{
    public partial class a_book_i : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void getBtn_Click(object sender, EventArgs e)
        {
            getNames();
        }

        protected void issueBtn_Click(object sender, EventArgs e)
        {
            if (checkifuserhave() )
            {
                Response.Write("<script>alert('Member already have this book.Can't get more than one.')</script>");
            }
            else
            {
                if (CheckUser() && checkBook())
                {
                    issueBook();
                }
                else
                {
                    Response.Write("<script>alert('Invalid user or member ID's')</script>");
                }
            }
        }

        protected void returnBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (checkifuserhave())
                {
                    returnBook();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        bool bookcheck;
        bool checkBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(conn);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM book_master_tbl WHERE book_id = @book_id AND current_stock > 0 ;", con);
                cmd.Parameters.AddWithValue("@book_id", bookidTxt.Text.Trim());
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    bookcheck = true;
                }
                else
                {
                    bookcheck = false;
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
            return bookcheck;
        }
        bool usrcheck;
        bool CheckUser()
        {
            try
            {
                SqlConnection con = new SqlConnection(conn);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM member_master_tbl WHERE member_id = @member_id ;", con);
                cmd.Parameters.AddWithValue("@member_id", memberidTxt.Text.Trim());
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    usrcheck = true;
                }
                else
                {
                    usrcheck = false;
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
            return usrcheck;
        }
        void getNames()
        {
            try
            {

                SqlConnection con = new SqlConnection(conn);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT book_name FROM book_master_tbl WHERE book_id = @book_id;", con);
                cmd.Parameters.AddWithValue("@book_id", bookidTxt.Text.Trim());
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    booknameTxt.Text = dt.Rows[0]["book_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Book ID')</script>");
                }

                cmd = new SqlCommand("SELECT full_name FROM member_master_tbl WHERE member_id = @member_id;", con);
                cmd.Parameters.AddWithValue("@member_id", memberidTxt.Text.Trim());
                adapter = new SqlDataAdapter(cmd);
                dt = new DataTable();
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    membernameTxt.Text = dt.Rows[0]["full_name"].ToString();
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
        void issueBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(conn);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO book_issue_tbl (member_id,member_name,book_id,book_name,issue_date,due_date) " +
                    "VALUES (@member_id,@member_name,@book_id,@book_name,@issue_date,@due_date);", con);
                cmd.Parameters.AddWithValue("@member_id", memberidTxt.Text.Trim());
                cmd.Parameters.AddWithValue("@member_name", membernameTxt.Text.Trim());
                cmd.Parameters.AddWithValue("@book_id", bookidTxt.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", booknameTxt.Text.Trim());
                cmd.Parameters.AddWithValue("@issue_date", startdateTxt.Text.Trim());
                cmd.Parameters.AddWithValue("@due_date", enddateTxt.Text.Trim());
                cmd.ExecuteNonQuery();

                cmd = new SqlCommand("UPDATE book_master_tbl SET current_stock = current_stock-1 WHERE book_id=@book_id ;", con);
                cmd.Parameters.AddWithValue("@book_id", bookidTxt.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book issued succesfully.')</script>");
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        void returnBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(conn);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM book_issue_tbl WHERE member_id = @member_id AND book_id = @book_id ;", con);
                cmd.Parameters.AddWithValue("@member_id", memberidTxt.Text.Trim());
                cmd.Parameters.AddWithValue("@book_id", bookidTxt.Text.Trim());
                cmd.ExecuteNonQuery();

                cmd = new SqlCommand("UPDATE book_master_tbl SET current_stock = current_stock+1 WHERE book_id=@book_id ;", con);
                cmd.Parameters.AddWithValue("@book_id", bookidTxt.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Returned')</script>");
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        bool checkonhand;
        bool checkifuserhave()
        {
            try
            {
                SqlConnection con = new SqlConnection(conn);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM book_issue_tbl WHERE member_id = @member_id AND book_id = @book_id;", con);
                cmd.Parameters.AddWithValue("@member_id", memberidTxt.Text.Trim());
                cmd.Parameters.AddWithValue("@book_id", bookidTxt.Text.Trim());
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    checkonhand = true;
                }
                else
                {
                    checkonhand = false;
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
            return checkonhand;
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today = DateTime.Today;
                    if (today > dt) {
                        e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
    }
}