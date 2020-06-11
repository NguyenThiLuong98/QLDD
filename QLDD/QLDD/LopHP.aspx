<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LopHP.aspx.cs" Inherits="QLDD.LopHP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"/>
    <link rel="shortcut icon" href="img/logoVinh.png"/>
    <link href="css/Hocphan.css" rel="stylesheet" />
    <title>Quản lý lớp học phần</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <nav class="navbar navbar-default navbar-static-top color " role="navigation ">
                
                <img class='logo' src="img/logoVinh.png " alt=" "/>

                <ul class="nav navbar-nav ">
                    <li class="active ">
                        <p href="#">Vinh University</p>
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
                    </div>
                    <br />
                    <div>
                        Mã sinh viên: 
                        <asp:TextBox ID="txtMsv" runat="server"></asp:TextBox>
                    </div>
                    <div class="label1">
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="date">
                       <asp:Button ID="btnThemsv" class="login-btn" runat="server" Text="Tìm kiếm" OnClick="btnThemsv_Click" />
                    </div>
                    
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="776px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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
                        <asp:BoundField DataField="GioiTinh" HeaderText="Giới tính" />
                        <asp:BoundField DataField="NgaySinh" HeaderText="Ngày sinh" />
                        <asp:BoundField DataField="Lop" HeaderText="Lớp" >
                        </asp:BoundField>
                        <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" />
                        <asp:BoundField DataField="MaDK" visible="false"/>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                
            </div>
            
            <div id="mymodal" class="form-modal" visible="false" runat="server">
                <div class="modal-dialog">
                    <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Thêm sinh viên</h4>
                                
                            </div>
                            <div class="modal-body">
                               <table style="width: 88%;">
                                <tr>
                                    <td class="style1">Mã sinh viên</td>
                                    <td>
                                        <asp:TextBox id="txtMasv" runat="server" class="form-control" Width="255px"></asp:TextBox>
                                    </td>
                                </tr>
                    
                                <tr>
                                    <td class="style1">Họ và Tên</td>
                                    <td>
                                        <asp:Label id="txtHoten" runat="server" class="form-control" Width="255px"></asp:Label>
                                    </td>
                                </tr>
                                   <tr>
                                    <td class="style1">Giới tính</td>
                                    <td>
                                        <asp:Label id="txtGT" runat="server" class="form-control" Width="255px"></asp:Label>
                                    </td>
                                </tr>
                                   <tr>
                                    <td class="style1">Ngày sinh</td>
                                    <td>
                                        <asp:Label id="txtNS" runat="server" class="form-control" Width="255px"></asp:Label>
                                    </td>
                                </tr>
                                 <tr>
                                    <td class="style1">Lớp</td>
                                    <td>
                                        <asp:Label id="txtLop" runat="server" class="form-control" Width="255px"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">Địa chỉ</td>
                                    <td>
                                        <asp:Label id="txtDiaChi" runat="server" class="form-control" Width="255px"></asp:Label>
                                    </td>
                                </tr>
                                
                             </table>
                            </div>
                            <div class="modal-footer">
                                
                                <asp:Button ID="btnCaphat" class="btn btn-success" runat="server" Text="Cập nhật" OnClick="btnCaphat_Click"  />
                                <asp:Button ID="btnDong" class="btn btn-default" runat="server" Text="Đóng" OnClick="btnDong_Click"  />
                            </div>
                    </div>
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
    <script>
        function showModal() {
            document.getElementById("pageContent").style.opacity = "0.5";
    </script>
</body>
</html>
