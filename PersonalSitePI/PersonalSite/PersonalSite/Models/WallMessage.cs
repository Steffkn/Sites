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
        public int ID { get; set; }

        [Required]
        public int SenderID { get; set; }

        [Required]
        public string SenderMessage { get; set; }
    }
}