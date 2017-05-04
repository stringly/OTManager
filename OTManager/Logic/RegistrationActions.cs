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
            //int u = GetUserID();
            int u = (Int32)HttpContext.Current.Session["currentUserID"];
            return _db.Registrations.Where(c => c.UserID == u).ToList();
            
        }

        ///// <summary>
        ///// Function to add select Registration to database *INCOMPLETE*
        ///// </summary>
        ///// <param name="ID"></param>
        //public void AddRegistration(int ID)
        //{
        //    WebUser user = GetCurrentUser();
        //    var eventToAdd = _db.Events.SingleOrDefault(c => c.EventID == ID);
        //    if (eventToAdd != null)
        //    {

        //    }

        //}

        public void RemoveRegistration(int removeID)
        {
            using (var _db = new EventContext())
            {
                try
                {
                    var regToRemove = (from c in _db.Registrations where c.RegistrationID == removeID select c).FirstOrDefault();
                    if (regToRemove != null)
                    {
                        //Remove registration
                        _db.Registrations.Remove(regToRemove);
                        _db.SaveChanges();
                    }
                }
                catch (Exception e)
                {
                    throw new Exception("Error: Unable to remove registration - " + e.Message.ToString(), e);
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