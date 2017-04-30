using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace OTManager.Models
{
    public class EventContext : DbContext
    {
        public EventContext() : base("OTManager")
        {
        }
        public DbSet<Event> Events { get; set; }
        public DbSet<Registration> Registrations { get; set; }
        public DbSet<WebUser> WebUsers { get; set; }
    }
}