
namespace PersonalSite.Controllers
{
    using System.Web.Mvc;
    using PersonalSite.Models;

    public class HomeController : Controller
    {
        private ArticleDBContext articlesDB = new ArticleDBContext();
        //
        // GET: /Home/
        
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            return View();
        }

        public ActionResult Users()
        {
            return View();
        }
    }
}
