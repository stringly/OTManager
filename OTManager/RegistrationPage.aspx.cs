using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OTManager.Models;
using System.Data.Entity;
using OTManager.Logic;

namespace OTManager
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.FindControl("MyInfo").Visible = false;
            string nameWithoutDomain = User.Identity.Name.Substring(User.Identity.Name.LastIndexOf(@"\") + 1);
            userName.Text = "Welcome, " + nameWithoutDomain + ".";

        }

        protected void Register_Click(object sender, EventArgs e)
        {
            using (var _db = new EventContext())
            {
                try
                {
                    // Create new blank user
                    var thisUser = new WebUser();
                    // Set User properties to form text
                    thisUser.Email = Email.Text;
                    thisUser.FirstName = First_Name.Text;
                    thisUser.LastName = Last_Name.Text;
                    thisUser.BadgeNumber = Convert.ToInt32(ID_Number.Text);
                    thisUser.Phone = Phone.Text;
                    thisUser.LDAPName = User.Identity.Name.Substring(User.Identity.Name.LastIndexOf(@"\") + 1);
                    thisUser.Rank = Rank_List.Text;
                    // Add New user to database
                    _db.WebUsers.Add(thisUser);
                    // Create new CurrentUser to set session variables
                    var cu = new CurrentUser();
                    cu.SetSession(thisUser);
                    // Redirect to User home page
                    Response.Redirect("~/UserHome.aspx");
                }
                catch (Exception ex)
                {
                    throw new Exception("Error: Unable to add New User - " + ex.Message.ToString(), ex);
                }

            }
        }
    }
}