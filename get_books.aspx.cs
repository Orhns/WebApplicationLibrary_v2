using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Runtime.Remoting.Messaging;

namespace WebApplicationLibrary_v2
{
    
    public partial class WebForm2 : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        userDAL udal = new userDAL();
        user user;
        bookDAL bdal = new bookDAL();
        book book;
        
        protected void Page_Load(object sender, EventArgs e)
        {
        
        }
        
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;

            // Display the first name from the selected row.
            // In this example, the third column (index 2) contains
            // the first name.

            int sBookID = int.Parse(row.Cells[1].Text.ToString());
            Session["bookid"] = sBookID;
            string msg = "You selected " + row.Cells[1].Text + ".";
            Response.Write("<script>alert('" + msg + "')</script>");
        }

        protected void getbookBtn_Click(object sender, EventArgs e)
        {
            int memberID = (int)Session["memberid"];
            int bookID = (int)Session["bookid"];
            issueBook(memberID, bookID);
            Session["bookid"] = null;
        }

        void issueBook(int userID, int bookID)
        {
            try
            {
                SqlConnection con = new SqlConnection(conn);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                user = udal.GetUser(userID);
                book = bdal.GetBook(bookID);

                DateTime thisDay = DateTime.Now;
                DateTime returnDate = thisDay.AddDays(14);

                SqlCommand cmd = new SqlCommand("INSERT INTO book_issue_tbl (member_id,member_name,book_id,book_name,issue_date,due_date,status) " +
                    "VALUES (@member_id,@member_name,@book_id,@book_name,@issue_date,@due_date,@status);", con);
                cmd.Parameters.AddWithValue("@member_id", user.member_id);
                cmd.Parameters.AddWithValue("@member_name", user.full_name);
                cmd.Parameters.AddWithValue("@book_id", book.book_id);
                cmd.Parameters.AddWithValue("@book_name", book.book_name);
                cmd.Parameters.AddWithValue("@issue_date", thisDay.ToString());
                cmd.Parameters.AddWithValue("@due_date", returnDate.ToString());
                cmd.Parameters.AddWithValue("@status", "Not Returned");
                cmd.ExecuteNonQuery();

                cmd = new SqlCommand("UPDATE book_master_tbl SET current_stock = current_stock-1 WHERE book_id=@book_id ;", con);
                cmd.Parameters.AddWithValue("@book_id", bookID);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('You get the book succesfully.')</script>");
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
    }
}