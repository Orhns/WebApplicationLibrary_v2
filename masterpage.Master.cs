using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationLibrary_v2
{
    public partial class masterpage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null)
                {
                    //user buttons
                    LinkButton1.Visible = true;  //user login button
                    LinkButton2.Visible = true;  // signup button
                    LinkButton3.Visible = false; //logout button
                    LinkButton7.Visible = false; //hello user button
                    //admin buttons
                    LinkButton6.Visible = true; //admin login button
                    LinkButton8.Visible = false; // book inventory button
                    LinkButton9.Visible = false; // book issuing button
                    LinkButton10.Visible = false; //member management button
                    LinkButton11.Visible = false; // author management button
                    LinkButton12.Visible = false; // publisher management button
                }
                else if (Session["role"].Equals("user"))
                {
                    //user buttons
                    LinkButton1.Visible = false;  //user login button
                    LinkButton2.Visible = false;  // signup button
                    LinkButton3.Visible = true; //logout button
                    LinkButton7.Visible = true; //hello user button
                    LinkButton7.Text = "Hello " + Session["fullname"].ToString();
                    //admin buttons
                    LinkButton6.Visible = false; //admin login button
                    LinkButton8.Visible = false; // book inventory button
                    LinkButton9.Visible = false; // book issuing button
                    LinkButton10.Visible = false; //member management button
                    LinkButton11.Visible = false; // author management button
                    LinkButton12.Visible = false; // publisher management button
                }
                else if (Session["role"].Equals("admin"))
                {
                    //user buttons
                    LinkButton1.Visible = false;  //user login button
                    LinkButton2.Visible = false;  // signup button
                    LinkButton3.Visible = true; //logout button
                    LinkButton7.Visible = true; //hello user button
                    LinkButton7.Text = "Hello Admin";
                    //admin buttons
                    LinkButton6.Visible = false; //admin login button
                    LinkButton8.Visible = true; // book inventory button
                    LinkButton9.Visible = true; // book issuing button
                    LinkButton10.Visible = true; //member management button
                    LinkButton11.Visible = true; // author management button
                    LinkButton12.Visible = true; // publisher management button
                }
            }
            catch (Exception ex)
            {

                throw;
            }

        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("a_author_mng.aspx");
        }

        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            Response.Redirect("a_publisher_mng.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("a_book_inventory.aspx");
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("a_book_iss.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("a_usrmng.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ulogin.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("usignup.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("vbooks.aspx");
        }
        //logout
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Session["memberid"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] = "";
            Response.Redirect("home.aspx");
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("uprofile.aspx");
        }
    }
}