<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MKSinhVien.aspx.cs" Inherits="QLDD.MKSinhVien" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

    <!-- Latest compiled and minified JS -->
    <script src="//code.jquery.com/jquery.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/<script src="></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
    <link rel="shortcut icon" href="img/logoVinh.png">
    <link href="css/Matkhau1.css" rel="stylesheet" />
    <title>Đổi mật khẩu</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <nav class="navbar navbar-default navbar-static-top color" role="navigation ">
                
                <img class='logo' src="img/logoVinh.png " alt=" ">

                <ul class="nav navbar-nav ">
                    <li class="active ">
                        <p href="# ">Vinh University</p>
                    </li>
                    <li class="accname ">
                       <asp:Label ID="accName" runat="server" Text="Label"></asp:Label>
                    </li>
                    <li class="dropdown">
                        <img class="avatar " src="img/user1.png" alt=" ">
                        <div class="dropdown-content">
                            <a href="#">Cài đặt</a>
                          <a href="Login.aspx">Đăng xuất</a>
                        </div>
                    </li>
                </ul>
            </nav>
        </div>
        <script>
            function myconfirm() {
                var result = confirm("Bạn có chắc chắn muốn đăng xuất?");
                if (result) {
                    //Response.redirect('Login.aspx');
                    return true;
                }
                else {
                    return false;
                }
            }
        </script>
        <!-- left menu -->
        <div>
            <div id="mySidenav" class="sidenav">
                 <a href="SinhVien.aspx"><i class="fas fa-address-card fw"></i>Hồ sơ cá nhân</a>
                <a href="#"><i class="fas fa-edit fw"></i>Quản lý điểm danh</a>
                <a href="PasswordGV.aspx"><i class="fas fa-key fw"></i>Quản lý mật khẩu</a>
            </div>

           
        </div>
        <!-- content -->
        <div id="content">
            <div class="content">
                <h1>Đổi mật khẩu</h1>
                <table style="width: 60%;">
                    <tr>
                        <td class="auto-style1">Mật khẩu cũ</td>
                        <td>
                            <asp:TextBox id="txtMKC" runat="server" class="form-control" Width="255px"></asp:TextBox>
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="auto-style1">Mật khẩu mới</td>
                        <td>
                            <asp:TextBox id="txtMKM" runat="server" class="form-control" Width="255px"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td class="auto-style1">Nhập lại mật khẩu</td>
                        <td>
                            <asp:TextBox id="txtNhaplai" runat="server" class="form-control" Width="255px"></asp:TextBox>
                        </td>
                    </tr>
                   
                    <tr>
                        <td class="auto-style1"></td>
                        <td>
                            <asp:Button id="btnCapnhat" runat="server" class="login100-form-btn" Text="Cập nhật" OnClick="btnCapnhat_Click" ></asp:Button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <footer>
            <div class="container-fluid footer ">
                <div class="row ">
                    <div class="col-md-3 connect ">
                        <img src="img/logoVinh.png" width="40px" height="40px" style="float: left;margin-top: 10px;margin-left: 10px;" />
                        <h3>TRƯỜNG ĐẠI HỌC VINH</h3>
                        <i class="fab fa-facebook "></i>
                        <i class="fab fa-facebook-messenger "></i>
                        <i class="fab fa-google-plus "></i>
                        <i class="fab fa-twitter "></i>

                    </div>
                    <div class="col-md-9 ">
                        
                        <div class="row ">
                            <div class="col-md-2 "><i class="fas fa-map-marker "></i></div>
                            <div class="col-md-10 ">
                                <span><b>Address:</b></span>
                                <p>182 Lê Duẩn - Thành Phố Vinh - Tỉnh Nghệ An</p>
                            </div>
                        </div>

                        <div class="row ">
                            <div class="col-md-2 "><i class="fas fa-phone"></i></div>
                            <div class="col-md-10 ">
                                <span><b>Phone:</b></span>
                                <p>(0238)3855.452</p>
                            </div>
                        </div>

                        <div class="row ">
                            <div class="col-md-2 "><i class="fas fa-fax "></i></div>
                            <div class="col-md-10 ">
                                <span><b>Fax:</b></span>
                                <p>(0238)3855.269 </p>
                            </div>
                        </div>

                        <div class="row ">
                            <div class="col-md-2 "><i class="fas fa-envelope "></i></div>
                            <div class="col-md-10 ">
                                <span><b>Email:</b></span>
                                <p>vinhuni@vinhuni.edu.vn</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </form>
</body>
</html>
