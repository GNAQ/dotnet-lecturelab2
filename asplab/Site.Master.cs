using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace asplab
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            
            System.Diagnostics.Debug.WriteLine("Master Page Loaded.");
            System.Diagnostics.Debug.WriteLine(Request.RawUrl);

            if (Request.RawUrl != "/Login")
            {
                if (Session["username"] == null)
                {
                    System.Diagnostics.Debug.WriteLine("!!!Empty Session");

                    Response.Redirect("~/Login");
                }
                else
                {
                    System.Diagnostics.Debug.WriteLine("Session: " + Session["username"].ToString());

                    loginbar.Visible = false;
                    usernamebar.Visible = true;
                    usernamebar.Visible = true;
                    usernameTitle.Text = Session["username"].ToString();
                }
                /*foreach (string s in Request.Cookies.AllKeys)
                {
                    System.Diagnostics.Debug.WriteLine("Cookie Keys: " + s);
                }
                System.Diagnostics.Debug.WriteLine(Response.Cookies.Count);

                if (Request.Cookies.AllKeys.Contains("userInfo"))
                {
                    loginbar.Visible = false;
                    usernamebar.Visible = true;
                    usernamebar.Visible = true;
                    usernameTitle.Text = Response.Cookies["userInfo"]["userID"];
                }
                else
                {
                    System.Diagnostics.Debug.WriteLine("Non Cookie");
                    if (Request.RawUrl != "/Signin")
                    {
                        Response.Redirect("~/Login");
                    }
                }*/
            }
            else
            {
                ;
            }
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
        }
    }
}