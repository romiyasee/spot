import 'package:flutter/material.dart';
import 'package:spot/favorit.dart';
import 'package:spot/homepage.dart';
import 'package:spot/main.dart';
import 'package:spot/notes.dart';

class ProfilePage extends StatefulWidget {
  
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 3;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {
              // Tambahkan logika untuk menampilkan notifikasi
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 40.0),
                CircleAvatar(
                  radius: 60.0,
                  backgroundImage: AssetImage('asset/img/profil.png'),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Rifqi Mubarok',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Indonesia',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 16.0),
                // Email Card
                Card(
                  elevation: 2.0,
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  child: ListTile(
                    leading: Icon(Icons.email, color: Colors.blue),
                    title: Text(
                      'rifqi@gmail.com',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                // Phone Card
                Card(
                  elevation: 2.0,
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  child: ListTile(
                    leading: Icon(Icons.phone, color: Colors.green),
                    title: Text(
                      '+621234567890',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Navigasi ke halaman lain
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Notes()),
                    );
                  },
                  child: Text(
                    'Catatan Perjalanan',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontSize: 15,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          backgroundColor: Colors.blue,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });

            switch (_selectedIndex) {
              case 0:
                Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                break;
              case 1:
                // Navigasi untuk Pencarian
                // ... (Tambahkan logika pencarian)
                break;
              case 2:
              Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Favorit()),
                    );
                // Navigasi untuk Favorit
                // ... (Tambahkan logika favorit)
                break;
              case 3:
                // Navigasi untuk Profil
                // ... (Tambahkan logika profil)
                break;
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Pencarian',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorit',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
        ),
    )
    );
  }
}
