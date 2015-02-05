using Microsoft.AspNet.Identity.EntityFramework;
using PersonalSite.Migrations;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace PersonalSite.Models
{
    public class SiteDBContext : IdentityDbContext<AppUser>
    {
        public SiteDBContext()
            : base("DefaultConnection")
        {
            Database.SetInitializer( new MigrateDatabaseToLatestVersion<SiteDBContext,Configuration>());
        }
        
        public IDbSet<Category> Categories { get; set; }
        
        public IDbSet<Article> Articles { get; set; }
        public IDbSet<WallMessage> WallMessages { get; set; }
    }
}