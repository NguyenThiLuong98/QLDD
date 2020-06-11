using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLDD
{
    public partial class GiangVien1 : System.Web.UI.Page
    {
        private ConnectDataContext db;
        protected void Page_Load(object sender, EventArgs e)
        {

            string id = Session["id"].ToString();
            string username = Session["username"].ToString();

            db = new ConnectDataContext();
            if (!IsPostBack)
            {

                var query = from a in db.GiangViens
                            join b in db.ChuyenMons on a.MaCM equals b.MaCM
                            where a.MaGV == id
                            select new
                            {
                                a.MaGV,
                                a.HoTen,
                                a.GioiTinh,
                                a.TrinhDo,
                                a.ChucVu,
                                b.TenCM
                            };
                txtMagv.Text = id;
                txtHoten.Text = query.First().HoTen;
                txtGioiTinh.Text = query.First().GioiTinh;
                txtTrinhdo.Text = query.First().TrinhDo;
                txtChucvu.Text = query.First().ChucVu;
                txtChuyenmon.Text = query.First().TenCM;
                accName.Text = username;
            }
        }

        protected void btnCapnhat_Click(object sender, EventArgs e)
        {
            var myQuery = from i in db.GiangViens
                          where i.MaGV == txtMagv.Text
                          select i;
            GiangVien gv = myQuery.First();

            gv.HoTen = txtHoten.Text;
            gv.GioiTinh = txtGioiTinh.Text;
            gv.TrinhDo = txtTrinhdo.Text;
            gv.ChucVu = txtChucvu.Text;
            db.SubmitChanges();
            Response.Write("<script>alert('Cập nhật hồ sơ thành công')</script>");
            
        }
    }
}