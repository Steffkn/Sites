using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PersonalSite.Models
{
    public class Category
    {
        public Category()
        {
            this.Articles = new HashSet<Article>();
        }

        [Key]
        public int ID { get; set; }

        [Required]
        [DataType(DataType.Text)]
        public string Name { get; set; }

        public virtual ICollection<Article> Articles { get; set; }
    }
}