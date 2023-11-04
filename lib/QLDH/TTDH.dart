import 'package:flutter/material.dart';
import 'package:second/QLDH/QLDH.dart';
import 'package:second/QLTKKH/ManageCustomerAccounts.dart';
import 'data.dart';

class OrderInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông tin đơn hàng"),
        leading: BackButton(),
        elevation: 0,
        centerTitle: true,
      ),
      body: OrderList(),
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

class OrderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return ListTile(
          title: Text("Mã đơn hàng: ${order.orderID}"),
          subtitle: Text("Số điện thoại: ${order.customerID}"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  // Xử lý cập nhật đơn hàng
                },
              ),
              IconButton(
                icon: Icon(Icons.block),
                onPressed: () {
                  // Xử lý vô hiệu hóa đơn hàng
                },
              ),
            ],
          ),
          onTap: () {
            // Mở trang chi tiết đơn hàng khi nhấn vào đơn hàng
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderDetailsPage(order: order),
              ),
            );
          },
        );
      },
    );
  }
}

class OrderDetailsPage extends StatelessWidget {
  final Order order;

  OrderDetailsPage({required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông tin đơn hàng"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Mã đơn hàng: ${order.orderID}"),
            Text("Số điện thoại: ${order.customerID}"),
            Text("Tên đơn hàng: ${order.orderName}"),
            Text("Ngày đặt: ${order.orderDate}"),
            Text("Địa chỉ: ${order.address}"),
            Text("Trạng thái đơn hàng: ${order.orderStatus}"),
            Text("Phương thức thanh toán: ${order.paymentMethod}"),
            Text("Tổng tiền: ${order.totalAmount.toStringAsFixed(2)}"),
          ],
        ),
      ),
    );
  }
}
