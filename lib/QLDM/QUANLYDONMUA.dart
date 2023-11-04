import 'package:flutter/material.dart';
import 'CTDH.dart';
import '../MuaHang/ManHinhSauDN.dart';
import '../QLTK/QLTK.dart';

class Order {
  final int stt;
  final String orderCode;
  final String status;

  Order(this.stt, this.orderCode, this.status);
}

class QLDM extends StatelessWidget {
  final List<Order> orders = [
    Order(1, 'MDH01', 'Đang xử lý'),
    Order(2, 'MDH02', 'Hoàn Thành'),
    Order(3, 'MDH03', 'Đã Huỷ'),
    Order(4, 'MDH04', 'Hoàn Thành'),
    Order(5, 'MDH06', 'Hoàn Thành'),
    Order(6, 'MDH08', 'Đã Huỷ'),
    Order(7, 'MDH11', 'Đã Huỷ'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quản lý đơn mua".toUpperCase()),
        leading: BackButton(),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text('STT', textAlign: TextAlign.center),
              ),
              Expanded(
                child: Text('Mã Đơn Hàng', textAlign: TextAlign.center),
              ),
              Expanded(
                child: Text('Trạng Thái', textAlign: TextAlign.center),
              ),
              Expanded(
                child:
                    Container(), // Khoảng trống cho biểu tượng "Xem Chi Tiết Đơn Hàng" và "Xoá Đơn Hàng"
              ),
            ],
          ),
          Divider(),
          ListView.builder(
            shrinkWrap: true,
            itemCount: orders.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton(
                        onPressed: () {
                          // Xử lý khi người dùng nhấn vào nút đơn hàng
                        },
                        child: Text(
                          orders[index].stt.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton(
                        onPressed: () {
                          // Xử lý khi người dùng nhấn vào nút đơn hàng
                        },
                        child: Text(
                          orders[index].orderCode,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton(
                        onPressed: () {
                          // Xử lý khi người dùng nhấn vào nút đơn hàng
                        },
                        child: Text(
                          orders[index].status,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove_red_eye),
                          onPressed: () {
                            // Chuyển đến trang Chi Tiết Đơn Hàng (CTDH.dart)
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CTDH(),
                            ));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
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
}
