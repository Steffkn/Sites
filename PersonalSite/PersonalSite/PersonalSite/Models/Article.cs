namespace PersonalSite.Models
{
    using System;
    using System.Data.Entity;

    public class Article
    {
        public int ID { get; set; }

        public string Title { get; set; }

        public string Author { get; set; }

        public DateTime CreationDate { get; set; }

        public string Content { get; set; }
    }

    public class ArticleDBContext : DbContext
    {
        public DbSet<Article> Articles { get; set; }
    }
}