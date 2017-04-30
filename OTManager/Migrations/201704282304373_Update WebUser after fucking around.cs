namespace OTManager.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class UpdateWebUserafterfuckingaround : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.WebUsers", "Discriminator", c => c.String(nullable: false, maxLength: 128));
        }
        
        public override void Down()
        {
            DropColumn("dbo.WebUsers", "Discriminator");
        }
    }
}
