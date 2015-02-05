using Microsoft.AspNet.Identity.EntityFramework;
using PersonalSite.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PersonalSite.Admin
{
    public partial class Users : System.Web.UI.Page
    {
        public SiteDBContext dBContext;

        public Users()
        {
            this.dBContext = new SiteDBContext();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<AppUser> ListViewUsers_GetData()
        {
            return this.dBContext.Users.OrderBy(u => u.UserName);
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void ListViewUsers_UpdateItem(string ID)
        {
            AppUser user = this.dBContext.Users.Find(ID);
            if (user == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", ID));
                return;
            }
            TryUpdateModel(user);
            if (ModelState.IsValid)
            {
                this.dBContext.SaveChanges();
            }
        }

        // The id parameter name should match the DataKeyNames value set on the control
        // TODO: Change to Ban User //user.Ban()
        public void ListViewUsers_DeleteItem(string ID)
        {
            var user = this.dBContext.Users.Find(ID);
            this.dBContext.Users.Remove(user);
            this.dBContext.SaveChanges();
        }
    }
}