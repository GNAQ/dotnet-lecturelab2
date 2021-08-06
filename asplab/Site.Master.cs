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

            if (Response.Cookies["userInfo"] != null)
            {
                loginbar.Visible = false;
                usernamebar.Visible = true;
                usernamebar.Visible = true;
                usernameTitle.Text = Response.Cookies["userInfo"]["userID"];
            }
            else
            {
                if (Request.RawUrl != "/Signin")
                {
                    Response.Redirect("~/Login");
                }
            }
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
        }
    }
}