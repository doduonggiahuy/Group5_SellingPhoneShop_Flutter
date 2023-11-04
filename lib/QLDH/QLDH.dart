import 'package:flutter/material.dart';
import 'package:second/QLTKKH/ManageCustomerAccounts.dart';
import 'data.dart';
import 'CNDH.dart';
import 'TTDH.dart';

class QLDHPage extends StatefulWidget {
  @override
  _QLDHPageState createState() => _QLDHPageState();
}

class _QLDHPageState extends State<QLDHPage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quản lý đơn hàng"),
        leading: BackButton(),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Thanh tìm kiếm
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: "Tìm kiếm",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
              onChanged: (value) {
                // Xử lý tìm kiếm dựa trên giá trị trong searchController
                // Cập nhật danh sách hiển thị theo kết quả tìm kiếm
              },
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xffe3e3e3),
                  ),
                  child: ListTile(
                    title: Text(orders[index].orderName),
                    subtitle: Text(orders[index].orderID),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.update),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  CNDHPage(order: orders[index]),
                            ));
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            _showConfirmationDialog(context, orders[index]);
                          },
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              OrderDetailsPage(order: orders[index]),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        backgroundColor: Color.fromARGB(255, 197, 197, 197),
        iconSize: 24.0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'QLTKKH'),
          BottomNavigationBarItem(
              icon: Icon(Icons.note_alt_rounded), label: 'QLDH'),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_android),
            label: 'QLSP',
          ),
        ],
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ManageCustomerAccountsPage(),
              ),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QLDHPage(),
              ),
            );
          }
        },
      ),
    );
  }

  // Hàm hiển thị popup xác nhận vô hiệu hóa
  Future<void> _showConfirmationDialog(
      BuildContext context, Order order) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Xác nhận vô hiệu hóa đơn hàng"),
          content: Text("Bạn có muốn vô hiệu hóa đơn hàng này?"),
          actions: <Widget>[
            TextButton(
              child: Text("Hủy"),
              onPressed: () {
                Navigator.of(context).pop(); // Đóng popup
              },
            ),
            TextButton(
              child: Text("Xác nhận"),
              onPressed: () {
                // Xử lý vô hiệu hóa đơn hàng
                Navigator.of(context).pop(); // Đóng popup
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Vô hiệu hóa thành công"),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
