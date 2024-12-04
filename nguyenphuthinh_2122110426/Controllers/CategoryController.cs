using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace nguyenphuthinh_2122110426.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Category
        public ActionResult Allcategory()
        {
            return View();
        }
        public ActionResult ProductCategory()
        {
            return View();
        }
    }
}