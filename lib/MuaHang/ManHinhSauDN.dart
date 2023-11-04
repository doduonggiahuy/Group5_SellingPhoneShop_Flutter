import 'package:flutter/material.dart';
import 'ThongTinSP.dart';
import '../cart/cart.dart';
import '../QLTK/QLTK.dart';
import '../QLDM/QUANLYDONMUA.dart';

class MainScreen extends StatelessWidget {
  final List<String> imageUrls = [
    'assets/images/15pm256.png',
    'assets/images/13t128.png',
    'assets/images/14pm128.png',
    'assets/images/13pm128.png',
    'assets/images/15t128.png',
    'assets/images/14t128.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MUA HÀNG"),
        leading: BackButton(),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          // Thanh tìm kiếm
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Bạn muốn tìm gì?',
              ),
            ),
          ),
          // Banner cân đối với màn hình
          AspectRatio(
            aspectRatio: 690 / 300,
            child: Image.asset(
              'assets/images/banner15.png',
              fit: BoxFit.cover,
            ),
          ),
          // Khoảng cách giữa banner và danh mục sản phẩm
          SizedBox(height: 16.0),
          // Nút danh mục sản phẩm
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Nokia'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Apple'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Samsung'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Xiaomi'),
              ),
            ],
          ),
          // Khoảng cách giữa danh mục sản phẩm và danh sách hình ảnh
          SizedBox(height: 16.0),
          // Danh sách hình ảnh mới
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
              ),
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsScreen(),
                      ),
                    );
                  },
                  child: Image.asset(
                    imageUrls[index],
                    fit: BoxFit.contain,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 65),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Mycart(),
              ),
            );
          },
          child: Icon(Icons.shopping_cart),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
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
