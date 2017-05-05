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

        /// <summary>
        /// This method will return a list of active registrations for which the logged on user is not already registered
        /// </summary>
        /// <returns>List(Models.Event)</returns>
        public List<OTManager.Models.Event> GetEvents()
        {
            int u = (Int32)HttpContext.Current.Session["currentUserID"];
            return _db.Events.Where(c => !_db.Registrations.Any(b => b.WebUser.WebUserID == u && b.Event.EventID == c.EventID) && c.Status == "Active").ToList();
        }

        /// <summary>
        /// Function to add select Registration to database *INCOMPLETE*
        /// </summary>
        /// <param>EventID</param>
        public void AddRegistration(uint ID)
        {
            int u = (Int32)HttpContext.Current.Session["currentUserID"];
            var eventToAdd = _db.Events.SingleOrDefault(c => c.EventID == ID);
            var userToAdd = _db.WebUsers.SingleOrDefault(c => c.WebUserID == u);
            if (eventToAdd != null && userToAdd != null)
            {
                if (eventToAdd.ConfirmedStaff < eventToAdd.MaxStaff)
                {
                    try
                    {
                        var newReg = new OTManager.Models.Registration();
                        newReg.EventID = ID;
                        newReg.Event = eventToAdd;
                        newReg.UserID = u;
                        newReg.WebUser = userToAdd;
                        newReg.TimeStamp = System.DateTime.Now;
                        _db.Registrations.Add(newReg);
                        _db.SaveChanges();
                    }
                    catch (Exception e)
                    {
                        throw new Exception("Error: Unable to add registration - " + e.Message.ToString(), e);
                    }

                }
            }
        }

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