import 'package:flutter/material.dart';
import 'package:spot/homepage.dart';
import 'package:spot/profile.dart';

class Favorit extends StatefulWidget {
  @override
  _FavoritState createState() => _FavoritState();
}

class _FavoritState extends State<Favorit> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 2;

  final List<Map<String, dynamic>> dataList = [
    {
      'imageUrl': 'https://s3-alpha-sig.figma.com/img/7a8e/3e19/3608bf7e0a918e8cb30cfa005fe7e0ca?Expires=1705881600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=m1UeHD3waKKb9mw~JiQEaKpbouzAWxVWpjmRycUY71MrlK75w3KIzsRE8e1qgQlc~Py10rYjMcgZJXlUKaNg0SXLWf0QLWRcrAmmglG~mj8HQzbrMnxWUqvhQyXtDYrzv9Ufh74Z3hgYtzMIuXb4Dq9ih0wT74QBR~HViL1Z5ywXOWz7I7G4A0TbsRRE3~CEv2xjbjk40xGOKFxfeLGvB~37g327Fztxa9ZhrqIvF~bmREIjjc1xFGVqY5om1~jcSQDeaeBhzitneYLpWbj24HysvPh0oDzt1m6ZnKQxRypF36dZHIbf4SyRPOjE-X0-YG2ZU21BYa~8FJccHfAGxg__',
      'title': 'Lawang Sewu',
      'address': 'Sekayu, SMG Tengah',
      'rating': 4.5,
      'ticketPrice': 20000,
    },
    {
      'imageUrl': 'https://s3-alpha-sig.figma.com/img/21fa/9f47/f2beb0de65ea916d689b27dd8fcc3992?Expires=1705881600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=NiXlst~8GnpzextioAq2jYa4XTCEh4UyIQl7HONOiQvHxI~vDBMOltKpl1epSmJtqM8cOkXHAxqhGZ6xhH~byq9-Wn6zl~EX~CgOMCigeCcLkrpBWZZKj4zx06~UEiTAVkX7BuIsGeg8RcMKsJLsFfKRCbXhtQP1JltRQS7Q3TPPVtYq3AY0ffzk5wzs04FeysSdohzu51dhdjiMwhyXE2p~kfPm8WX6xyU81YLjfoOe9e9-WyWIe~ArqKVI2MVqJPkru967Hq9bNEGxfAo5Vn1UBApIArRVxUI5REpO4O8v3Qt2wX4GwS0Fgirh4rMX0vjsikWLzTAAn5MlNX8PVQ__',
      'title': 'Sam Poo Kong',
      'address': 'Bongsari, SMG Barat',
      'rating': 5,
      'ticketPrice': 35000,
    },

    {
      'imageUrl': 'https://s3-alpha-sig.figma.com/img/3f0c/7697/8a49ea51f7906b50a42c93f1e21d823f?Expires=1705881600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=TvMfwO56L1HXYo~C0xOby8Vk09VikimQfz-9OEKTpCLyit4TEJZHoVPjJddoFhx2j0J5lgCe38pqMdEGPMAbUXJyO~~xUoIOjB8bBWghUhcGJaA3rgVbdkfdDZDJC2BdfyN77QBi3mh-HU4yl7dUbMC4~VKnhLN9PW0hWbP0dKOdrtQOocjhZjdxVFuUcc3KfOv4KZvlt-fDrRGKuGd6sqN4I61XBLqMelZjDGixVDQ~GA9DcqwPsOdjIDRHodIjpcM2DOIcC-YAneCyKSSDh8mPljFYHKSwwP7i3E4daAqnnKWkg-FynIiG84RIi~sTmtl2Vk8NGTqKUVd2wyhsbw__',
      'rating': 4.5,
      'title': 'Kota Lama',
      'address': 'Tj Mas, SMG Utara',
      'ticketPrice': 5000,
    },

    // ... tambahkan data lain sesuai kebutuhan
  ];

@override
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
              // Tambahkan logika untuk keluar/logout
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,

        title: Text('Favorit',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0,
              ),),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.7, // Adjust this aspect ratio to make the cards taller
        ),
        itemCount: dataList.length,
        itemBuilder: (BuildContext context, int index) {
          return buildCard(dataList[index]);
        },
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
                // Navigasi untuk Beranda
                // ... (Tambahkan logika beranda)
                break;
              case 1:
                // Navigasi untuk Pencarian
                // ... (Tambahkan logika pencarian)
                break;
              case 2:
                // Navigasi untuk Favorit (sudah berada di halaman favorit)
                break;
              case 3:
              Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
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
      ),
    );
  }
}
  

  Widget buildCard(Map<String, dynamic> data) {
    return Card(
      elevation: 5.0,
      margin: const EdgeInsets.all(8.0),
      child: Container(
        // Adjust the height value here
        height: 500.0,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                data['imageUrl'],
                height: 100.0, // Adjust the height of the image
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 15.0),
            Text(
              data['title'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              data['address'],
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 12.0),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.orange,
                  size: 16.0,
                ),
                Text(
                  data['rating'].toString(),
                ),
              ],
            ),
            SizedBox(height: 17.0),
            Text(
              '\Rp. ${data['ticketPrice'].toString()}/Org',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

