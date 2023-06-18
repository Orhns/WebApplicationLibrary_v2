using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;


namespace WebApplicationLibrary_v2
{
    public partial class a_book_inventory : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_books;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getAuthorPublisherValues();
            }
            //GridView1.DataBind();
        }

        protected void addBtn_Click(object sender, EventArgs e)
        {
            addNewBook();
        }

        protected void updateBtn_Click(object sender, EventArgs e)
        {
            updateBookByID();
        }

        protected void deleteBtn_Click(object sender, EventArgs e)
        {
            deleteBookByID();
            GridView1.DataBind();
        }

        void getAuthorPublisherValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(conn);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT DISTINCT author_name FROM book_master_tbl ;", con);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                DropDownAuthors.DataSource = dt;
                DropDownAuthors.DataValueField = "author_name";
                DropDownAuthors.DataBind();


                cmd = new SqlCommand("SELECT DISTINCT publisher_name FROM book_master_tbl ;", con);
                adapter = new SqlDataAdapter(cmd);
                dt = new DataTable();
                adapter.Fill(dt);
                DropDownPublishers.DataSource = dt;
                DropDownPublishers.DataValueField = "publisher_name";
                DropDownPublishers.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        void getBookByName()
        {
            try
            {
                SqlConnection con = new SqlConnection(conn);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM book_master_tbl WHERE book_name LIKE @book_name ;", con);
                cmd.Parameters.AddWithValue("@book_name", "%" + bookNametxt.Text.Trim() + "%");
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    bookIDtxt.Text = dt.Rows[0]["book_id"].ToString();
                    bookNametxt.Text = dt.Rows[0]["book_name"].ToString();
                    publishDatetxt.Text = dt.Rows[0]["publish_date"].ToString();
                    editiontxt.Text = dt.Rows[0]["edition"].ToString();
                    editiontxt.Text = dt.Rows[0]["edition"].ToString();
                    pagestxt.Text = dt.Rows[0]["no_of_pages"].ToString().Trim();
                    actualstocktxt.Text = dt.Rows[0]["actual_stock"].ToString().Trim();
                    currentstocktxt.Text = dt.Rows[0]["current_stock"].ToString().Trim();
                    description.Text = dt.Rows[0]["book_description"].ToString();
                    issuedbookstxt.Text = "" + (Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString()) -
                        Convert.ToInt32(dt.Rows[0]["current_stock"].ToString()));


                    DropDownLanguage.SelectedValue = dt.Rows[0]["language"].ToString().Trim();
                    DropDownPublishers.SelectedValue = dt.Rows[0]["publisher_name"].ToString().Trim();
                    DropDownAuthors.SelectedValue = dt.Rows[0]["author_name"].ToString().Trim();

                    ListBoxGenre.ClearSelection();
                    string[] genre = dt.Rows[0]["genre"].ToString().Trim().Split(',');
                    for (int i = 0; i < genre.Length; i++)
                    {
                        for (int x = 0; x < ListBoxGenre.Items.Count; x++)
                        {
                            if (ListBoxGenre.Items[x].ToString() == genre[i])
                            {
                                ListBoxGenre.Items[x].Selected = true;
                            }
                        }
                    }

                    global_actual_stock = Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString().Trim());
                    global_current_stock = Convert.ToInt32(dt.Rows[0]["current_stock"].ToString().Trim());
                    global_issued_books = global_actual_stock - global_current_stock;
                    global_filepath = dt.Rows[0]["book_img_link"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Book ID')</script>");
                }



            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        void addNewBook()
        {
            try
            {
                //getting values from gende dropdown
                string genres = "";
                foreach (int i in ListBoxGenre.GetSelectedIndices())
                {
                    genres = genres + ListBoxGenre.Items[i] + ",";
                }
                genres = genres.Remove(genres.Length - 1);
                //adjusting image file location
                string filepath = "~/book_inventory/books1.png";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                filepath = "~/book_inventory/" + filename;

                SqlConnection con = new SqlConnection(conn);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO book_master_tbl (book_name,genre,author_name,publisher_name," +
                    "publish_date,language,edition,no_of_pages,book_description,actual_stock,current_stock,book_img_link)" +
                    " VALUES (@bNAME,@genre,@aName,@pName,@pDate,@language,@edition,@noPages,@bDesc,@aStock,@cStock,@imgLink)", con);
                cmd.Parameters.AddWithValue("@bNAME", bookNametxt.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", genres);
                cmd.Parameters.AddWithValue("@aName", DropDownAuthors.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@pName", DropDownPublishers.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@pDate", publishDatetxt.Text.Trim());
                cmd.Parameters.AddWithValue("@language", DropDownLanguage.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edition", editiontxt.Text.Trim());
                cmd.Parameters.AddWithValue("@noPages", pagestxt.Text.Trim());
                cmd.Parameters.AddWithValue("@bDesc", description.Text.Trim());
                cmd.Parameters.AddWithValue("@aStock", actualstocktxt.Text.Trim());
                cmd.Parameters.AddWithValue("@cStock", actualstocktxt.Text.Trim());
                cmd.Parameters.AddWithValue("@imgLink", filepath);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book added.')</script>");
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        void updateBookByID()
        {

            try
            {
                int actual_stock = Convert.ToInt32(actualstocktxt.Text.Trim());
                int current_stock = Convert.ToInt32(currentstocktxt.Text.Trim());

                if (global_actual_stock == actual_stock)
                {

                }
                else
                {
                    if (actual_stock < global_issued_books)
                    {
                        Response.Write("<script>alert('Actual stock cannot be less than the issued books')</script>");
                        return;
                    }
                    else
                    {
                        current_stock = actual_stock - global_issued_books;
                        currentstocktxt.Text = "" + current_stock;
                    }
                }


                string genres = "";
                foreach (int i in ListBoxGenre.GetSelectedIndices())
                {
                    genres = genres + ListBoxGenre.Items[i] + ",";
                }
                genres = genres.Remove(genres.Length - 1);

                string filepath = "~/book_inventory/books1";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                if (filename == "" || filename == null)
                {
                    filepath = global_filepath;
                }
                else
                {
                    FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                    filepath = "~/book_inventory/" + filename;
                }



                SqlConnection con = new SqlConnection(conn);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE book_master_tbl SET book_name=@book_name,genre=@genre,author_name=@author_name" +
                    ",publisher_name=@publisher_name,publish_date=@publish_date,language=@language,edition=@edition "+
                    ",no_of_pages=@no_of_pages,book_description=@book_description,actual_stock=@actual_stock,current_stock=@current_stock" +
                    ",book_img_link=@book_img_link WHERE book_id = @book_id;", con);
                cmd.Parameters.AddWithValue("@book_id", bookIDtxt.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", bookNametxt.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", genres);
                cmd.Parameters.AddWithValue("@author_name", DropDownAuthors.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publisher_name", DropDownPublishers.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publish_date", publishDatetxt.Text.Trim());
                cmd.Parameters.AddWithValue("@language", DropDownLanguage.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edition", editiontxt.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_pages", pagestxt.Text.Trim());
                cmd.Parameters.AddWithValue("@book_description", description.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", actual_stock.ToString());
                cmd.Parameters.AddWithValue("@current_stock", current_stock.ToString());
                cmd.Parameters.AddWithValue("@book_img_link", filepath);

                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.DataBind();
                Response.Write("<script>alert('Book updated succesfully.')</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }


        }
        void deleteBookByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(conn);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM book_master_tbl WHERE book_id = @bID;", con);
                cmd.Parameters.AddWithValue("@bID", bookIDtxt.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
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

            string msg = "You selected " + row.Cells[1].Text + ".";

            Response.Write("<script>alert('" + msg + "')</script>");
        }

        protected void addPublisherBtn_Click(object sender, EventArgs e)
        {
            DropDownPublishers.Items.Add(addPublisherTxt.Text);
            DropDownPublishers.SelectedIndex = DropDownPublishers.Items.Count - 1;
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            // Get the currently selected row. Because the SelectedIndexChanging event
            // occurs before the select operation in the GridView control, the
            // SelectedRow property cannot be used. Instead, use the Rows collection
            // and the NewSelectedIndex property of the e argument passed to this 
            // event handler.
            GridViewRow row = GridView1.Rows[e.NewSelectedIndex];

            // You can cancel the select operation by using the Cancel
            // property. For this example, if the user selects a customer with 
            // the ID "ANATR", the select operation is canceled and an error message
            // is displayed.
            if (row.Cells[1].Text == "ANATR")
            {
                e.Cancel = true;
                string msg2 = "You cannot select " + row.Cells[2].Text + ".";

                Response.Write("<script>alert('" + msg2 + "')</script>");
            }

        }

        protected void AddAuthorBtn_Click(object sender, EventArgs e)
        {
            DropDownAuthors.Items.Add(addAuthorTxt.Text);
            DropDownAuthors.SelectedIndex = DropDownAuthors.Items.Count - 1;
        }

        protected void ButtonGet_Click(object sender, EventArgs e)
        {
            getBookByName();
        }

    }
}