using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Dashboard : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Server=NS;Database=Movie Corporation;Trusted_Connection=True;");
    SqlDataAdapter da;
    DataTable dt;


    protected void Page_Load(object sender, EventArgs e)
    {
        lblUserDetails.Text = "Username : " + Session["username"];
    }

    protected void butonLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        da = new SqlDataAdapter("select * from Movie;", con);
        dt = new DataTable();
        da.Fill(dt);

        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
}