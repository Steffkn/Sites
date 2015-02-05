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
    public partial class Article : System.Web.UI.Page
    {
        public SiteDBContext dBContext;

        public Article()
        {
            this.dBContext = new SiteDBContext();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id
        public PersonalSite.Models.Article FormViewArticle_GetItem([QueryString("id")]int? articleId)
        {
            if (articleId == null)
            {
                Response.Redirect("~/");
            }
            var book = this.dBContext.Articles.FirstOrDefault(a => a.Id == articleId);
            
            return book;
        }
    }
}