using nguyenphuthinh_2122110426.Context;
using nguyenphuthinh_2122110426.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using User = nguyenphuthinh_2122110426.Context.User;
namespace nguyenphuthinh_2122110426.Controllers
{
    public class HomeController : Controller
    {
        WebsiteASP_NETEntities objWebsiteASP_NETEntities = new WebsiteASP_NETEntities();

        public ActionResult Index()
        {
            HomeModel objHomeModel=new HomeModel();
            objHomeModel.ListCategory = objWebsiteASP_NETEntities.Category.ToList();
            objHomeModel.ListProduct = objWebsiteASP_NETEntities.Product.ToList();
           
            return View(objHomeModel);

        }
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(User _user)
        {
            if (ModelState.IsValid)
            {
                var check = objWebsiteASP_NETEntities.User.FirstOrDefault(s => s.Email == _user.Email);
                if (check == null)
                {
                    _user.Password = GetMD5(_user.Password);
                    objWebsiteASP_NETEntities.Configuration.ValidateOnSaveEnabled = false;
                    objWebsiteASP_NETEntities.User.Add(_user);
                    objWebsiteASP_NETEntities.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.error = "Email already exists";
                    return View();
                }
            }
            return View();
        }
        //create a string MD5
        public static string GetMD5(string str)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] fromData = Encoding.UTF8.GetBytes(str);
            byte[] targetData = md5.ComputeHash(fromData);
            string byte2String = null;

            for (int i = 0; i < targetData.Length; i++)
            {
                byte2String += targetData[i].ToString("x2");

            }
            return byte2String;
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        public ActionResult Login(string email, string password)
        {
            if (ModelState.IsValid)
            {


                var f_password = GetMD5(password);
                var data = objWebsiteASP_NETEntities.User.Where(s => s.Email.Equals(email) && s.Password.Equals(f_password)).ToList();
                if (data.Count() > 0)
                {
                    //add session
                    Session["FullName"] = data.FirstOrDefault().FirstName + " " + data.FirstOrDefault().LastName;
                    Session["Email"] = data.FirstOrDefault().Email;
                    Session["idUser"] = data.FirstOrDefault().Id;
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.error = "Login failed";
                    return RedirectToAction("Login");
                }
            }
            return View();
        }
        //Logout
        public ActionResult Logout()
        {
            Session.Clear();//remove session
            return RedirectToAction("Login");
        }

        public ActionResult Search(string query)
        {
            if (string.IsNullOrEmpty(query))
            {
                return View("SearchResults", new List<Product>()); // Không có kết quả
            }

            // Tìm kiếm sản phẩm theo tên hoặc mô tả
            var products = objWebsiteASP_NETEntities.Product
                .Where(p => p.Name.Contains(query) || p.ShortDes.Contains(query))
                .ToList();

            // Trả về view với danh sách sản phẩm tìm được
            return View("SearchResults", products);
        }
    }
}