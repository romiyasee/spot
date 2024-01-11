import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:spot/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image with Dark Overlay and Blur
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 0.2, sigmaY: 0.2),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.darken,
              ),
              child: Image.asset(
                'asset/img/tugu_muda.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Positioned Content at the Top
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.all(20),
              // Content
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height:600),
                  // Judul
                  Text(
                    'Jelajahi Kota Semarang',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(height:30),
                  // Sub Judul
                  Text(
                    'Jelajahi berbagai lokasi wisata dan pilih salah satu yang cocok untuk Anda. Jelajahi kota tanpa kesulitan hanya dengan satu ketukan.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Positioned Button at the Bottom
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              // Tombol Elips
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigasi ke halaman lain
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Text(
                    'Jelajahi',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
