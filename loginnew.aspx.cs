using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace agriproject
{
    public partial class loginnew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection();
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["cnstr1"].ConnectionString;
                conn.Open();
                string strsql;
                strsql = "select * from regagri where txtname ='" + txtusername.Text + "' and txtpasssword = '" + txtpass.Text + "' and ddlpost = '" + ddlpost.Text + "'and approved ='1'";
                SqlCommand cmd = new SqlCommand(strsql, conn);
               
                SqlDataReader dr = cmd.ExecuteReader();


                if (dr.Read())
                {
                  

                    if (ddlpost.SelectedItem.ToString() == "User")
                    {
                        Session["userid"] = dr[0];

                        Response.Redirect("User_Main_Page.aspx");
                    }
                    if (ddlpost.SelectedItem.ToString() == "Shop Owner")
                    {
                        Session["dealerid"] = dr[0];
                        Response.Redirect("Dealer_MainPage.aspx");
                    }

                    if (ddlpost.SelectedItem.ToString() == "Professional Adviser")
                    {
                        Session["Professionalid"] = dr[0];
                        Response.Redirect("videoadd.aspx");
                    }

                }


                else
                {
                    lblerror.Text = "Login Failed!! Or Admin Approval pending";
                    txtpass.Text = "";
                    txtusername.Text = "";
                    txtusername.Focus();
                }

            }

            catch (Exception ex)
            {
                lblerror.Text = ex.Message;
            }
        }

        protected void btnclear_Click(object sender, EventArgs e)
        {
            txtpass.Text = "";
            txtusername.Text = "";
            txtusername.Focus();
        }
    }
}