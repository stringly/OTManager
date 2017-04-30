namespace OTManager.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class virtualfieldsaddedtoRegistrationtable : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.WebUsers",
                c => new
                    {
                        WebUserID = c.Int(nullable: false, identity: true),
                        LDAPName = c.String(nullable: false, maxLength: 20),
                        FirstName = c.String(nullable: false, maxLength: 20),
                        LastName = c.String(nullable: false, maxLength: 20),
                        Email = c.String(nullable: false, maxLength: 50),
                        Phone = c.String(nullable: false),
                        BadgeNumber = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.WebUserID);
            
            AddColumn("dbo.Registrations", "Event_EventID", c => c.Int());
            AddColumn("dbo.Registrations", "WebUser_WebUserID", c => c.Int());
            CreateIndex("dbo.Registrations", "Event_EventID");
            CreateIndex("dbo.Registrations", "WebUser_WebUserID");
            AddForeignKey("dbo.Registrations", "Event_EventID", "dbo.Events", "EventID");
            AddForeignKey("dbo.Registrations", "WebUser_WebUserID", "dbo.WebUsers", "WebUserID");
            DropTable("dbo.Users");
        }
        
        public override void Down()
        {
            CreateTable(
                "dbo.Users",
                c => new
                    {
                        UserID = c.Int(nullable: false, identity: true),
                        LDAPName = c.String(nullable: false, maxLength: 20),
                        FirstName = c.String(nullable: false, maxLength: 20),
                        LastName = c.String(nullable: false, maxLength: 20),
                        Email = c.String(nullable: false, maxLength: 50),
                        Phone = c.String(nullable: false),
                        BadgeNumber = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.UserID);
            
            DropForeignKey("dbo.Registrations", "WebUser_WebUserID", "dbo.WebUsers");
            DropForeignKey("dbo.Registrations", "Event_EventID", "dbo.Events");
            DropIndex("dbo.Registrations", new[] { "WebUser_WebUserID" });
            DropIndex("dbo.Registrations", new[] { "Event_EventID" });
            DropColumn("dbo.Registrations", "WebUser_WebUserID");
            DropColumn("dbo.Registrations", "Event_EventID");
            DropTable("dbo.WebUsers");
        }
    }
}
