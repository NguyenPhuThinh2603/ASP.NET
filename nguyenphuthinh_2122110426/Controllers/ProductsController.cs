﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using nguyenphuthinh_2122110426.Context;

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
    }
}