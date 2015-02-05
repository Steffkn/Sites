using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using PersonalSite.Models;

namespace PersonalSite.Account
{
    public partial class Register : Page
    {
        public SiteDBContext dBContext;

        public Register()
        {
            this.dBContext = new SiteDBContext();
        }

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = new UserManager();
            var user = new AppUser() { UserName = UserName.Text, Email = Email.Text, RegistrationDate = DateTime.Now };
            IdentityResult result = manager.Create(user, Password.Text);
            if (result.Succeeded)
            {
                var RoleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(dBContext));
                manager.AddToRole(user.Id, "User");
                IdentityHelper.SignIn(manager, user, isPersistent: false);
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }
    }
}