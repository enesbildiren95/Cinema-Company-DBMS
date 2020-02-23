using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using FacadeLayer;



public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = null;
    SqlCommand cmd = null;
    SqlDataReader dr = null;
    string SqlCmd = string.Empty;

    
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection("Server=NS;Database=Movie Corporation;Trusted_Connection=True;");
        con.Open();
        lblUser.Text = "Username : " + Session["username"];
    }
   

    protected void Button1_Click(object sender, EventArgs e)
    {
        FMovie f = new FMovie();
        f.insertMovie(TextBox2.Text,TextBox3.Text,Int32.Parse(TextBox4.Text),TextBox5.Text,Int32.Parse(TextBox6.Text),Int32.Parse(TextBox7.Text));
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        FMovie f = new FMovie();
        f.deleteMovie(Int32.Parse(TextBox10.Text));
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        FMovie f = new FMovie();
        f.updateMovie(Int32.Parse(TextBox11.Text), TextBox12.Text, TextBox13.Text, Int32.Parse(TextBox14.Text), TextBox15.Text, Int32.Parse(TextBox16.Text), Int32.Parse(TextBox17.Text));
    }



    protected void Button4_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }
}