using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace asplab
{
    public partial class BookChkin : System.Web.UI.Page
    {
        protected SqlConnection Con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\labw\db.mdf;Integrated Security=True;Connect Timeout=30");
        protected string sql_wholetab = "SELECT * FROM [dbo].[CheckInOutTab]";
        protected DataSet ds;
        protected SqlDataAdapter da;

        protected void InitGV()
        {
            try
            {
                Con.Open();
                da = new SqlDataAdapter(sql_wholetab, Con);
                ds = new DataSet();
                da.Fill(ds);
                Con.Close();

                GVmain_chkin.DataSource = ds;
                GVmain_chkin.DataBind();

                System.Diagnostics.Debug.WriteLine("Check Data Inited.");
            }
            catch (SqlException ex)
            {
                System.Diagnostics.Debug.WriteLine(ex);
            }
        }

        protected void FilterGV(string userid)
        {
            System.Diagnostics.Debug.WriteLine(userid);
            DataRow[] fRows;

            try
            {
                List<DataRow> RmIndex = new List<DataRow>();
                fRows = ds.Tables[0].Select(qs);

                foreach (DataRow rows in ds.Tables[0].Rows)
                {
                    bool isExist = false;
                    foreach (DataRow frow in fRows)
                    {
                        if (frow == rows)
                        {
                            isExist = true;
                        }
                    }
                    if (!isExist)
                    {
                        RmIndex.Add(rows);
                    }
                }

                foreach (DataRow rmrow in RmIndex)
                {
                    ds.Tables[0].Rows.Remove(rmrow);
                }
                GridView1.DataSource = ds;
                GridView1.DataBind();

                System.Diagnostics.Debug.WriteLine("Filter complete.");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("过滤表单时捕获到异常");
                System.Diagnostics.Debug.WriteLine(ex.ToString());
            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            InitGV();
            FilterGV("");
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GVmain_chkin_rowcmd(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}