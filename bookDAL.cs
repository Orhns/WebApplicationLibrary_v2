using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Configuration;

namespace WebApplicationLibrary_v2
{
    public class bookDAL
    {
        string conn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        public book GetBook(int bookID)
        {
            SqlConnection con = new SqlConnection(conn);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            book booky = null;
            SqlCommand command = new SqlCommand("SELECT * FROM book_master_tbl WHERE book_id = @book_id;", con);
            SqlParameterCollection sp = command.Parameters;
            sp.AddWithValue("book_id", bookID);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                booky = new book();
                booky.book_id = bookID;
                booky.book_name = dt.Rows[0]["book_name"].ToString();
                booky.genre = dt.Rows[0]["genre"].ToString();
                booky.author_name = dt.Rows[0]["author_name"].ToString();
                booky.publisher_name = dt.Rows[0]["publisher_name"].ToString();
                booky.publish_date = dt.Rows[0]["publish_date"].ToString();
                booky.language = dt.Rows[0]["language"].ToString();
                booky.edition = dt.Rows[0]["edition"].ToString();
                booky.no_of_pages = dt.Rows[0]["no_of_pages"].ToString();
                booky.book_description = dt.Rows[0]["book_description"].ToString();
                booky.actual_stock = dt.Rows[0]["actual_stock"].ToString();
                booky.current_stock = dt.Rows[0]["current_stock"].ToString();
                booky.book_img_link = dt.Rows[0]["book_img_link"].ToString();
            }
            return booky;
        }
    }
}