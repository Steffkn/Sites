using PersonalSite.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PersonalSite.Admin
{
    public partial class EditCategories : System.Web.UI.Page
    {
        public SiteDBContext dBContext;

        public EditCategories()
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
        public IQueryable<Category> ListViewCategories_GetData()
        {
            return this.dBContext.Categories.OrderBy(c => c.ID);
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void ListViewCategories_UpdateItem(int ID)
        {
            Category item = this.dBContext.Categories.Find(ID);
            if (item == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", ID));
                return;
            }
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                this.dBContext.SaveChanges();
            }
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void ListViewCategories_DeleteItem(int id)
        {
            var item = this.dBContext.Categories.Find(id);
            this.dBContext.Categories.Remove(item);
            this.dBContext.SaveChanges();
        }

        public void ListViewCategories_InsertItem()
        {
            var category = new Category();
            TryUpdateModel(category);
            if (ModelState.IsValid)
            {
                this.dBContext.Categories.Add(category);
                this.dBContext.SaveChanges();
            }
        }
    }
}