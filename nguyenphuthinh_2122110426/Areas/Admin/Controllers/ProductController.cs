using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using nguyenphuthinh_2122110426.Context;

namespace nguyenphuthinh_2122110426.Areas.Admin.Controllers
{

    public class ProductController : Controller
    {
        WebsiteASP_NETEntities objWebsiteASP_NETEntities = new WebsiteASP_NETEntities();
        // GET: Admin/Product
        public ActionResult Index()
        {
            var lstProduct = objWebsiteASP_NETEntities.Product.ToList();
            return View(lstProduct);
        }
        public ActionResult Details(int Id)
        {
            var objProduct = objWebsiteASP_NETEntities.Product.Where(n => n.Id == Id).FirstOrDefault();
            return View(objProduct);
        }
        [HttpGet]
        public ActionResult Delete(int Id)
        {
            var objProduct = objWebsiteASP_NETEntities.Product.Where(n => n.Id == Id).FirstOrDefault();
            return View(objProduct);
        }
        [HttpPost]
        public ActionResult Delete(Product objPro)
        {
            var objProduct = objWebsiteASP_NETEntities.Product.Where(n => n.Id == objPro.Id).FirstOrDefault();

            objWebsiteASP_NETEntities.Product.Remove(objProduct);
            objWebsiteASP_NETEntities.SaveChanges();
            return RedirectToAction("Index");
        }
  
        [HttpGet]
        public ActionResult Edit(int? id)
        {
            if (id == null) return HttpNotFound();

            var product = objWebsiteASP_NETEntities.Product.Find(id);
            if (product == null) return HttpNotFound();

            ViewBag.CategoryID = new SelectList(objWebsiteASP_NETEntities.Category, "CategoryID", "CategoryName", product.Id);
            ViewBag.BrandID = new SelectList(objWebsiteASP_NETEntities.Brand, "BrandID", "BrandName", product.Id);
            return View(product);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Product product, HttpPostedFileBase ProductImage)
        {
            if (ModelState.IsValid)
            {
                if (ProductImage != null && ProductImage.ContentLength > 0)
                {
                    // Lưu hình ảnh vào thư mục Images (hoặc thư mục bạn muốn)
                    var fileName = Path.GetFileName(ProductImage.FileName);
                    var path = Path.Combine(Server.MapPath("~/Content/images/items/"), fileName);

                    // Kiểm tra nếu thư mục không tồn tại, tạo mới thư mục
                    var directory = Path.GetDirectoryName(path);
                    if (!Directory.Exists(directory))
                    {
                        Directory.CreateDirectory(directory);
                    }

                    // Lưu tệp hình ảnh
                    ProductImage.SaveAs(path);

                    // Lưu tên file hình ảnh vào thuộc tính ProductImage
                    product.Avatar = fileName;
                }

                objWebsiteASP_NETEntities.Entry(product).State = EntityState.Modified;
                objWebsiteASP_NETEntities.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(product);
        }
        [HttpGet]
        public ActionResult Create()
        {
            // Lấy danh sách danh mục từ cơ sở dữ liệu
            var categories = objWebsiteASP_NETEntities.Category.ToList();

            // Tạo SelectList và gán vào ViewBag
            ViewBag.CategoryId = new SelectList(categories, "Id", "Name");

            // Lấy danh sách thương hiệu từ cơ sở dữ liệu
            var brands = objWebsiteASP_NETEntities.Brand.ToList();

            // Gán SelectList vào ViewBag
            ViewBag.BrandId = new SelectList(brands, "Id", "Name");

            return View();
        }

        [HttpPost]
        public ActionResult Create(Product objProduct)
        {
            try
            {
                if (objProduct.ImageUpload != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(objProduct.ImageUpload.FileName);
                    string extension = Path.GetExtension(objProduct.ImageUpload.FileName);
                    fileName = fileName + "_" + long.Parse(DateTime.Now.ToString("yyyyMMddhhmmss")) + extension;
                    objProduct.Avatar = fileName;
                    objProduct.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/images/"), fileName));
                }
                objWebsiteASP_NETEntities.Product.Add(objProduct);
                objWebsiteASP_NETEntities.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception)

            {
                return RedirectToAction("Index");
            }

        }
    }
}