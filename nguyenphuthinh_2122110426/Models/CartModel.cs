using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using nguyenphuthinh_2122110426.Context;

namespace nguyenphuthinh_2122110426.Models
{
    public class CartModel
    {
        public Product Product { get; set; }
        public int Quantity { get; set; }
    }
}