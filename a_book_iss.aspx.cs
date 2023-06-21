using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace WebApplicationLibrary_v2
{
    public partial class a_book_i : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        userDAL udal = new userDAL();
        user user;
        bookDAL bdal = new bookDAL();
        book book;
        protected void Page_Load(object sender, EventArgs e)
        {
            createChartTable();
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
                SqlCommand cmd = new SqlCommand("UPDATE book_issue_tbl SET status = 'Returned' WHERE transaction_id = @transaction_id;", con);
                int tid = int.Parse(Session["Tselection"].ToString());
                cmd.Parameters.AddWithValue("@transaction_id", tid);
                cmd.ExecuteNonQuery();

                cmd = new SqlCommand("UPDATE book_master_tbl SET current_stock = current_stock+1 WHERE book_id=@book_id ;", con);
                int bid = int.Parse(Session["Bselection"].ToString());
                cmd.Parameters.AddWithValue("@book_id", bid);
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

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    string status = e.Row.Cells[8].Text;
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[7].Text);
                    DateTime today = DateTime.Today;
                    if (today > dt && status == "Not Returned")
                    {
                        e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                    }
                    else if (status == "Returned")
                    {
                        e.Row.BackColor = System.Drawing.Color.MediumSeaGreen;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get the currently selected row using the SelectedRow property.
            GridViewRow row = GridView1.SelectedRow;

            // Display the first name from the selected row.
            // In this example, the third column (index 2) contains
            // the first name.

            int sTransactionID = int.Parse(row.Cells[1].Text.ToString());
            int sbookID = int.Parse(row.Cells[4].Text.ToString());
            Session["Bselection"] = sbookID;
            Session["Tselection"] = sTransactionID;
            string msg = "Selected transaction : " + row.Cells[1].Text + ".";
            Response.Write("<script>alert('" + msg + "')</script>");
            returnBookBtn.Enabled = true;
        }
        protected void returnBookBtn_Click(object sender, EventArgs e)
        {
            try
            {
                returnBook();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void createChartTable()
        {
            SqlConnection con = new SqlConnection(conn);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("SELECT book_name, COUNT(*) AS readed FROM book_issue_tbl GROUP BY book_name", con);
            Series series = Chart1.Series["Series1"];
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                series.Points.AddXY(rdr["book_name"].ToString(), rdr["readed"]);
            }
        }
    }
}