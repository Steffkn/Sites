using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using PersonalSite.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PersonalSite.Admin
{
    public partial class Roles : System.Web.UI.Page
    {
        public SiteDBContext dBContext;

        public Roles()
        {
            this.dBContext = new SiteDBContext();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        private void CheckRolesForSelectedUser()
        {
            // Determine what roles the selected user belongs to 
            string selectedUserName = DropDownListUserList.SelectedValue;
            var UserManager = new UserManager<AppUser>(new UserStore<AppUser>(dBContext));

            string[] selectedUsersRoles = UserManager.GetRoles(selectedUserName).ToArray();
            // Loop through the Repeater's Items and check or uncheck the checkbox as needed 

            foreach (RepeaterItem ri in UsersRoleList.Items)
            {
                // Programmatically reference the CheckBox 
                CheckBox RoleCheckBox = ri.FindControl("RoleCheckBox") as CheckBox;
                // See if RoleCheckBox.Text is in selectedUsersRoles 
                if (selectedUsersRoles.Contains<string>(RoleCheckBox.Text))
                {
                    RoleCheckBox.Checked = true;
                }
                else
                {
                    RoleCheckBox.Checked = false;
                }
            }
        }
        protected void DropDownListUserList_SelectedIndexChanged(object sender, EventArgs e)
        {
            CheckRolesForSelectedUser();
        }

        public IQueryable<AppUser> DropDownListUserList_GetData()
        {
            return this.dBContext.Users.OrderBy(r => r.UserName);
        }

        public IQueryable<IdentityRole> UsersRoleList_GetData()
        {
            return this.dBContext.Roles.OrderBy(r => r.Name);
        }

        protected void RoleCheckBox_CheckChanged(object sender, EventArgs e)
        {
            // Reference the CheckBox that raised this event 
            CheckBox RoleCheckBox = sender as CheckBox;

            // Get the currently selected user and role 
            string selectedUserName = DropDownListUserList.SelectedValue;
            var UserManager = new UserManager<AppUser>(new UserStore<AppUser>(dBContext));
            string[] selectedUsersRoles = UserManager.GetRoles(selectedUserName).ToArray();
            string roleName = RoleCheckBox.Text;

            // Determine if we need to add or remove the user from this role 
            if (RoleCheckBox.Checked)
            {
                // Add the user to the role 
                UserManager.AddToRole(selectedUserName, roleName);
            }
            else
            {
                // Remove the user from the role 
                UserManager.RemoveFromRole(selectedUserName, roleName);
            }
        }
    }
}