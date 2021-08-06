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
        protected SqlCommandBuilder cmdbuilder;

        protected void InitGV()
        {
            try
            {
                Con.Open();
                da = new SqlDataAdapter(sql_wholetab, Con);
                cmdbuilder = new SqlCommandBuilder(da);
                ds = new DataSet();
                da.Fill(ds);
                // Con.Close();

                GVmain_chkin.DataSource = ds;
                GVmain_chkin.DataBind();

                System.Diagnostics.Debug.WriteLine("Check Data Inited.");
            }
            catch (SqlException ex)
            {
                System.Diagnostics.Debug.WriteLine(ex);
            }
        }

        protected void UpdateDB()
        {
            System.Diagnostics.Debug.WriteLine("!!!!!");

            da.UpdateCommand = cmdbuilder.GetUpdateCommand();
            
            da.Update(ds.Tables[0]);
        }

        protected void BindDS()
        {
            GVmain_chkin.DataSource = ds;
            GVmain_chkin.DataBind();

            foreach (GridViewRow rows in GVmain_chkin.Rows)
            {
                if (((Label)rows.FindControl("GVcol_typeLabel")).Text.Equals("2"))
                {
                    rows.Cells[5].Text = "已续借";
                }
            }

            ds.Tables[0].PrimaryKey = new DataColumn[] { ds.Tables[0].Columns[0] };
        }

        protected void FilterGV(string userid)
        {
            System.Diagnostics.Debug.WriteLine(userid);
            DataRow[] fRows;

            try
            {
                List<DataRow> RmIndex = new List<DataRow>();
                fRows = ds.Tables[0].Select("(type = 1 OR type = 2) AND number ='" + userid +"'");

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
                BindDS();

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
            FilterGV("120L022004");
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Renew(GridViewCommandEventArgs e)
        {
            DataRow fRow;
            try
            {
                fRow = ds.Tables[0].Rows.Find(int.Parse(e.CommandArgument.ToString()));

                fRow[5] = System.DateTime.Today;
                fRow[6] = 30;
                fRow[7] = 2;
                
                // System.Diagnostics.Debug.WriteLine("!!!"+ds.Tables[0].Rows[0][4].ToString());

                UpdateDB();
                BindDS();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("过滤表单时捕获到异常");
                System.Diagnostics.Debug.WriteLine(ex.ToString());
            }
        }

        protected void RetBook(GridViewCommandEventArgs e)
        {
            DataRow fRow;
            try
            {
                fRow = ds.Tables[0].Rows.Find(int.Parse(e.CommandArgument.ToString()));

                fRow[5] = System.DateTime.Today;
                fRow[6] = 0;
                fRow[7] = 3;

                // System.Diagnostics.Debug.WriteLine("!!!"+ds.Tables[0].Rows[0][4].ToString());

                UpdateDB();
                BindDS();

                Response.Redirect(Request.RawUrl);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("过滤表单时捕获到异常");
                System.Diagnostics.Debug.WriteLine(ex.ToString());
            }
        }

        protected void GVmain_chkin_rowcmd(object sender, GridViewCommandEventArgs e)
        {
            System.Diagnostics.Debug.WriteLine(e.CommandName.ToString() + e.CommandArgument.ToString());

            if (e.CommandName == "RenewBook")
            {
                Renew(e);
            }
            if (e.CommandName == "ReturnBook")
            {
                RetBook(e);
            }
        }
    }
}