using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLDD
{
    public partial class MKSinhVien : System.Web.UI.Page
    {
        private ConnectDataContext db;
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = Session["username"].ToString();
            accName.Text = username;
        }

        protected void btnCapnhat_Click(object sender, EventArgs e)
        {
            string id = Session["id"].ToString();
            db = new ConnectDataContext();
            var query = from i in db.TaiKhoans
                        where i.TenDN == id
                        select i;
            if (id == query.First().TenDN)
            {
                if (query.Any())
                {
                    if (txtMKM.Text == txtNhaplai.Text)
                    {
                        TaiKhoan myAcc = query.First();
                        myAcc.MatKhau = txtMKM.Text;
                        db.SubmitChanges();
                        Response.Write("<script>alert('Đổi mật khẩu thành công'); window.location.href = 'Doimatkhau.aspx'</script>");
                        //Response.Redirect("PasswordGv.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Mật khẩu nhập lại không đúng');</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Mật khẩu cũ sai!');</script>");
                }
            }
        }
    }
}