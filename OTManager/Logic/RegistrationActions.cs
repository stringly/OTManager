using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OTManager.Models;


namespace OTManager.Logic
{
    public class RegistrationActions : IDisposable
    {

        private EventContext _db = new EventContext();

        public List<OTManager.Models.Registration> GetRegistrations()
        {
            int u = GetUserID();
            return _db.Registrations.Where(c => c.UserID == u).ToList();
            
        }

        private int GetUserID()
        {
            string nameWithoutDomain = HttpContext.Current.User.Identity.Name.Substring(HttpContext.Current.User.Identity.Name.LastIndexOf(@"\") + 1);
            using (var x = new OTManager.Models.EventContext())
            {
                return x.WebUsers.FirstOrDefault(u => u.LDAPName == nameWithoutDomain).WebUserID;
                
            }
        }

        public void Dispose()
        {
            if (_db != null)
            {
                _db.Dispose();
                _db = null;
            }
        }

    }
}