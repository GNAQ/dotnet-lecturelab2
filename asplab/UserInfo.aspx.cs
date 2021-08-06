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
    public partial class UserInfo : System.Web.UI.Page
    {
        protected SqlConnection Con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\labw\db.mdf;Integrated Security=True;Connect Timeout=30");
        protected string sql_wholetab = "SELECT * FROM [dbo].[CheckInOutTab]";
        protected DataSet ds;
        protected SqlDataAdapter da;
        protected string UserId = "0001";
        protected void Page_Init(object sender, EventArgs e)
        {
            //try
            //{
                Con.Open();
                da = new SqlDataAdapter(sql_wholetab, Con);
                ds = new DataSet();
                da.Fill(ds);
               

                GridViewCheckInOut.DataSource = ds;
                GridViewCheckInOut.DataBind();

                string CmdStr = "SELECT * FROM [dbo].[UserTab] WHERE number='" + UserId + "';";
                SqlCommand Cmd = new SqlCommand(CmdStr, Con);
                SqlDataReader dr = Cmd.ExecuteReader();
                if (dr.Read())
                {
                    TextBoxName.Text = dr["name"].ToString();
                    Label_Id2.Text = dr["number"].ToString();
                } 
                Con.Close();
            //System.Diagnostics.Debug.WriteLine("Book Data Inited.");
            //}
            // catch (SqlException ex)
            //{
            //   System.Diagnostics.Debug.WriteLine(ex);
            //}
        }
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button_password_change_Click(object sender, EventArgs e)
        {
            if(String.Equals(TextBoxPassNew.Text,TextBoxPassConfirm.Text))
            {
                Con.Open();
                Global.MsgBox(TextBoxName.Text, this.Page, this);
                string CmdStr = "UPDATE [dbo].[UserTab] SET name='"+TextBoxName.Text+
                    "',password='"+TextBoxPassNew.Text+"' WHERE number='"+UserId+"';";
                //Console.WriteLine(CmdStr);
                Global.MsgBox(CmdStr, this.Page, this);
                SqlCommand Cmd = new SqlCommand(CmdStr, Con);
                Cmd.ExecuteNonQuery();
                Global.MsgBox("修改成功", this.Page, this);
            }
            else
            {
                Global.MsgBox("两次输入的密码不一致，请重新输入", this.Page, this);
            }
        }
    }
}