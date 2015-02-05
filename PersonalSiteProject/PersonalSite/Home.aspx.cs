using PersonalSite.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PersonalSite
{
    public partial class Home : Page
    {
        public SiteDBContext dBContext;

        public Home()
        {
            this.dBContext = new SiteDBContext();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<PersonalSite.Models.Category> ListViewCategories_GetData()
        {
            return this.dBContext.Categories;
        }
    }
}