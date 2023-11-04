import 'package:flutter/material.dart';
import 'package:second/Login/login.dart';
import 'DetailAccounts.dart';
import '../customer_data.dart';
import '../QLDH/QLDH.dart';

class ManageCustomerAccountsPage extends StatefulWidget {
  @override
  _ManageCustomerAccountsPageState createState() =>
      _ManageCustomerAccountsPageState();
}

class _ManageCustomerAccountsPageState
    extends State<ManageCustomerAccountsPage> {
  List<Customer> customers = CustomerData.customers;

  Future<void> showConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                Icons.warning,
                color: Colors.red,
              ),
              SizedBox(width: 5),
              Text(
                'Xác nhận vô hiệu hóa tài khoản?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Bạn có chắc chắn muốn vô hiệu hóa tài khoản?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Xác nhận'),
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Vô hiệu hóa tài khoản thành công!'),
                  ),
                );
              },
            ),
            TextButton(
              child: Text('Hủy'),
              onPressed: () {
                Navigator.of(context).pop();
              },
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
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.black),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
            child: Text(
              'QUẢN LÝ TÀI KHOẢN KHÁCH HÀNG',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                hintText: 'Tìm kiếm',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: customers.length,
              itemBuilder: (context, index) {
                Customer customer = customers[index];
                return Container(
                  margin: EdgeInsets.all(16.0),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                    color: const Color.fromARGB(255, 233, 233, 233),
                  ),
                  child: Column(
                    children: [
                      Text(
                        customer.name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                  child: Text('Giới tính: ${customer.gender}'),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child:
                                      Text('Ngày sinh: ${customer.birthDate}'),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Số điện thoại: ${customer.phoneNumber}'),
                                Text('Địa chỉ: ${customer.address}'),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Column(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              new DetailAccounts(
                                                  customer: customer),
                                        ),
                                      );
                                    },
                                    child: Text('Xem chi tiết',
                                        style: TextStyle(color: Colors.black)),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      showConfirmationDialog(context);
                                    },
                                    child: Text(
                                      'Vô hiệu hóa',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 255, 0, 0)),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
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
