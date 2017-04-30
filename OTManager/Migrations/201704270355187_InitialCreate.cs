namespace OTManager.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Events",
                c => new
                    {
                        EventID = c.Int(nullable: false, identity: true),
                        EventName = c.String(nullable: false, maxLength: 150),
                        StartTime = c.DateTime(nullable: false),
                        EndTime = c.DateTime(nullable: false),
                        MaxStaff = c.Int(nullable: false),
                        MinStaff = c.Int(nullable: false),
                        SuperStaff = c.Int(),
                        FundCenter = c.String(nullable: false),
                        LocationCode = c.String(nullable: false),
                    })
                .PrimaryKey(t => t.EventID);
            
            CreateTable(
                "dbo.Registrations",
                c => new
                    {
                        RegistrationID = c.Int(nullable: false, identity: true),
                        UserID = c.Int(nullable: false),
                        TimeStamp = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.RegistrationID);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.Registrations");
            DropTable("dbo.Events");
        }
    }
}
