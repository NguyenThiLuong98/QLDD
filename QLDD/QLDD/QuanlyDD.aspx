<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuanlyDD.aspx.cs" Inherits="QLDD.QuanlyDD" %>

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
    <link href="css/Diemdanh.css" rel="stylesheet" />
    <title>Quản lý điểm danh</title>
</head>
<body>
    <form id="form1" runat="server">
         <div class="header">
            <nav class="navbar navbar-default navbar-static-top color " role="navigation ">
                
                <img class='logo' src="img/logoVinh.png " alt=" "/>

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
                <a href="GiangVien.aspx"><i class="fas fa-address-card fw"></i>Hồ sơ cá nhân</a>
                <a href="LopHP.aspx"><i class="fas fa-address-book fw"></i>Quản lý lớp học phần</a>
                <a href="QuanlyDD.aspx"><i class="fas fa-edit fw"></i>Quản lý điểm danh</a>
                <a href="Doimatkhau.aspx"><i class="fas fa-key fw"></i>Quản lý mật khẩu</a>
            </div>

           
        </div>
        <!-- content -->
        <div id="content">
            <div class="content">
                <div>
                    <div>
                        Tên học phần:
                        <asp:DropDownList ID="DrMaHP" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DrMaHP_SelectedIndexChanged">
                        </asp:DropDownList>
                        <div class="date">
                            Ngày tháng: 
                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                    <br />
                    <div>
                        Buổi học: 
                        <asp:DropDownList ID="DrBuoi" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DrBuoi_SelectedIndexChanged">
                            <asp:ListItem Value="1">Buổi 1</asp:ListItem>
                            <asp:ListItem Value="2">Buổi 2</asp:ListItem>
                            <asp:ListItem Value="3">Buổi 3</asp:ListItem>
                            <asp:ListItem Value="4">Buổi 4</asp:ListItem>
                            <asp:ListItem Value="5">Buổi 5</asp:ListItem>
                            <asp:ListItem Value="6">Buổi 6</asp:ListItem>
                            <asp:ListItem Value="7">Buổi 7</asp:ListItem>
                            <asp:ListItem Value="8">Buổi 8</asp:ListItem>
                            <asp:ListItem Value="9">Buổi 9</asp:ListItem>
                            <asp:ListItem Value="10">Buổi 10</asp:ListItem>
                            <asp:ListItem Value="11">Buổi 11</asp:ListItem>
                            <asp:ListItem Value="12">Buổi 12</asp:ListItem>
                            <asp:ListItem Value="13">Buổi 13</asp:ListItem>
                            <asp:ListItem Value="14">Buổi 14</asp:ListItem>
                            <asp:ListItem Value="15">Buổi 15</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" Width="776px" OnRowDataBound="GridView1_RowDataBound" GridLines="Horizontal">
                    <Columns>
                        <asp:TemplateField HeaderText="STT">
                            <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Mssv" HeaderText="Mã sinh viên" >
                        </asp:BoundField>
                        <asp:BoundField DataField="HoTen" HeaderText="Họ và Tên" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Lop" HeaderText="Lớp" >
                        </asp:BoundField>
                         <asp:TemplateField HeaderText="Có mặt">
                            <ItemTemplate>
                                <asp:RadioButton ID="RadioButton1" GroupName="Options" runat="server" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Vắng">
                            <ItemTemplate>
                                <asp:RadioButton ID="RadioButton2" GroupName="Options" runat="server" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Có Phép">
                            <ItemTemplate>
                                <asp:RadioButton ID="RadioButton3" GroupName="Options" runat="server" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Muộn">
                            <ItemTemplate>
                                <asp:RadioButton ID="RadioButton4" GroupName="Options" runat="server" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Ghi Chú">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox1" class="form-control" runat="server" Text='<%# Eval("GhiChu") %>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label ID="lblTT" runat="server" visible="false" Text='<%# Eval("TinhTrang") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                       
                        <asp:BoundField DataField="MaDD" Visible="False" />
                       
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#487575" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#275353" />
                </asp:GridView>
                
            </div>
            <div >
                <asp:Button ID="btnDiemDanh" class="login100-form-btn" runat="server" Text="Điểm danh" OnClick="btnDiemDanh_Click"  />
            </div>
            <br />
                        <asp:Label ID="lblMaDD" runat="server" Text=""></asp:Label>
             <br />
                        <asp:Label ID="lblBuoi" runat="server" Text=""></asp:Label>
             <br />
                        <asp:Label ID="lbl" runat="server" Text=""></asp:Label>
             <br />
                        <asp:Label ID="lblGhiChu" runat="server" Text=""></asp:Label>
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
    <script>
        //function check() {
        //    document.getElementById("RadioButton1").check = true;
        //    document.getElementById("RadioButton2").check = false;
        //    document.getElementById("RadioButton3").check = false;
        //    document.getElementById("RadioButton4").check = false;
        //}
        //function check1() {
        //    document.getElementById("RadioButton1").check = false;
        //    document.getElementById("RadioButton2").check = true;
        //    document.getElementById("RadioButton3").check = false;
        //    document.getElementById("RadioButton4").check = false;
        //}
        //function check2() {
        //    document.getElementById("RadioButton1").check = false;
        //    document.getElementById("RadioButton2").check = false;
        //    document.getElementById("RadioButton3").check = true;
        //    document.getElementById("RadioButton4").check = false;
        //}
        //function check3() {
        //    document.getElementById("RadioButton1").check = false;
        //    document.getElementById("RadioButton2").check = false;
        //    document.getElementById("RadioButton3").check = false;
        //    document.getElementById("RadioButton4").check = true;
        //}
    </script>
</body>
</html>
