using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLDD
{
    public partial class QuanlyDD : System.Web.UI.Page
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

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int row = Convert.ToInt32(e.CommandArgument);
            lblMaDD.Text = GridView1.Rows[row].Cells[10].Text;
            lblGhiChu.Text = GridView1.Rows[row].Cells[8].Text;
        }

        protected void DrMaHP_SelectedIndexChanged(object sender, EventArgs e)
        {
            var myQuery = from a in db.DiemDanhs
                          join b in db.Dangkyhocs on a.MaDK equals b.MaDK
                          join c in db.SinhViens on b.Mssv equals c.Mssv
                          where b.MaMon == DrMaHP.SelectedValue.ToString() && a.Buoi == Convert.ToInt32(DrBuoi.SelectedValue.ToString())
                          select new
                          {
                              c.Mssv,
                              c.HoTen,
                              c.Lop,
                              a.TinhTrang,
                              a.GhiChu,
                              a.NgayDD
                          };
            if (myQuery.Any())
            {
                Label1.Text = myQuery.First().NgayDD;
            }
            
            GridView1.DataSource = myQuery;
            GridView1.DataBind();
        }

        protected void btnDiemDanh_Click(object sender, EventArgs e)
        {
            
            //string mdd= lblMaDD.Text;
            //var query = from i in db.DiemDanhs
            //            where i.MaDD == Convert.ToInt32(mdd)
            //            select i;
            //DiemDanh dd = query.First();
            //dd.Buoi = Convert.ToInt32(DrBuoi.SelectedValue.ToString());
            //dd.GhiChu = lblGhiChu.Text;
            //db.SubmitChanges();
            //Response.Write("<script>alert('Điểm danh thành công')</script>");
        }

        protected void DrBuoi_SelectedIndexChanged(object sender, EventArgs e)
        {
            var myQuery = from a in db.DiemDanhs
                          join b in db.Dangkyhocs on a.MaDK equals b.MaDK
                          join c in db.SinhViens on b.Mssv equals c.Mssv
                          where b.MaMon == DrMaHP.SelectedValue.ToString() && a.Buoi == Convert.ToInt32(DrBuoi.SelectedValue.ToString())
                          select new
                          {
                              c.Mssv,
                              c.HoTen,
                              c.Lop,
                              a.TinhTrang,
                              a.GhiChu,
                              a.NgayDD
                          };
            if (myQuery.Any())
            {
                Label1.Text = myQuery.First().NgayDD;
            }
            GridView1.DataSource = myQuery;
            GridView1.DataBind();
        }
        
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            RadioButton c1 = e.Row.FindControl("RadioButton1") as RadioButton;
            RadioButton c2 = e.Row.FindControl("RadioButton2") as RadioButton;
            RadioButton c3 = e.Row.FindControl("RadioButton3") as RadioButton;
            RadioButton c4 = e.Row.FindControl("RadioButton4") as RadioButton;
            Label tt = e.Row.FindControl("lblTT") as Label;
            if (c1 != null && tt.Text == "")
            {
                c1.Checked = true;
            }
            if (c1 != null && tt.Text=="0")
            {
                c1.Checked = true;
            }
            if (c2 != null && tt.Text == "1")
            {
                c2.Checked = true;
            }
            if (c3 != null && tt.Text == "2")
            {
                c3.Checked = true;
            }
            if (c4 != null && tt.Text == "3")
            {
                c4.Checked = true;
            }

        }


        
    }
}