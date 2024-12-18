using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using nguyenphuthinh_2122110426.Context;

namespace nguyenphuthinh_2122110426.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Category
        WebsiteASP_NETEntities objWebsiteASP_NETEntities = new WebsiteASP_NETEntities();
        public ActionResult Index()
        {

            return View();

        }
        public ActionResult AllCategory()

        {
            var lstCategory = objWebsiteASP_NETEntities.Category.ToList();
            return View(lstCategory);
          
        }
        public ActionResult ProductCategory(int Id)

        {
            var listProduct = objWebsiteASP_NETEntities.Product.Where(n => n.CategoryId == Id).ToList();
            return View(listProduct);
        }
    }
}