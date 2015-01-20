namespace PersonalSite.Models
{
    using System;
    using System.Data.Entity;

    public class User
    {
        public int ID { get; set; }

        public string Name { get; set; }

        public string Password { get; set; }

        public string Email { get; set; }

        public DateTime RegistrationDate { get; set; }

        public Role Role { get; set; }
    }
    
    public class UserDBContext : DbContext
    {
        public DbSet<User> Users { get; set; }
    }
}