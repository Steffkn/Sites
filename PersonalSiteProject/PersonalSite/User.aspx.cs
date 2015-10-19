using PersonalSite.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PersonalSite
{
    public partial class User : System.Web.UI.Page
    {
        public SiteDBContext dBContext;

        public User()
        {
            this.dBContext = new SiteDBContext();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id
        public PersonalSite.Models.AppUser FormViewAppUser_GetItem([QueryString("id")]string userId)
        {
            if (userId == null)
            {
                Response.Redirect("~/");
            }
            var user = new AppUser();
            try
            {
                user = this.dBContext.Users.First(u => u.Id == userId);

            }
            catch (Exception ex)
            {
                Response.Redirect("~/");
            }

            return user;
        }
    }
}