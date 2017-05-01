using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using System.Web.ModelBinding;
using OTManager.Models;
using System.Diagnostics;


namespace OTManager
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated)
            {
                string nameWithoutDomain = User.Identity.Name.Substring(User.Identity.Name.LastIndexOf(@"\") + 1);
                using (var _db = new OTManager.Models.EventContext())                    
                {
                    var webuser = _db.WebUsers.FirstOrDefault(x => x.LDAPName == nameWithoutDomain);                



                    if (webuser != null)
                    {
                        Debug.WriteLine("User First name is: " + webuser.FirstName);
                        // Load Home Page
                        Response.Redirect("~/UserHome.aspx");
                    }
                    else
                    {
                        // Load Registration Page
                        Response.Redirect("~/Registration.aspx");
                    }
                }
            }
            else
            {
                Page.Title = "Access Denied. Please contact support.";
            }        
        }       
    }
}