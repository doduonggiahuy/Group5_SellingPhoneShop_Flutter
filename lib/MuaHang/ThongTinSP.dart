import 'package:flutter/material.dart';
import 'ManHinhSauDN.dart';
import '../QLDM/QUANLYDONMUA.dart';
import '../QLTK/QLTK.dart';

class ProductDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductDetailsWidget(),
    );
  }
}

class ProductDetailsWidget extends StatefulWidget {
  @override
  _ProductDetailsWidgetState createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  String? selectedProduct;
  int quantity = 1;

  List<String> productTypes = ['Gold', 'Deep Purple', 'Silver', 'Space_Black'];

  void _showProductDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:
              Text('Chi tiết sản phẩm', style: TextStyle(fontFamily: 'Roboto')),
          content: Text(
            'Máy mới 100%, chính hãng Apple Việt Nam.\n'
            'CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam.\n'
            'Hộp, Sách hướng dẫn, Cây lấy sim, Cáp Lightning - Type C.\n'
            '1 ĐỔI 1 trong 30 ngày nếu có lỗi phần cứng nhà sản xuất. Bảo hành 12 tháng tại trung tâm bảo hành chính hãng Apple: CareS.\n'
            'Giá sản phẩm đã bao gồm VAT.',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Roboto',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Đóng', style: TextStyle(fontFamily: 'Roboto')),
            ),
          ],
        );
      },
    );
  }

  void _showBuyNowDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Chọn sản phẩm và số lượng',
              style: TextStyle(fontFamily: 'Roboto')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Wrap(
                spacing: 8.0,
                children: productTypes.map((type) {
                  return ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedProduct = type;
                      });
                    },
                    child: Text(type, style: TextStyle(fontFamily: 'Roboto')),
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Số lượng', style: TextStyle(fontFamily: 'Roboto')),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          if (quantity > 1) {
                            setState(() {
                              quantity--;
                            });
                          }
                        },
                        child:
                            Text('-', style: TextStyle(fontFamily: 'Roboto')),
                      ),
                      Text(quantity.toString(),
                          style: TextStyle(fontFamily: 'Roboto', fontSize: 16)),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        child:
                            Text('+', style: TextStyle(fontFamily: 'Roboto')),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Đóng', style: TextStyle(fontFamily: 'Roboto')),
            ),
            ElevatedButton(
              onPressed: () {
                if (selectedProduct != null && quantity > 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Bạn đã chọn sản phẩm: $selectedProduct, Số lượng: $quantity'),
                    ),
                  );
                }
                Navigator.of(context).pop();
              },
              child: Text('Mua ngay', style: TextStyle(fontFamily: 'Roboto')),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("THÔNG TIN SẢN PHẨM"),
        leading: BackButton(),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 200,
              child: Image.asset('assets/images/noname.png'),
            ),
            SizedBox(height: 16.0),
            Text(
              'IPhone 14 Pro Max 128GB',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            Text(
              'Giá: 33,999,000 VND',
              style: TextStyle(
                fontSize: 18,
                color: Colors.red,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Miễn phí trả hàng',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            Text(
              'Chính hãng 100%',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            Text(
              'Giao hàng miễn phí',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    _showProductDetails(context);
                  },
                  child: Text(
                    'Chi tiết sản phẩm',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                Icon(Icons.arrow_forward, size: 24),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    _showBuyNowDialog(context);
                  },
                  child:
                      Text('Mua ngay', style: TextStyle(fontFamily: 'Roboto')),
                ),
              ),
            ),
          ],
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
