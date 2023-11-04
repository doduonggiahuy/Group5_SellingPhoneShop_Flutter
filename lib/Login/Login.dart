import 'package:flutter/material.dart';
import 'package:second/MuaHang/ManHinhSauDN.dart';
import 'package:second/QLTKKH/ManageCustomerAccounts.dart';
import 'ForgotPassword.dart';
import 'Register.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo app ở giữa màn hình
            Container(
              margin: EdgeInsets.all(16),
              child: Image.asset('assets/images/smartphone.png'),
            ),
            // 2 input nhập vào username và password
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      labelText: 'Username',
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

            // Đường dẫn qua trang quên mật khẩu (đặt bên tay phải)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Quên mật khẩu?',
                      style: TextStyle(
                        color: const Color.fromARGB(
                          255,
                          0,
                          0,
                          0,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),

            // 2 button đăng nhập và đăng kí
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    String username = usernameController.text;
                    if (username == 'admin') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ManageCustomerAccountsPage(),
                        ),
                      );
                    } else if (username.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Vui lòng nhập thông tin đăng nhập!'),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black, // Màu nền
                    onPrimary: Colors.white, // Màu chữ
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          25.0), // Bo tròn và thay đổi kích thước
                    ),
                    minimumSize: Size(160, 50), // Đặt chiều dài và rộng
                  ),
                  child: Text('Đăng nhập'),
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black, // Màu nền
                    onPrimary: Colors.white, // Màu chữ
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          25.0), // Bo tròn và thay đổi kích thước
                    ),
                    minimumSize: Size(160, 50), // Đặt chiều dài và rộng
                  ),
                  child: Text('Đăng kí'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
