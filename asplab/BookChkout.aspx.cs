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
    public partial class BookChkout : System.Web.UI.Page
    {
        protected SqlConnection Con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\labw\db.mdf;Integrated Security=True;Connect Timeout=30");
        protected string sql_wholetab = "SELECT * FROM [dbo].[CheckInOutTab]";
        protected DataSet ds;
        protected SqlDataAdapter da;
        protected SqlCommandBuilder cmdbuilder;

        protected void InitDS()
        {
            try
            {
                Con.Open();
                da = new SqlDataAdapter(sql_wholetab, Con);
                cmdbuilder = new SqlCommandBuilder(da);
                ds = new DataSet();
                da.Fill(ds);
                // Con.Close();

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

            try
            {
                da.UpdateCommand = cmdbuilder.GetUpdateCommand();

                da.Update(ds.Tables[0]);

                System.Diagnostics.Debug.WriteLine("UPD OK");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex);
            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            InitDS();
            // FilterDS("120L022004");
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void queryBtnClicked(object sender, EventArgs e)
        {
            Response.Redirect("BookQry");
        }

        protected void submitBtnClicked(object sender, EventArgs e)
        {
            string bookISBN = searchBox.Text;
            searchBox.Text = "";

            DataRow newrow = ds.Tables[0].NewRow();
            newrow[0] = int.Parse(ds.Tables[0].Rows[ds.Tables[0].Rows.Count - 1][0].ToString()) + 1;
            newrow[1] = Session["username"].ToString();
            newrow[2] = bookISBN;
            newrow[3] = "-";
            newrow[4] = "-";
            newrow[5] = System.DateTime.Today;
            newrow[6] = 90;
            newrow[7] = 1;

            ds.Tables[0].Rows.Add(newrow);

            foreach (DataRow rows in ds.Tables[0].Rows)
            {
                for (int i = 0; i < rows.ItemArray.Length; i++)
                {
                    System.Diagnostics.Debug.Write(rows[i].ToString() + " ");
                }
                System.Diagnostics.Debug.WriteLine("");
            }

            UpdateDB();

            Global.MsgBox("提交成功", this.Page, this);
            // Response.Redirect(Request.RawUrl);
        }
    }
}