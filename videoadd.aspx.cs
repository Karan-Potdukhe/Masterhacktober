using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace agriproject
{
    public partial class videoadd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
               
                BindGrid();
            }
        }


        private void BindGrid()
        {

            string qry;
           // qry = "Select *  from Productdata where dealerid ='" + Session["dealerid"].ToString() + "'";
            qry = "Select * from videodata";

            DataSet objds = Fetchview(qry);
            GridView1.DataSource = objds.Tables["dt"];
            GridView1.DataBind();

         
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
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.PostedFile != null && txtname.Text!="")
            {
                try
                {
                    string FileName = txtname.Text+".mp4"; 
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("videodatabase/" + FileName));

                    string CS = ConfigurationManager.ConnectionStrings["cnstr1"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        string filepathvideo = "videodatabase/"+ FileName;
                        string str;
                        str = "Insert into videodata values ('" + FileName + "','" + filepathvideo + "')";

                        Global_c.Runquery(str);
                      
                        BindGrid();
                        lblMessage.Text = "Your file uploaded successfully";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        txtname.Text = "";
                    }
                }
                catch (Exception)
                {
                    lblMessage.Text = "Your file not uploaded";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    txtname.Text = "";
                }
            }
            else
            {
                lblMessage.Text = "Enter Proper Name and select Proepr File";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                txtname.Focus();
            }
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("loginnew.aspx");
        }

        protected void btndelet_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow gvrow in GridView1.Rows)
            {

                CheckBox chck = gvrow.FindControl("CheckBox1") as CheckBox;
                if (chck.Checked)
                {
                    var Label = gvrow.FindControl("Label1") as Label;
                    string qry2 = "delete from videodata where videoId= '" + Label.Text + "'";
                    // SqlCommand cmd = new SqlCommand(qry2, con);
                    //cmd.Parameters.AddWithValue("Idproduct", int.Parse(Label.Text));
                    //con.Open();
                    //int id = cmd.ExecuteNonQuery();
                    //con.Close();
                    //refreshdata();

                    Global_c.Runquery(qry2);


                    BindGrid();

                }
            }   
        }

        
       
    }
}