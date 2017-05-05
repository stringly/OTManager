using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OTManager.Models;
using OTManager.Logic;
using System.Data.Entity;
using System.Diagnostics;

namespace OTManager
{
    public partial class EditRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Email.Text = (string)Session["currentUserEmail"];
                Rank_List.SelectedIndex = Rank_List.Items.IndexOf(Rank_List.Items.FindByText((string)Session["currentUserRank"]));
                First_Name.Text = (string)Session["currentUserFirstName"];
                Last_Name.Text = (string)Session["currentUserLastName"];
                ID_Number.Text = (string)Session["currentUserBadgeNumber"];
                Phone.Text = (string)Session["currentUserPhone"];
            }
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            using (var _db = new EventContext())
            {
                int ID = (int)Session["currentUserID"];
                var u = _db.WebUsers.FirstOrDefault(c => c.WebUserID == ID);
                if (u != null)
                {
                    u.Email = Email.Text;
                    u.FirstName = First_Name.Text;
                    u.LastName = Last_Name.Text;
                    u.BadgeNumber = Convert.ToInt32(ID_Number.Text);
                    u.Phone = Phone.Text;
                    u.Rank = Rank_List.Text;

                    _db.SaveChanges();

                    using (var c = new CurrentUser())
                    {
                        c.RefreshSession(ID);
                    }
                }
            }
            Response.Redirect("~/UserHome.aspx");
        }
    }
}