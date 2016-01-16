using PersonalSite.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace PersonalSite
{
    public partial class Wall : System.Web.UI.Page
    {
        public SiteDBContext dBContext;

        public Wall()
        {
            this.dBContext = new SiteDBContext();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            // to draw or not the insert template if the user is not logged in
            	if (!User.Identity.IsAuthenticated) {
                    ListViewWallMassages.InsertItemPosition = InsertItemPosition.None;
	            }
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<WallMessage> ListViewWallMassages_GetData()
        {
            return this.dBContext.WallMessages.OrderByDescending(m => m.DatePosted).Take(5);
        }

        public void ListViewWallMassages_InsertItem()
        {
            if (User.Identity.IsAuthenticated)
            {
                var item = new WallMessage();
                var userId = User.Identity.GetUserId();
                var userName = User.Identity.GetUserName();

                item.AuthorID = userId;
                item.AuthorName = userName;
                item.DatePosted = DateTime.Now;

                TryUpdateModel(item);
                if (ModelState.IsValid)
                {
                    // Save changes 
                    this.dBContext.WallMessages.Add(item);
                    this.dBContext.SaveChanges();
                }
            }
        }
    }
}