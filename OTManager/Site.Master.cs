using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;
using OTManager.Models;

namespace OTManager
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string nameWithoutDomain = Page.User.Identity.Name.Substring(Page.User.Identity.Name.LastIndexOf(@"\") + 1);
            loginName.Text = nameWithoutDomain;
        }
    }
}