using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OTManager.Admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DateValidate(object sender, ServerValidateEventArgs e)
        {
            e.IsValid = (Convert.ToDateTime(StartDate.Text) < Convert.ToDateTime(EndDate.Text));
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/UserHome.aspx");
        }
    }
}