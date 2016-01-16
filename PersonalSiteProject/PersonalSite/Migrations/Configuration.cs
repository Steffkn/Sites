namespace PersonalSite.Migrations
{
    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.EntityFramework;
    using PersonalSite.Models;
    using System;
    using System.Collections.Generic;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<PersonalSite.Models.SiteDBContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
            AutomaticMigrationDataLossAllowed = true;
        }

        /// <summary>
        /// Seed some initial data in the DB
        /// </summary>
        /// <param name="context">Site DB Context</param>
        protected override void Seed(SiteDBContext context)
        {
            //fix
            string userId = "noidgiven";

            // check if there are users in the DB / if not, add admin
            if (!context.Users.Any())
            {
                var UserManager = new UserManager<AppUser>(new UserStore<AppUser>(context));
                var RoleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));
                string name = "Admin";
                string password = "123456";

                //Create Roles admin, Administrator, Moderator, User
                IList<IdentityRole> roles = new List<IdentityRole>()
                {
                    new IdentityRole("Admin"),
                    new IdentityRole("Administrator"),
                    new IdentityRole("Moderator"),
                    new IdentityRole("User")
                };

                foreach (IdentityRole role in roles)
                {
                    if (!RoleManager.RoleExists(role.Name))
                    {
                        var roleresult = RoleManager.Create(role);
                    }
                }

                //Create User=admin with password=123456
                var user = new AppUser() { UserName = name, RegistrationDate = DateTime.Now, Email = "admin@admin.admin" };
                var adminresult = UserManager.Create(user, password);
                userId = user.Id;
                //Add User admin to Role admin
                if (adminresult.Succeeded)
                {
                    var result = UserManager.AddToRole(user.Id, "Admin");
                }

                base.Seed(context);
            }

            // check if there are articles in the DB / if not, add them
            if (!context.Articles.Any())
            {

                IList<Category> categories = new List<Category>()
                {
                    new Category() { Name = "CSharp" },
                    new Category() { Name = "Patterns" },
                    new Category() { Name = "HTML" },
                    new Category() { Name = "CSS" },
                    new Category() { Name = "PHP" },
                };

                IList<Article> Articles = new List<Article>()
                {
                    new Article()
                    { 
                        AuthorID = userId, 
                        Category=categories[0], 
                        DateCreated = DateTime.Now, 
                        Title = "Is CSharp is a nice language?",
                        Description="Why is CSharp a nice language", 
                        Content = "Again I've dabbled with various languages but C# is my first serious one, I've read \"Head First C#\" and created a few projects. But after reading the post above I've found it a bit disheartening that I may be going about it all wrong, obviously I respect Joel's opinion which is what has thrown me a bit." +
                                    "I've started reading \"Code\" as recommended in the reading list and I'm finding it pretty hard going, although enjoyable. I feel like it's taken the shine off of my \"noobish hacking about\" in Visual Studio.",
                    }, 
                    new Article()
                    { 
                        AuthorID = userId, 
                        Category = categories[0], 
                        DateCreated = DateTime.Now.AddDays(2), 
                        Title = "Is CSharp is a nice language, again?",
                        Description="Why is CSharp a nice language again", 
                        Content = "I've dabbled with various languages but C# is my first serious one, I've read \"Head First C#\" and created a few projects. But after reading the post above I've found it a bit disheartening that I may be going about it all wrong, obviously I respect Joel's opinion which is what has thrown me a bit. I've started reading \"Code\" as recommended in the reading list and I'm finding it pretty hard going, although enjoyable. I feel like it's taken the shine off of my \"noobish hacking about\" in Visual Studio.",
                    }, 
                    new Article()
                    { 
                        AuthorID = userId, 
                        Category = categories[1], 
                        DateCreated = DateTime.Now.AddDays(1), 
                        Title = "Design Patterns",
                        Description="What are design patterns", 
                        Content = "Design patterns are solutions to software design problems you find again and again in real-world application development. Patterns are about reusable designs and interactions of objects. The 23 Gang of Four (GoF) patterns are generally considered the foundation for all other patterns. They are categorized in three groups: Creational, Structural, and Behavioral (for a complete list see below).",
                    }, 
                };

                context.Articles.AddOrUpdate(Articles.ToArray());

            }
        }
    }
}
