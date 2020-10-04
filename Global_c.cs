using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace agriproject
{
    public class Global_c
    {
        public static string getCustId( string strsql)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["cnstr1"].ConnectionString;
            conn.Open();
            SqlCommand cmd = new SqlCommand(strsql, conn);
            string x;
            x = (cmd.ExecuteScalar().ToString());

            conn.Close();

            return x.ToString();

        }

        public static void S_Holiday(string qry)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["cnstr1"].ConnectionString;
            conn.Open();
            SqlCommand cmd = new SqlCommand(qry, conn);
            cmd.ExecuteNonQuery();
            conn.Close();

        }

        public static int GetTime(string qry)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["cnstr1"].ConnectionString;
            conn.Open();
            // string strsql;
            //strsql = "select Amount from " + billtype + " where BillNo = '" + billno + "' ";
            SqlCommand cmd = new SqlCommand(qry, conn);
            SqlDataReader dr = cmd.ExecuteReader();
            int ans;
            if (dr.Read())
            {
                ans =int.Parse(dr[0].ToString());
                conn.Close();
                return ans;
            }
            else
            {
                ans = 00;
                conn.Close();
                return ans;
            }

        }


        public static string GetEmpID(string qry)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["cnstr1"].ConnectionString;
            conn.Open();
            // string strsql;
            //strsql = "select Amount from " + billtype + " where BillNo = '" + billno + "' ";
            SqlCommand cmd = new SqlCommand(qry, conn);
            SqlDataReader dr = cmd.ExecuteReader();
            string ans;
            if (dr.Read())
            {
                ans = dr[0].ToString();
                conn.Close();
                return ans;
            }
            else
            {
                ans = "Empolyee Not Register!!";
                conn.Close();
                return ans;
            }

        }
        public static void Runquery(string qry)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["cnstr1"].ConnectionString;
            conn.Open();
            SqlCommand cmd = new SqlCommand(qry, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
        
        }
        
        public static bool CheckLogin(string qry)
        {

            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["cnstr1"].ConnectionString;
            conn.Open();
            
           // strsql = "select * from login1 where ActNo = '" + actno + "' and PinNo = '" + pinno + "'";
            SqlCommand cmd = new SqlCommand(qry , conn);
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
        } 
        
        
    }
