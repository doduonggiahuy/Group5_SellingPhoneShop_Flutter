import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cart order.dart';
import '../QLDM/QUANLYDONMUA.dart';
import '../QLTK/QLTK.dart';
import '../MuaHang/ManHinhSauDN.dart';

class Mycart extends StatelessWidget {
  List imageList = [
    "assets/images/lap.jpg",
    "assets/images/14.jpg",
    "assets/images/15.jpg",
  ];
  List product = [
    "MacBook Air ",
    "Iphone 14 Pro",
    "Iphone 15 Pro",
  ];
  List price = [
    "23.000.000đ",
    "21.000.000đ",
    "22.000.000đ",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Giỏ Hàng"),
        leading: BackButton(),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Container(
                child: ListView.builder(
                  itemCount: imageList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Checkbox(
                            splashRadius: 15,
                            activeColor: Color(0xFFDB3022),
                            value: true,
                            onChanged: (val) {},
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              imageList[index],
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product[index],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Apple",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                price[index],
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(CupertinoIcons.minus),
                              SizedBox(width: 20),
                              Text(
                                "1",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(CupertinoIcons.plus),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Nhập Voucher',
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Chọn Tất Cả",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Checkbox(
                    splashRadius: 20,
                    activeColor: Colors.red,
                    value: false,
                    onChanged: (val) {},
                  ),
                ],
              ),
              Divider(height: 20, thickness: 2),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tổng Tiền",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "66.000.000đ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              InkWell(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    minimumSize: Size(400.0, 0),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Myorder(),
                      ),
                    );
                  },
                  child: Text('Thanh toán', style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
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
