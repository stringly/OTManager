namespace OTManager.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddranktoWebusermodel : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.WebUsers", "Rank", c => c.String(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.WebUsers", "Rank");
        }
    }
}
