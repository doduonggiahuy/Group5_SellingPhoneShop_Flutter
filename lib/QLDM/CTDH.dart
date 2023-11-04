import 'package:flutter/material.dart';
import 'QUANLYDONMUA.dart';
import '../QLTK/QLTK.dart';
import '../MuaHang/ManHinhSauDN.dart';

class CTDH extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông tin đơn hàng".toUpperCase()),
        leading: BackButton(),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              title: Text('Mã Đơn Hàng: MDH01'),
              trailing: IconButton(
                icon: Icon(Icons.copy),
                onPressed: () {
                  // Xử lý sao chép mã đơn hàng
                },
              ),
            ),
            ListTile(
              title: Text(
                  'Địa Chỉ Nhận Hàng: 57 Ngũ Hành Sơn, Mỹ An, Ngũ Hàng Sơn, Đà Nẵng'),
            ),
            ListTile(
              title: Text('Lịch Sử Đặt Hàng: 1/11/2023 '),
            ),
            ListTile(
              title: Text('Sản Phẩm: Iphone 14'),
              subtitle: Column(
                children: [
                  Image.asset(
                    'assets/images/14promax.png',
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Tổng Tiền: 15000000.00'),
            ),
            ListTile(
              title: Text('Phương Thức Thanh Toán: Tiền mặt'),
            ),
            ListTile(
              title: Text('Trạng Thái: Đang Giao Hàng'),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  // Xử lý Huỷ Đơn Mua
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('XÁC NHẬN HUỶ ĐƠN MUA NÀY KHÔNG?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Đóng hộp thoại
                              _showCancelledDialog(context);
                            },
                            child: Text('Có'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Đóng hộp thoại
                            },
                            child: Text('Không'),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                ),
                child: Text('Huỷ Đơn Mua'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        backgroundColor: Color.fromARGB(255, 197, 197, 197),
        iconSize: 24.0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Mua hàng'),
          BottomNavigationBarItem(
              icon: Icon(Icons.note_alt_rounded), label: 'Lịch sử đơn mua'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Tài khoản',
          ),
        ],
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MainScreen(),
              ),
            );
          } else if (index == 1) {
            // Điều hướng đến trang QLDM khi ấn vào mục Lịch sử đơn mua
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QLDM(),
              ),
            );
          } else if (index == 2) {
            // Điều hướng đến trang AccountPage khi ấn vào mục Tài khoản
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AccountPage(),
              ),
            );
          }
        },
      ),
    );
  }

  // Hàm hiển thị thông báo "Huỷ đơn hàng thành công"
  void _showCancelledDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Huỷ đơn hàng thành công!!!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng hộp thoại
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
