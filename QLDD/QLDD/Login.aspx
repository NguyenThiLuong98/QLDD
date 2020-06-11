<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="QLDD.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">

    <link href="css/Login.css" rel="stylesheet" />
    <link rel="shortcut icon" href="img/logoVinh.png">
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <img src="img/logoVinh.png" />
            <p>TRƯỜNG ĐẠI HỌC VINH</p>
            <p>PHẦN MỀM ĐIỂM DANH SINH VIÊN</p>
        </div>
        <div class="body"/>
            <div class="container"/>
                <div class="row"/>
                    <div class="col-md-4 login-sec">
                        <h2 class="text-center">Đăng nhập</h2>
                        <form class="login-form">
                            <div>
                                <label for="exampleInputEmail1" class="text-uppercase">Tên đăng nhập</label>
                                <input id="txtUsername" name="username" runat="server" type="text" class="form-control" placeholder=""/>
    
                            </div>
                            <div>
                                <label for="exampleInputPassword1" class="text-uppercase">Mật khẩu</label>
                                <input id="txtPassword" name="password" runat="server" type="password" class="form-control" placeholder=""/>
                            </div>  
                            <div >
                                <label class="form-check-label">
                                <input type="checkbox" class="form-check-input"/>
                                <small>Remember Me</small>
                                </label>
                                 <asp:Button id="btnDangnhap" runat="server" Text="Đăng nhập" class="btn btn-login float-right" OnClick="btnDangNhap_Click"/>
                                 
                            </div>
                        </form>
                    </div>
                           
                <div class="col-md-8 ">
                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                      <!-- Indicators -->
                      <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                      </ol>

                      <!-- Wrapper for slides -->
                      <div class="carousel-inner">
                        <div class="item active">
                          <img src="img/anhbia.jpg" alt="Los Angeles">
                        </div>

                        <div class="item">
                          <img src="img/anhbia3.jpg" alt="Chicago">
                        </div>

                        <div class="item">
                          <img src="img/anhbia2.jpg" alt="New York">
                        </div>
                      </div>

                      <!-- Left and right controls -->
                      <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                      </a>
                      <a class="right carousel-control" href="#myCarousel" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                      </a>
                    </div>
                </div>
    </form>
</body>
</html>
