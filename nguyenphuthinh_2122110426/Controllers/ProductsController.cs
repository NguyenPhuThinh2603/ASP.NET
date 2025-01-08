using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using nguyenphuthinh_2122110426.Context;
using PagedList;

namespace nguyenphuthinh_2122110426.Controllers
{
    public class ProductsController : Controller
    {
        // GET: Products
        WebsiteASP_NETEntities objWebsiteASP_NETEntities = new WebsiteASP_NETEntities();
        public ActionResult ProductDetail(int Id)
        {
            var objProduct = objWebsiteASP_NETEntities.Product.Where(n => n.Id == Id).FirstOrDefault();
            return View(objProduct);
        }
        public ActionResult AllProduct(string currentFilter, string SearchString, int? page)
        {
            var lstProduct = new List<Product>();
            if (SearchString != null)
            {
                page = 1;
            }
            else
            {
                SearchString = currentFilter;
            }
            if (!string.IsNullOrEmpty(SearchString))
            {
                lstProduct = objWebsiteASP_NETEntities.Product.Where(n => n.Name.Contains(SearchString)).ToList();
            }
            else
            {
                lstProduct = objWebsiteASP_NETEntities.Product.ToList();
            }
            ViewBag.CurentFIlter = SearchString;
            int pageSize = 8;
            int pageNumber = (page ?? 1);
            lstProduct = lstProduct.OrderByDescending(n => n.Id).ToList();
            return View(lstProduct.ToPagedList(pageNumber, pageSize));
        }
    }
}