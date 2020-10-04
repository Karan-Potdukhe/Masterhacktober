using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace agriproject
{
    public partial class reginew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       

       

        protected void ddlpost_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlpost.SelectedItem.ToString() == "User")
            {
                ddlarea.Visible = false;
                Label10.Visible = false;
            }
            if (ddlpost.SelectedItem.ToString() == "Shop Owner")
            {
                ddlarea.Visible = true;
                Label10.Visible = true;
            }
            if (ddlpost.SelectedItem.ToString() == "Professional Adviser")
            {
                ddlarea.Visible = false;
                Label10.Visible = false;
            }
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            txtage.Text = "";
            txtcnfrmpassword.Text = "";
            txtmailid.Text = "";
            txtname.Text = "";
            txtsans.Text = "";
            txtname.Focus();
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            try
            {



                //here front end is actually getting connected with backend in background
                string qry;
                

                if (ddlpost.SelectedItem.ToString() == "User")
                {
                    qry = "insert into regagri values ('" + txtname.Text + "','" + txtage.Text + "','" + ddlgender.Text + "','" + txtpasssword.Text + "','" + txtmailid.Text + "','" + ddlpost.Text + "','" + ddlsque.Text + "','" + txtsans.Text + "','0', '0')";
                    Global_c.Runquery(qry);
                }
                if (ddlpost.SelectedItem.ToString() == "Shop Owner")
                {
                    qry = "insert into regagri values ('" + txtname.Text + "','" + txtage.Text + "','" + ddlgender.Text + "','" + txtpasssword.Text + "','" + txtmailid.Text + "','" + ddlpost.Text + "','" + ddlsque.Text + "','" + txtsans.Text + "','" + ddlarea.Text + "', '0')";
                    Global_c.Runquery(qry);
                }
                if (ddlpost.SelectedItem.ToString() == "Professional Adviser")
                {
                    qry = "insert into regagri values ('" + txtname.Text + "','" + txtage.Text + "','" + ddlgender.Text + "','" + txtpasssword.Text + "','" + txtmailid.Text + "','" + ddlpost.Text + "','" + ddlsque.Text + "','" + txtsans.Text + "','0', '0')";
                    Global_c.Runquery(qry);
                }
               

                txtname.Text = "";
                txtage.Text = "";
                txtpasssword.Text = "";
                txtmailid.Text = "";

                txtsans.Text = "";



                Response.Redirect("Waiting_Page.aspx");

            }



            catch (Exception ex)
            {
                lblerror.Text = ex.Message;
            }
        }
    }
}