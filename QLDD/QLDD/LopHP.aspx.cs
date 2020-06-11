using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLDD
{
    public partial class LopHP : System.Web.UI.Page
    {
        private ConnectDataContext db;
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = Session["username"].ToString();
            string id = Session["id"].ToString();
            accName.Text = username;
            db = new ConnectDataContext();
            if (!IsPostBack)
            {
                var myQuery = from i in db.MonHocs
                              where i.MaGV == id
                              select i;
                DrMaHP.DataSource = myQuery;
                DrMaHP.DataValueField = "MaMon";
                DrMaHP.DataTextField = "TenMon";
                DrMaHP.DataBind();
                DrMaHP_SelectedIndexChanged(sender, e);



            }
        }

        protected void DrMaHP_SelectedIndexChanged(object sender, EventArgs e)
        {
            var myQuery = from a in db.Dangkyhocs
                          join c in db.SinhViens on a.Mssv equals c.Mssv
                          where a.MaMon == DrMaHP.SelectedValue.ToString()
                          select new { 
                              c.Mssv, c.HoTen, c.GioiTinh, c.NgaySinh, c.Lop, c.DiaChi, a.MaDK
                          };
            
            GridView1.DataSource = myQuery;
            GridView1.DataBind();
        }

        protected void btnThemsv_Click(object sender, EventArgs e)
        {
            
            var query = from i in db.SinhViens
                        where i.Mssv== txtMsv.Text
                        select i;

            if (query.Any())
            {
                Label1.Text = "";
                mymodal.Visible = true;
                txtMasv.Text = query.First().Mssv;
                txtHoten.Text = query.First().HoTen;
                txtGT.Text = query.First().GioiTinh;
                txtNS.Text = query.First().GioiTinh;
                txtLop.Text = query.First().Lop;
                txtDiaChi.Text = query.First().DiaChi;
            }
            else
            {
                Label1.Text = "Sinh viên này không tồn tại!";
                
            }
            var query1 = from i in db.Dangkyhocs
                         where i.Mssv == txtMsv.Text && i.MaMon == DrMaHP.SelectedValue.ToString()
                         select i;
            if (query1.Any())
            {
                Label1.Text = "Sinh viên này đã có trong lớp!";
                mymodal.Visible = false;
                
            }
            
        }

        protected void btnDong_Click(object sender, EventArgs e)
        {
            mymodal.Visible = false;
        }

        protected void btnCaphat_Click(object sender, EventArgs e)
        {

            Dangkyhoc dkh = new Dangkyhoc();
            dkh.MaMon = DrMaHP.SelectedValue.ToString();
            dkh.Mssv = txtMasv.Text;
            db.Dangkyhocs.InsertOnSubmit(dkh);
            db.SubmitChanges();
            DrMaHP_SelectedIndexChanged(sender, e);
            mymodal.Visible = false;

            int rowclass = GridView1.Rows.Count - 1;
            string mdk = GridView1.Rows[rowclass].Cells[7].Text;
            
            DiemDanh dd = new DiemDanh();
            dd.MaDK = Convert.ToInt32(mdk);
            dd.Buoi = 1;
            db.DiemDanhs.InsertOnSubmit(dd);
            db.SubmitChanges();
        }
    }
}