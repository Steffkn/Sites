using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using System.Web;
using System;
using PersonalSite.Models;
using System.Security.Claims;
using System.ComponentModel.DataAnnotations;


namespace PersonalSite.Models
{
    // You can add User data for the user by adding more properties to your User class, please visit http://go.microsoft.com/fwlink/?LinkID=317594 to learn more.
    public class AppUser : IdentityUser
    {
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }
        
        [DataType(DataType.DateTime)]
        public DateTime RegistrationDate { get; set; }
    }
}