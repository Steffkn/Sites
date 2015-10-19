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
    public partial class ArticlesOfType : System.Web.UI.Page
    {
        public SiteDBContext dBContext;

        public ArticlesOfType()
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
        public IQueryable<PersonalSite.Models.Article> ListViewArticles_GetData([QueryString("id")]int? categoryId)
        {
            if (categoryId == null)
            {
                Response.Redirect("~/");
            }
            var book = this.dBContext.Articles.Where(c => c.Category.ID == categoryId);
            
            return book;
        }

        //public void ListViewArticles_InsertItem()
        //{
        //    var item = new PersonalSite.Models.WallMessage();
        //    TryUpdateModel(item);
        //    if (ModelState.IsValid)
        //    {
        //        // Save changes here

        //    }
        //}
    }
}