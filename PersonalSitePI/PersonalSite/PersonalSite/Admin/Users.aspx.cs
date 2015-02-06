using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PersonalSite
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridViewOfAllUsers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            UsersDBSorce.UpdateParameters["Username"].DefaultValue = ((TextBox)GridViewOfAllUsers.FindControl("tbUserName")).Text;
            UsersDBSorce.UpdateParameters["Email"].DefaultValue = ((TextBox)GridViewOfAllUsers.FindControl("tbEmail")).Text;

            UsersDBSorce.Update();
        }
    }
}