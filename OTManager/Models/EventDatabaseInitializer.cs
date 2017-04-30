using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace OTManager.Models
{
    public class EventDatabaseInitializer : DropCreateDatabaseIfModelChanges<EventContext>
    {
        protected override void Seed(EventContext context)
        {
            GetEvents().ForEach(c => context.Events.Add(c));
            //GetRegistrations().ForEach(p => context.Registrations.Add(p));
        }

        private static List<Event> GetEvents()
        {
            var events = new List<Event> {
                new Event
                {
                    EventName = "Test Event 1",
                    StartTime = new DateTime(2017, 4, 27, 8, 0, 0),
                    EndTime = new DateTime(2017, 4, 27, 16, 0, 0),
                    MaxStaff = 4,
                    MinStaff = 2,
                },
                new Event
                {
                    EventName = "Test Event 2",
                    StartTime = new DateTime(2017, 4, 28, 8, 0, 0),
                    EndTime = new DateTime(2017, 4, 28, 16, 0, 0),
                    MaxStaff = 4,
                    MinStaff = 2,
                },
                new Event
                {
                    EventName = "Test Event 3",
                    StartTime = new DateTime(2017, 4, 29, 8, 0, 0),
                    EndTime = new DateTime(2017, 4, 29, 16, 0, 0),
                    MaxStaff = 6,
                    MinStaff = 4,
                },
                new Event
                {
                    EventName = "Test Event 4",
                    StartTime = new DateTime(2017, 4, 30, 0, 0, 0),
                    EndTime = new DateTime(2017, 4, 30, 8, 0, 0),
                    MaxStaff = 4,
                    MinStaff = 2,
                },
                new Event
                {
                    EventName = "Test Event 5",
                    StartTime = new DateTime(2017, 5, 1, 16, 0, 0),
                    EndTime = new DateTime(2017, 5, 2, 0, 0, 0),
                    MaxStaff = 4,
                    MinStaff = 2,
                }
            };
            return events;
        }

        //private static List<Registrations>
        

    }


}