using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationLibrary_v2
{
    public partial class uprofile : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            try
            {
                if (Session["memberid"].ToString() == "" || Session["memberid"] == null)
                {
                    Response.Write("<script>alert('Session Expired please login again.')</script>");
                    Response.Redirect("ulogin.aspx");
                }
                else
                {
                    getUserIssuedBooks();

                    if (!Page.IsPostBack)
                    {

                        getUserPersonalDetails();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void updateBtn_Click(object sender, EventArgs e)
        {
            if (Session["memberid"].ToString() == "" || Session["memberid"] == null)
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("ulogin.aspx");
            }
            else
            {
                updateUserPersonalDetails();
            }
        }

        void updateUserPersonalDetails()
        {
            string password = "";
            if (newpassTxt.Text.Trim() == "")
            {
                password = oldpassTxt.Text.Trim();
            }
            else
            {
                password = newpassTxt.Text.Trim();
            }
            try
            {
                SqlConnection con = new SqlConnection(conn);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("update member_master_tbl set full_name=@full_name, birthdate=@birthdate, contact_no=@contact_no, email=@email, state=@state, city=@city, pincode=@pincode, full_address=@full_address, password=@password WHERE member_id=@member_id ;", con);
                cmd.Parameters.AddWithValue("@member_id", Session["memberid"].ToString().Trim());
                cmd.Parameters.AddWithValue("@full_name", nameTxt.Text.Trim());
                cmd.Parameters.AddWithValue("@birthdate", birthdateTxt.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", numberTxt.Text.Trim());
                cmd.Parameters.AddWithValue("@email", emailTxt.Text.Trim());
                cmd.Parameters.AddWithValue("@state", stateDropDown.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", cityTxt.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", pincodeTxt.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", addressTxt.Text.Trim());
                cmd.Parameters.AddWithValue("@password", password);
                int result = cmd.ExecuteNonQuery();

                con.Close();
                if (result > 0)
                {

                    Response.Write("<script>alert('Your Details Updated Successfully');</script>");
                    getUserPersonalDetails();
                    getUserIssuedBooks();
                }
                else
                {
                    Response.Write("<script>alert('Invaid entry');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void getUserIssuedBooks()
        {
            try
            {
                SqlConnection con = new SqlConnection(conn);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM book_issue_tbl WHERE member_id =@member_id;", con);
                cmd.Parameters.AddWithValue("@member_id", Session["memberid"].ToString().Trim());
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        void getUserPersonalDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(conn);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl where member_id=@member_id", con);
                cmd.Parameters.AddWithValue("@member_id", Session["memberid"].ToString());
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                nameTxt.Text = dt.Rows[0]["full_name"].ToString();
                birthdateTxt.Text = dt.Rows[0]["birthdate"].ToString();
                numberTxt.Text = dt.Rows[0]["contact_no"].ToString();
                emailTxt.Text = dt.Rows[0]["email"].ToString();
                stateDropDown.SelectedValue = dt.Rows[0]["state"].ToString().Trim();
                cityTxt.Text = dt.Rows[0]["city"].ToString();
                pincodeTxt.Text = dt.Rows[0]["pincode"].ToString();
                addressTxt.Text = dt.Rows[0]["full_address"].ToString();
                userIDTxt.Text = dt.Rows[0]["member_id"].ToString();
                oldpassTxt.Text = dt.Rows[0]["password"].ToString();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today = DateTime.Today;
                    if (today > dt)
                    {
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