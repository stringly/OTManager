namespace OTManager.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Test : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Events", "ConfirmedStaff", c => c.Int(nullable: false));
            AddColumn("dbo.Events", "Status", c => c.String(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Events", "Status");
            DropColumn("dbo.Events", "ConfirmedStaff");
        }
    }
}
