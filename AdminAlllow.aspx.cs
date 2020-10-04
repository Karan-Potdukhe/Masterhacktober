using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;


namespace agriproject
{
    public partial class AdminAlllow : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                ShowData();
            }  
        }

       

        public DataSet Fetchview(string qry1)
        {
            SqlConnection conn = new SqlConnection();
            //  string path = HttpContext.Current.Server.MapPath("~/Data/SnehaData2.mdf");
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["cnstr1"].ConnectionString;
            conn.Open();
            //for todays remainder 

            SqlCommand cmd = new SqlCommand(qry1, conn);
            SqlDataAdapter da = new SqlDataAdapter(qry1, conn);
            DataSet ds = new DataSet();
            da.Fill(ds, "dt");
            return ds;
        }


        string cs = ConfigurationManager.ConnectionStrings["cnstr1"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter adapt;
        DataTable dt; 

        protected void ShowData()
        {
            dt = new DataTable();
            con = new SqlConnection(cs);
            con.Open();
            adapt = new SqlDataAdapter("Select Id,txtname,txtpasssword,approved,ddlpost,txtmailid from regagri", con);
            
            adapt.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            con.Close();
        }

        protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            //NewEditIndex property used to determine the index of the row being edited.  
            GridView1.EditIndex = e.NewEditIndex;
            ShowData();
        }
        protected void GridView1_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update  
            Label id = GridView1.Rows[e.RowIndex].FindControl("Id") as Label;
            TextBox name = GridView1.Rows[e.RowIndex].FindControl("txtname") as TextBox;
            TextBox city = GridView1.Rows[e.RowIndex].FindControl("txtpasssword") as TextBox;
            TextBox approved = GridView1.Rows[e.RowIndex].FindControl("approved") as TextBox;
            TextBox ddlpost = GridView1.Rows[e.RowIndex].FindControl("ddlpost") as TextBox;
            TextBox txtmailid = GridView1.Rows[e.RowIndex].FindControl("txtmailid") as TextBox;
            con = new SqlConnection(cs);
            con.Open();
            //updating the record  
            SqlCommand cmd = new SqlCommand("Update regagri set approved ='" + approved.Text + "',txtname='" + name.Text + "',txtpasssword='" + city.Text + "', ddlpost= '"+ddlpost.Text+"'  , txtmailid ='" + txtmailid.Text + "' where Id=" + Convert.ToInt32(id.Text), con);
            cmd.ExecuteNonQuery();
            con.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridView1.EditIndex = -1;
            //Call ShowData method for displaying updated data  
            ShowData();
        }
        protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridView1.EditIndex = -1;
            ShowData();
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("loginnew.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }  
       

       

    }
}