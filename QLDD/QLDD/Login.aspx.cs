using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLDD
{
    public partial class Login : System.Web.UI.Page
    {
        private ConnectDataContext db;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            db = new ConnectDataContext();
            string username = txtUsername.Value;
            string password = txtPassword.Value;
            var myquery = from i in db.TaiKhoans
                          join j in db.SinhViens on i.TenDN equals j.Mssv
                          where i.TenDN == username && i.MatKhau == password
                          select new { i.TenDN, j.HoTen };
            if (myquery.Any())
            {
                Session["id"] = myquery.First().TenDN;
                Session["username"] = myquery.First().HoTen;

                Response.Redirect("SinhVien.aspx");
            }
            else
            {
                var myquery1 = from i in db.TaiKhoans
                               join j in db.GiangViens on i.TenDN equals j.MaGV
                               where i.TenDN == username && i.MatKhau == password
                               select new { i.TenDN, j.HoTen };
                if (myquery1.Any())
                {
                    Session["id"] = myquery1.First().TenDN;
                    Session["username"] = myquery1.First().HoTen;
                    Response.Redirect("GiangVien.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Đăng nhập thất bại mời thử lại')</script>");
                }
            }
        }
    }
}