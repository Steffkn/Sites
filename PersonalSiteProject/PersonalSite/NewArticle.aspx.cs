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
    public partial class NewArticle : System.Web.UI.Page
    {
        public SiteDBContext dBContext;

        public NewArticle()
        {
            this.dBContext = new SiteDBContext();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<PersonalSite.Models.Category> DropDownListCategoryList_GetData()
        {
            return this.dBContext.Categories.OrderBy(r => r.Name);
        }

        protected void CreateArticle_Click(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated)
            {
                var article = new Models.Article();
                var categories = this.dBContext.Categories.ToList();
                int categoryID;

                if (String.IsNullOrEmpty(NewArticleTitle.Text) ||
                    String.IsNullOrEmpty(NewArticleDescription.Text) ||
                    String.IsNullOrEmpty(NewArticleTitleContent.Text) ||
                    !int.TryParse(DropDownListCategoryList.SelectedItem.Value, out categoryID))
                {
                    Response.Redirect("~/");
                }
                else
                {
                    var userId = User.Identity.GetUserId();
                    var userName = User.Identity.GetUserName();

                    article.AuthorID = userId;
                    article.DateCreated = DateTime.Now;

                    article.Category = categories.FirstOrDefault(c => c.ID == int.Parse(DropDownListCategoryList.SelectedItem.Value));
                    article.Title = NewArticleTitle.Text;
                    article.Description = NewArticleDescription.Text;
                    article.Content = NewArticleTitleContent.Text;

                    // Save changes 
                    this.dBContext.Articles.Add(article);
                    this.dBContext.SaveChanges();
                }
                Response.Redirect("~/");
            }
        }
    }
}