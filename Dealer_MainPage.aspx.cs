using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace agriproject
{
    public partial class Dealer_Reg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["dealerid"] == null)
            {
                Response.Redirect("loginnew.aspx");
            }

            string Task_Id;
            
            Task_Id = Session["dealerid"].ToString();

            if (!Page.IsPostBack)
            {
                refreshdata();
            }  
        }




        

       
        protected void btnaddproduct_Click(object sender, EventArgs e)
        {
            try
            {

                string qry1 = "Select *  from Productdata where productname ='" + txtproductname.Text + "'";
                if (ExecuteQuery(qry1) == false)
                {
                    
                    if (txtproductname.Text!="" && txtproductqty.Text!="")
                    {
                        
                        string str;
                        str = "Insert into Productdata values ('" + Session["dealerid"].ToString() + "','" + txtproductname.Text + "','" + txtproductqty.Text + "')";

                        Global_c.Runquery(str);
                        txtproductname.Text = "";
                        txtproductqty.Text = "";
                        txtproductname.Focus();

                    }
                    else
                    {
                        Response.Write("<script language=\"javascript\">alert(\"Please Enter Product Name!!\");</Script>");
                    }

                }
                else
                {
                    Response.Write("<script language=\"javascript\">alert(\"Please product Quntity!\");</Script>");
                }

                refreshdata();
               
            }
            catch (Exception ex)
            {
                lblerror.Text = ex.Message;
            }
        }
              
      
        public bool ExecuteQuery(string qry)
        {

            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["cnstr1"].ConnectionString;
            conn.Open();

            // strsql = "select * from login1 where ActNo = '" + actno + "' and PinNo = '" + pinno + "'";
            SqlCommand cmd = new SqlCommand(qry, conn);
            SqlDataReader dr = cmd.ExecuteReader();
            bool ans;
            if (dr.Read())
            {
                ans = true;
                conn.Close();
                return ans;
            }
            else
            {
                ans = false;
                conn.Close();
                return ans;
            }

        }

        public DataSet Fetchview(string qry)
        {
            SqlConnection conn = new SqlConnection();
            //  string path = HttpContext.Current.Server.MapPath("~/Data/SnehaData2.mdf");
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["cnstr1"].ConnectionString;
            conn.Open();
            //for todays remainder 

            SqlCommand cmd = new SqlCommand(qry, conn);
            SqlDataAdapter da = new SqlDataAdapter(qry, conn);
            DataSet ds = new DataSet();
            da.Fill(ds, "dt");
            return ds;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow gvrow in GrvShowDetails.Rows)
            {

                CheckBox chck = gvrow.FindControl("CheckBox1") as CheckBox;
                if (chck.Checked)
                {
                    var Label = gvrow.FindControl("Label1") as Label;
                    string qry2 = "delete from Productdata where Idproduct= '" + Label.Text + "'";
                   // SqlCommand cmd = new SqlCommand(qry2, con);
                    //cmd.Parameters.AddWithValue("Idproduct", int.Parse(Label.Text));
                    //con.Open();
                    //int id = cmd.ExecuteNonQuery();
                    //con.Close();
                    //refreshdata();
                                      
                    Global_c.Runquery(qry2);


                    refreshdata();
                   
                }
            }        
        }


        public void refreshdata()
        {
            string qry;
            qry = "Select *  from Productdata where dealerid ='" + Session["dealerid"].ToString() + "'";
            DataSet objds = Fetchview(qry);
            GrvShowDetails.DataSource = objds.Tables["dt"];
            GrvShowDetails.DataBind();

        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("loginnew.aspx");
        } 

     
       

       
    }
}