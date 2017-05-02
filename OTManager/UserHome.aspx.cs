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
    public partial class UserHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public List<OTManager.Models.Registration> GetUserRegistrations()
        {
            RegistrationActions ra = new Logic.RegistrationActions();
            return ra.GetRegistrations();
           
        }

        protected void Delete_Command(object sender, CommandEventArgs e)
        {
            int ID = Int32.Parse(e.CommandArgument.ToString());
            RegistrationActions ra = new Logic.RegistrationActions();
            ra.RemoveRegistration(ID);
        }

        //public IQueryable<Registration> userRegistrationsGrid_GetData()
        //{
        //    public User user = new Models.User();

        //    EventContext _db = new EventContext();
        //    var query = _db.Registrations.Include(r => r.UserID)
        //}
    }
}