import 'package:flutter/material.dart';
import 'package:second/QLDH/QLDH.dart';
import 'package:second/QLTKKH/ManageCustomerAccounts.dart';
import 'data.dart';

class CNDHPage extends StatefulWidget {
  final Order order;

  CNDHPage({required this.order});

  @override
  _CNDHPageState createState() => _CNDHPageState();
}

class _CNDHPageState extends State<CNDHPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cập nhật đơn hàng"),
        leading: BackButton(),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormFieldWithEditIcon("Tên đơn hàng", widget.order.orderName),
            SizedBox(
              height: 16,
            ),
            TextFormFieldWithEditIcon("Mã đơn hàng", widget.order.orderID),
            SizedBox(
              height: 16,
            ),
            TextFormFieldWithEditIcon("Mã khách hàng", widget.order.customerID),
            SizedBox(
              height: 16,
            ),
            TextFormFieldWithEditIcon("Ngày đặt", widget.order.orderDate),
            SizedBox(
              height: 16,
            ),
            TextFormFieldWithEditIcon("Địa chỉ", widget.order.address),
            SizedBox(
              height: 16,
            ),
            TextFormFieldWithEditIcon(
                "Trạng thái đơn hàng", widget.order.orderStatus),
            SizedBox(
              height: 16,
            ),
            TextFormFieldWithEditIcon(
                "Phương thức thanh toán", widget.order.paymentMethod),
            SizedBox(
              height: 16,
            ),
            TextFormFieldWithEditIcon(
                "Tổng tiền", widget.order.totalAmount.toStringAsFixed(2)),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                // Xử lý lưu đơn hàng
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Lưu đơn hàng thành công"),
                  ),
                );
              },
              child: Text("Lưu"),
            ),
          ],
        ),
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
}

class TextFormFieldWithEditIcon extends StatelessWidget {
  final String labelText;
  final String initialValue;

  TextFormFieldWithEditIcon(this.labelText, this.initialValue);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            initialValue: initialValue,
            decoration: InputDecoration(
              labelText: labelText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            // Xử lý sửa thông tin
          },
        ),
      ],
    );
  }
}
