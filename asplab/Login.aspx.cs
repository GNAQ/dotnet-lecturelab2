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
    public partial class Login : System.Web.UI.Page
    {
        protected SqlConnection Con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\labw\db.mdf;Integrated Security=True;Connect Timeout=30");

        protected void Page_Load(object sender, EventArgs e)
        {
            string username = "";
            string userpswd = "";
            HttpCookie reqCookies = Request.Cookies["userInfo"];
            if (reqCookies != null)
            {

                username = reqCookies["userID"];
                userpswd = reqCookies["userPasswd"];
                Login_Go(username, userpswd, true);
            }
        }

        protected void AddCookie(string name, string pswd)
        {
            HttpCookie userInfo = new HttpCookie("userInfo");
            userInfo["userID"] = name;
            userInfo["userPasswd"] = pswd;

            userInfo.Expires.AddDays(7);
            Response.Cookies.Add(userInfo);

            System.Diagnostics.Debug.WriteLine("Cookie Added.");
        }

        protected void Login_Go(string username, string userpswd, bool isCookied)
        {
            try
            {
                string cmdStr = "SELECT * FROM [dbo].[UserTab] WHERE number=N'" + username + "' AND password=N'" + userpswd + "'";
                Con.Open();
                SqlCommand cmd = new SqlCommand(cmdStr, Con);
                SqlDataReader dr = cmd.ExecuteReader();
                // Console.WriteLine("**!!!!" + dr.Read());
                if (dr.Read() == false)
                {
                    Global.MsgBox("学号或密码错误！", this.Page, this);
                    Con.Close();
                    return;
                }

                // Cookies
                if (isCookied == false)
                {
                    AddCookie(usernameBox.Text, pswdBox.Text);
                }

                Response.Redirect("~");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.ToString());
            }
            Con.Close();
        }

        protected void submitBtnClicked(object sender, EventArgs e)
        {
            bool okState = true;
            if (usernameBox.Text == "")
            {
                Global.MsgBox("请输入学号！", this.Page, this);
                okState = false;
                // Response.Redirect(Request.RawUrl);
            }
            if (pswdBox.Text == "")
            {
                Global.MsgBox("请输入密码！", this.Page, this);
                okState = false;
                // Response.Redirect(Request.RawUrl);
            }
            if (okState == true)
            {
                Login_Go(usernameBox.Text, pswdBox.Text, false);
            }
        }
    }
}