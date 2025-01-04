﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using nguyenphuthinh_2122110426.Context;

namespace nguyenphuthinh_2122110426.Models
{

        public class ProductLisstViewModel
        {
            public List<Product> Products { get; set; }  // Danh sách sản phẩm
            public int CurrentPage { get; set; }  // Trang hiện tại
            public int TotalPages { get; set; }  // Tổng số trang
            public int CategoryID { get; set; }  // ID danh mục (để biết đang xem sản phẩm của danh mục nào)
    }
   
}