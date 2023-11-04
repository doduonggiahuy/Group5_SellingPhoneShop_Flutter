import 'package:flutter/material.dart';
import 'dart:async';
import 'ChangePassword.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool isCodeSent = false;
  int countdown = 180; // Đếm ngược 5 phút (300 giây)
  Timer? timer;

  @override
  void dispose() {
    timer?.cancel(); // Hủy đếm ngược khi thoát trang
    super.dispose();
  }

  void startCountdown() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        countdown--;
      });
      if (countdown == 0) {
        timer.cancel(); // Hủy đếm ngược khi đạt 0
      }
    });
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
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Quên mật khẩu',
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

            // Input nhập email/số điện thoại và nút "Gửi mã OTP"
            Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          labelText: 'Email/Số điện thoại',
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        // Xử lý gửi mã OTP
                        setState(() {
                          isCodeSent = true;
                        });
                        startCountdown();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        minimumSize: Size(120, 50),
                      ),
                      child: Text('Gửi mã OTP'),
                    ),
                  ],
                ),
              ),
            ),

            // Thông báo "Mã có hiệu lực sau"
            if (isCodeSent)
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  'Mã có hiệu lực sau $countdown giây',
                  style: TextStyle(fontSize: 16),
                ),
              ),

            // Hàng ngang 4 ô nhập mã số OTP
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (int i = 0; i < 4; i++)
                  Container(
                    width: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    margin: EdgeInsets.all(20.0),
                  ),
              ],
            ),

            // Nút đổi mật khẩu
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: ElevatedButton(
                onPressed: () {
                  // Xử lý đổi mật khẩu
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangePasswordScreen(),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
