using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using nguyenphuthinh_2122110426.Context;
using nguyenphuthinh_2122110426.Models;

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
        public ActionResult ProductCategory(int id, int page = 1)

        {
            int pageSize = 3;  // Số sản phẩm mỗi trang

            // Lấy sản phẩm của một danh mục với phân trang
            var listProduct = objWebsiteASP_NETEntities.Product
                                .Where(n => n.CategoryId == id)
            .OrderBy(p => p.Id)  // Sắp xếp sản phẩm (nếu cần)
                                .Skip((page - 1) * pageSize)  // Bỏ qua các sản phẩm trước trang hiện tại
                                .Take(pageSize)  // Lấy sản phẩm cho trang hiện tại
                                .ToList();

            // Tổng số sản phẩm
            var totalItems = objWebsiteASP_NETEntities.Product.Count(n => n.CategoryId == id);
            var totalPages = (int)Math.Ceiling((double)totalItems / pageSize);  // Tính tổng số trang

            // Tạo ViewModel chứa thông tin phân trang
            var model = new ProductLisstViewModel
            {
                Products = listProduct,
                CurrentPage = page,
                TotalPages = totalPages,
                CategoryID = id
            };

            return View(model);
        }

    }
}