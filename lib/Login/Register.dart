import 'package:flutter/material.dart';
import 'Login.dart';

class RegisterScreen extends StatelessWidget {
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
          'Đăng kí',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0, // Đặt kích thước tiêu đề
          ),
        ),
        centerTitle: true, // Đặt tiêu đề ở giữa màn hình
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
            // 3 input nhập vào username, số điện thoại/email, và password
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      labelText: 'Username',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      labelText: 'Số điện thoại/Email',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      labelText: 'Password',
                    ),
                  ),
                ],
              ),
            ),

            // Nút đăng kí
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
                // Chuyển đến trang chính hoặc thực hiện các tác vụ cần thiết
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                minimumSize: Size(200, 50),
              ),
              child: Text('Đăng kí'),
            ),
          ],
        ),
      ),
    );
  }
}
