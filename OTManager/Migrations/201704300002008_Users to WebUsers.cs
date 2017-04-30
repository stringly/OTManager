namespace OTManager.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class UserstoWebUsers : DbMigration
    {
        public override void Up()
        {
            DropColumn("dbo.WebUsers", "Discriminator");
        }
        
        public override void Down()
        {
            AddColumn("dbo.WebUsers", "Discriminator", c => c.String(nullable: false, maxLength: 128));
        }
    }
}
