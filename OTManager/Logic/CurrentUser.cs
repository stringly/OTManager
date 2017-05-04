using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using OTManager.Models;

namespace OTManager.Logic
{
    public class CurrentUser : IDisposable
    {
        private EventContext _db = new EventContext();

        public void SetSession(WebUser user)
        {
            HttpContext.Current.Session["currentUserID"] = user.WebUserID;
            HttpContext.Current.Session["currentUserRank"] = user.Rank;
            HttpContext.Current.Session["currentUserEmail"] = user.Email;
            HttpContext.Current.Session["currentUserFirstName"] = user.FirstName;
            HttpContext.Current.Session["currentUserLastName"] = user.LastName;
            HttpContext.Current.Session["currentUserBadgeNumber"] = user.BadgeNumber.ToString();
            HttpContext.Current.Session["currentUserPhone"] = user.Phone;
        }

        public void RefreshSession(Int32 ID)
        {
            using (var _db = new EventContext())
            {
                var u = new WebUser();
                u = _db.WebUsers.FirstOrDefault(x => x.WebUserID == ID);
                if (u != null)
                {
                    SetSession(u);
                }
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