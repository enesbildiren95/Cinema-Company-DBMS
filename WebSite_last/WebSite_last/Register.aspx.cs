using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Register : System.Web.UI.Page
{
    SqlCommand cmd = new SqlCommand();
    SqlConnection con = new SqlConnection();

    protected void Page_Load(object sender, EventArgs e)
    {
        con.ConnectionString = "Server=NS;Database=Movie Corporation;Trusted_Connection=True;";
        con.Open();
    }

    protected void ButtonRegister_Click(object sender, EventArgs e)
    {
        int department = 1;
        SqlCommand cmd = new SqlCommand("insert into Membership"+"(Username,Password,Department) values (@username,@password,@department)",con);
        cmd.Parameters.AddWithValue("@username",TextBox1.Text);
        cmd.Parameters.AddWithValue("@password", TextBox2.Text);
        cmd.Parameters.AddWithValue("@department", department);
        cmd.ExecuteNonQuery();
        Label1.Text = "Registration is Completed";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
}