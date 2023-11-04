import 'package:flutter/material.dart';
import 'Login.dart';

class ChangePasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Đổi mật khẩu',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Hình ảnh ở giữa màn hình
            Container(
              margin: EdgeInsets.all(16),
              child: Image.asset('assets/images/smartphone.png'),
            ),

            // 2 trường input nhập mật khẩu mới và xác nhận mật khẩu mới
            Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        labelText: 'Mật khẩu mới',
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        labelText: 'Xác nhận mật khẩu mới',
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Nút Đổi mật khẩu
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                minimumSize: Size(200, 50),
              ),
              child: Text('Đổi mật khẩu'),
            )
          ],
        ),
      ),
    );
  }
}
