using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblErrorMessage.Visible = false;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        using (SqlConnection sqlCon = new SqlConnection("Server=NS;Database=Movie Corporation;Trusted_Connection=True;"))
        {
            sqlCon.Open();
            string query = "SELECT COUNT(1) FROM Membership WHERE username=@username AND password=@password";
            SqlCommand sqlCmd = new SqlCommand(query,sqlCon);
            sqlCmd.Parameters.AddWithValue("@username",TextBox1.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@password",TextBox2.Text.Trim());
            int count = Convert.ToInt32(sqlCmd.ExecuteScalar());
            if(count == 1)
            {
                Session["username"] = TextBox1.Text.Trim();

                if(TextBox1.Text == "nsbildiren")
                {
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    Response.Redirect("Dashboard.aspx");
                }
                
            }
            else
            {
                lblErrorMessage.Visible = true;
            }
        }
    }

    protected void ButtonRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }
}