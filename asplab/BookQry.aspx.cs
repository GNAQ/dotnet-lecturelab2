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
    public partial class BookQry : Page
    {
        protected SqlConnection Con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\labw\asplab\db.mdf;Integrated Security=True;Connect Timeout=30");
        protected string sql_wholetab = "SELECT * FROM [dbo].[BookTab]";
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

                GridView1.DataSource = ds;
                GridView1.DataBind();

                System.Diagnostics.Debug.WriteLine("Book Data Inited.");
            }
            catch (SqlException ex)
            {
                System.Diagnostics.Debug.WriteLine(ex);
            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            InitGV();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void UpdateGV(string qs)
        {
            queryBox.Text = "";
            System.Diagnostics.Debug.WriteLine(qs);
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

        protected void searchBtn_Clicked(object sender, EventArgs e)
        {           
            System.Diagnostics.Debug.WriteLine(BookDropList1.Text);

            string QryStr;
            if (String.Equals(BookDropList1.Text, "ISBN"))
            {
                if (queryBox.Text.Length > 25)
                { Global.MsgBox("ISBN码过长", this.Page, this); return; }

                QryStr = "ISBN = '" + queryBox.Text + "'";
                UpdateGV(QryStr.ToString());
            }
            else if (String.Equals(BookDropList1.Text, "name"))
            {
                if (queryBox.Text.Length > 50)
                { Global.MsgBox("书名过长", this.Page, this); return; }

                QryStr = "name = '" + queryBox.Text + "'";
                UpdateGV(QryStr.ToString());
            }
            else if (String.Equals(BookDropList1.Text, "pressdate"))
            {
                DateTime dtTime;
                if (DateTime.TryParse(queryBox.Text, out dtTime))
                {
                    ;
                }
                else
                {
                    Global.MsgBox("请输入合法日期", this.Page, this); return;
                }

                QryStr = "pressdate = '" + queryBox.Text + "'";
                UpdateGV(QryStr.ToString());
            }
            else if (String.Equals(BookDropList1.Text, "press"))
            {
                if (queryBox.Text.Length > 15)
                { Global.MsgBox("出版社名过长", this.Page, this); return; }

                QryStr = "press = '" + queryBox.Text + "'";
                UpdateGV(QryStr.ToString());
            }
            else if (String.Equals(BookDropList1.Text, "countinlib"))
            {

                QryStr = "countinlib = " + queryBox.Text;
                UpdateGV(QryStr.ToString());
            }
            else if (String.Equals(BookDropList1.Text, "count"))
            {
                QryStr = "count = " + queryBox.Text;
                UpdateGV(QryStr.ToString());
            }
            else if (String.Equals(BookDropList1.Text, "author"))
            {
                if (queryBox.Text.Length > 25)
                { Global.MsgBox("作者姓名过长", this.Page, this); return; }

                QryStr = "author = '" + queryBox.Text + "'";
                UpdateGV(QryStr.ToString());
            }
            else if (String.Equals(BookDropList1.Text, "subauthor"))
            {
                if (queryBox.Text.Length > 50)
                { Global.MsgBox("其他作者姓名过长", this.Page, this); return; }

                QryStr = "subauthor = '" + queryBox.Text + "'";
                UpdateGV(QryStr.ToString());
            }
            else if (String.Equals(BookDropList1.Text, "libcode"))
            {
                if (queryBox.Text.Length > 20)
                { Global.MsgBox("图书馆编码过长", this.Page, this); return; }

                QryStr = "libcode = '" + queryBox.Text + "'";
                UpdateGV(QryStr.ToString());
            }
        }

        protected void resetBtn_Clicked(object sender, EventArgs e)
        {
            InitGV();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    }
}