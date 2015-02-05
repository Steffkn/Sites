using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PersonalSite.Models
{
    public class WallMessage
    {
        [Key]
        public int Id { get; set; }
        
        [Required]
        [DataType(DataType.Text)]
        public string AuthorID { get; set; }

        [Required]
        [DataType(DataType.Text)]
        public string AuthorName { get; set; }
        
        [Required]
        [DataType(DataType.MultilineText)]
        public string Message { get; set; }
        
        [Required]
        [DataType(DataType.DateTime)]
        public DateTime DatePosted { get; set; }
    }
}