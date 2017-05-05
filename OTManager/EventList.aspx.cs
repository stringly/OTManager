using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OTManager.Models;
using OTManager.Logic;
using System.Diagnostics;


namespace OTManager
{
    public partial class EventList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            
        }

        public List<OTManager.Models.Event> GetAvailableEvents()
        {
            RegistrationActions ra = new Logic.RegistrationActions();
            return ra.GetEvents();

        }

        protected void Register_Command(object sender, CommandEventArgs e)
        {
            uint ID = UInt32.Parse(e.CommandArgument.ToString());
            RegistrationActions ra = new Logic.RegistrationActions();
            ra.AddRegistration(ID);
            //((Label)Master.FindControl("LabelID")).Text = "Successfully registered for event.";
            Response.Redirect("~/EventList.aspx");
        }

        protected void ActiveEventList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                
                if (e.Row.Cells[3].Text == "Active")
                {
                    e.Row.Cells[3].ForeColor = System.Drawing.Color.Lime;
                }
                else
                {
                    e.Row.Cells[3].ForeColor = System.Drawing.Color.Red;
                    Button cmd = (Button)e.Row.FindControl("Register");
                    cmd.Enabled = false;
                }
            }
        }
    }
}