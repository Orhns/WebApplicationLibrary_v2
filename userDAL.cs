using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebApplicationLibrary_v2
{
    public class userDAL
    {
        string conn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        public user GetUser(int userID)
        {
            SqlConnection con = new SqlConnection(conn);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            user usery = null;
            SqlCommand command = new SqlCommand("SELECT * FROM member_master_tbl WHERE member_id = @member_id;", con);
            SqlParameterCollection sp = command.Parameters;
            sp.AddWithValue("member_id", userID);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                usery = new user();
                usery.member_id = userID;
                usery.password = dt.Rows[0]["password"].ToString();
                usery.full_name = dt.Rows[0]["full_name"].ToString();
                usery.birthdate = dt.Rows[0]["birthdate"].ToString();
                usery.contact_no = dt.Rows[0]["contact_no"].ToString();
                usery.email = dt.Rows[0]["email"].ToString();
                usery.state = dt.Rows[0]["state"].ToString();
                usery.city = dt.Rows[0]["city"].ToString();
                usery.pincode = dt.Rows[0]["pincode"].ToString();
                usery.full_address = dt.Rows[0]["full_address"].ToString();
            }
            return usery;
            //The reader method above
            /*SqlDataReader rdr = command.ExecuteReader();
            while (rdr.Read())
            {
                usery = new user();
                usery.member_id = userID;
                usery.password = rdr.GetString(1);
                usery.full_name = rdr.GetString(2);
                usery.birthdate = rdr.GetString(3);
                usery.contact_no = rdr.GetString(4);
                usery.email = rdr.GetString(5);
                usery.state = rdr.GetString(6);
                usery.city = rdr.GetString(7);
                usery.pincode = rdr.GetString(8);
                usery.full_address = rdr.GetString(9);
            }*/

        }
    }
}