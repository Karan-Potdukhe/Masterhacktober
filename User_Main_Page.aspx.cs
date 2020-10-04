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
    public partial class Main_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

                BindGrid();

                string query = "select CountryId, CountryName from Country";
                BindDropDownList(ddlCountries, query, "CountryName", "CountryId", "Select Country");
                ddlStates.Enabled = false;
                ddlCities.Enabled = false;
                ddlStates.Items.Insert(0, new ListItem("Select State", "0"));
                ddlCities.Items.Insert(0, new ListItem("Select City", "0"));
            }

           
        }
        private void BindGrid()
        {

            string qry;
            // qry = "Select *  from Productdata where dealerid ='" + Session["dealerid"].ToString() + "'";
            qry = "Select videopath from videodata";

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

        private void BindDropDownList(DropDownList ddl, string query, string text, string value, string defaultText)
        {
            string conString = ConfigurationManager.ConnectionStrings["cnstr1"].ConnectionString;
            SqlCommand cmd = new SqlCommand(query);
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    con.Open();
                    ddl.DataSource = cmd.ExecuteReader();
                    ddl.DataTextField = text;
                    ddl.DataValueField = value;
                    ddl.DataBind();
                    con.Close();
                }
            }
            ddl.Items.Insert(0, new ListItem(defaultText, "0"));
        }

        protected void Country_Changed(object sender, EventArgs e)
        {
            ddlStates.Enabled = false;
            ddlCities.Enabled = false;
            ddlStates.Items.Clear();
            ddlCities.Items.Clear();
            ddlStates.Items.Insert(0, new ListItem("Select State", "0"));
            ddlCities.Items.Insert(0, new ListItem("Select City", "0"));
            int countryId = int.Parse(ddlCountries.SelectedItem.Value);
            if (countryId > 0)
            {
                string query = string.Format("select StateId, StateName from countryState where CountryId = {0}", countryId);
                BindDropDownList(ddlStates, query, "StateName", "StateId", "Select State");
                ddlStates.Enabled = true;
            }
        }

        protected void State_Changed(object sender, EventArgs e)
        {
            ddlCities.Enabled = false;
            ddlCities.Items.Clear();
            ddlCities.Items.Insert(0, new ListItem("Select City", "0"));
            int stateId = int.Parse(ddlStates.SelectedItem.Value);
            if (stateId > 0)
            {
                string query = string.Format("select CityId, CityName from stateCity where StateId = {0}", stateId);
                BindDropDownList(ddlCities, query, "CityName", "CityId", "Select City");
                ddlCities.Enabled = true;
            }
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("loginnew.aspx");
        

        }
    }
}