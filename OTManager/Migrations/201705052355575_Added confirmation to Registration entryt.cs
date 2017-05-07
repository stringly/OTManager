namespace OTManager.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddedconfirmationtoRegistrationentryt : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Registrations", "Confirmed", c => c.Boolean(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Registrations", "Confirmed");
        }
    }
}
