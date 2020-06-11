using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLDD
{
    public partial class SinhVien1 : System.Web.UI.Page
    {
        private ConnectDataContext db;
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Session["id"].ToString();
            string username = Session["username"].ToString();

            db = new ConnectDataContext();

            if (!IsPostBack)
            {

                var query = from a in db.SinhViens
                            where a.Mssv == id
                            select a;
                            
                txtMssv.Text = query.First().Mssv;
                txtHoTen.Text = query.First().HoTen;
                txtGioiTinh.Text = query.First().GioiTinh;
                txtNgaySinh.Text = query.First().NgaySinh;
                txtLop.Text = query.First().Lop;
                txtDiaChi.Text = query.First().DiaChi;
                accName.Text = username;
            }
        }

        protected void btnCapnhat_Click(object sender, EventArgs e)
        {
            var myQuery1 = from i in db.SinhViens
                          where i.Mssv == txtMssv.Text
                          select i;
            
            SinhVien sv = myQuery1.First();

            sv.HoTen = txtHoTen.Text;
            sv.GioiTinh = txtGioiTinh.Text;
            sv.NgaySinh = txtNgaySinh.Text;
            sv.Lop = txtLop.Text;
            sv.DiaChi = txtDiaChi.Text;
            db.SubmitChanges();
            Response.Write("<script>alert('Cập nhật hồ sơ thành công')</script>");
        }
    }
}