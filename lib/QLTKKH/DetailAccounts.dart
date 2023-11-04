import 'package:flutter/material.dart';
import '../customer_data.dart';
import 'ManageCustomerAccounts.dart';
import '../QLDH/QLDH.dart';

class DetailAccounts extends StatelessWidget {
  final Customer customer;

  DetailAccounts({required this.customer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        // Đảm bảo tính responsive bằng cách sử dụng SingleChildScrollView
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'QUẢN LÝ TÀI KHOẢN KHÁCH HÀNG',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    alignment: Alignment.center, // Căn giữa văn bản
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      'THÔNG TIN CHI TIẾT KHÁCH HÀNG',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Mã khách hàng:'),
                      SizedBox(width: 8),
                      Text(customer.customerID),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Họ tên:'),
                            Text(customer.name),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Giới tính:'),
                            Text(customer.gender),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Ngày sinh:'),
                            Text(customer.birthDate),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Số điện thoại:'),
                            Text(customer.phoneNumber),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Text('Địa chỉ:'),
                      Text(customer.address),
                      SizedBox(height: 16),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 233, 233, 233),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'LỊCH SỬ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Table(border: TableBorder.all(), children: <TableRow>[
                    TableRow(children: <Widget>[
                      TableCell(
                          child: Center(
                              child: Text('Đơn hàng',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          verticalAlignment: TableCellVerticalAlignment.middle),
                      TableCell(
                          child: Center(
                              child: Text('Ngày',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          verticalAlignment: TableCellVerticalAlignment.middle),
                      TableCell(
                          child: Center(
                              child: Text('Thời gian',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          verticalAlignment: TableCellVerticalAlignment.middle),
                      TableCell(
                          child: Center(
                              child: Text('Trạng thái',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          verticalAlignment: TableCellVerticalAlignment.middle),
                    ]),
                    TableRow(children: <Widget>[
                      TableCell(
                          child: Center(child: Text('D001')),
                          verticalAlignment: TableCellVerticalAlignment.middle),
                      TableCell(
                          child: Center(child: Text('01/01/2022')),
                          verticalAlignment: TableCellVerticalAlignment.middle),
                      TableCell(
                          child: Center(child: Text('12h00')),
                          verticalAlignment: TableCellVerticalAlignment.middle),
                      TableCell(
                          child: Center(child: Text('Đã giao hàng')),
                          verticalAlignment: TableCellVerticalAlignment.middle),
                    ]),
                    TableRow(children: <Widget>[
                      TableCell(
                          child: Center(child: Text('D001')),
                          verticalAlignment: TableCellVerticalAlignment.middle),
                      TableCell(
                          child: Center(child: Text('02/01/2022')),
                          verticalAlignment: TableCellVerticalAlignment.middle),
                      TableCell(
                          child: Center(child: Text('14h00')),
                          verticalAlignment: TableCellVerticalAlignment.middle),
                      TableCell(
                          child: Center(child: Text('Đang vận chuyển')),
                          verticalAlignment: TableCellVerticalAlignment.middle),
                    ]),
                  ]),
                ],
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
