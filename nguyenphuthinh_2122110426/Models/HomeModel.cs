using nguyenphuthinh_2122110426.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace nguyenphuthinh_2122110426.Models
{
    public class HomeModel
    {
        public List<Product> ListProduct{ get; set; }
        public List<Category>ListCategory { get; set; }
    }
}