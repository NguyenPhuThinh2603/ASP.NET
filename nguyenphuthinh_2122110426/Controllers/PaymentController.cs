using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using nguyenphuthinh_2122110426.Context;
using nguyenphuthinh_2122110426.Models;

namespace nguyenphuthinh_2122110426.Controllers
{
    public class PaymentController : Controller
    {
        WebsiteASP_NETEntities objWebsiteASP_NETEntities = new WebsiteASP_NETEntities();
        public ActionResult Index()
        {
            if (Session["idUser"] == null)
            {
                return RedirectToAction("Login", "Home");
            }
            else
            {
                // lấy thông tin từ giỏ hàng trong session
                var istCart = (List<CartModel>)Session["cart"];

                // tạo dữ liệu cho Order
                Order objOrder = new Order();
                objOrder.Name = "DonHang-" + DateTime.Now.ToString("yyyyMMddHHmmss");
                objOrder.UserId = int.Parse(Session["idUser"].ToString());
                objOrder.CreatedOnUtc = DateTime.Now;
                objOrder.Status = 17;

                objWebsiteASP_NETEntities.Order.Add(objOrder);

                // lưu thông tin vào bảng Order
                objWebsiteASP_NETEntities.SaveChanges();

                // Lấy OrderId vừa tạo để lưu vào bảng OrderDetail
                int orderId = objOrder.Id;
                List<OrderDetail> lstOrderDetail = new List<OrderDetail>();

                foreach (var item in istCart)
                {
                    OrderDetail obj = new OrderDetail();
                    obj.Quantity = item.Quantity;
                    obj.OrderId = orderId;
                    obj.ProductId = item.Product.Id;
                    lstOrderDetail.Add(obj);
                }

                objWebsiteASP_NETEntities.OrderDetail.AddRange(lstOrderDetail);
                objWebsiteASP_NETEntities.SaveChanges();
                // Xóa giỏ hàng sau khi thanh toán thành công
                Session["cart"] = null; // Thêm dòng này để xóa giỏ hàng
            }

            return View();
        }


    }
}