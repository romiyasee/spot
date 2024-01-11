import 'package:flutter/material.dart';
import 'package:spot/About.dart';
import 'package:spot/deskripsi.dart';
import 'package:spot/favorit.dart';
import 'package:spot/populer.dart';
import 'package:spot/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  

  @override
  _HomePageState createState() => _HomePageState();

  
}
class PopulerCard extends StatelessWidget {
  final String imageUrl;
  final double rating;
  final String title;
  final String address;
  final double ticketPrice;

  const PopulerCard({
    required this.imageUrl,
    required this.rating,
    required this.title,
    required this.address,
    required this.ticketPrice,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to a new page when the card is tapped
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BookingPage()),
        );
      },
      child: Card(
        elevation: 5.0, // Add elevation for the shadow
        margin: const EdgeInsets.all(8.0),
        child: Container(
          width: 150.0,
          height: 500, // Adjust the width as needed
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  imageUrl,
                  height: 100.0, // Adjust the height as needed
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                address,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 3,),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 16.0,
                  ),
                  Text(
                    rating.toString(),
                  ),
                ],
              ),
              SizedBox(height: 12,),
              Text(
                '\Rp. ${ticketPrice.toString()} /org',
                style: TextStyle(
                  
                  fontWeight: FontWeight.bold,color: Colors.green, fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedIndex = 0;

  // Data Populer
  List<Map<String, dynamic>> popularData = [
    {
      'imageUrl': 'https://s3-alpha-sig.figma.com/img/7a8e/3e19/3608bf7e0a918e8cb30cfa005fe7e0ca?Expires=1705881600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=m1UeHD3waKKb9mw~JiQEaKpbouzAWxVWpjmRycUY71MrlK75w3KIzsRE8e1qgQlc~Py10rYjMcgZJXlUKaNg0SXLWf0QLWRcrAmmglG~mj8HQzbrMnxWUqvhQyXtDYrzv9Ufh74Z3hgYtzMIuXb4Dq9ih0wT74QBR~HViL1Z5ywXOWz7I7G4A0TbsRRE3~CEv2xjbjk40xGOKFxfeLGvB~37g327Fztxa9ZhrqIvF~bmREIjjc1xFGVqY5om1~jcSQDeaeBhzitneYLpWbj24HysvPh0oDzt1m6ZnKQxRypF36dZHIbf4SyRPOjE-X0-YG2ZU21BYa~8FJccHfAGxg__',
      'title': 'Lawang Sewu',
      'address': 'Sekayu, SMG Tengah',
      'rating': 4,
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
      'imageUrl': 'https://upload.wikimedia.org/wikipedia/id/thumb/b/b4/Great_Mosque_of_Central_Java%2C_aerial_view.jpg/1200px-Great_Mosque_of_Central_Java%2C_aerial_view.jpg',
      'rating': 4,
      'title': 'Masjid Agung',
      'address': 'Sambirejo, Gayamsari',
      'ticketPrice': 10000,
    },
    {
      'imageUrl': 'https://s3-alpha-sig.figma.com/img/3f0c/7697/8a49ea51f7906b50a42c93f1e21d823f?Expires=1705881600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=TvMfwO56L1HXYo~C0xOby8Vk09VikimQfz-9OEKTpCLyit4TEJZHoVPjJddoFhx2j0J5lgCe38pqMdEGPMAbUXJyO~~xUoIOjB8bBWghUhcGJaA3rgVbdkfdDZDJC2BdfyN77QBi3mh-HU4yl7dUbMC4~VKnhLN9PW0hWbP0dKOdrtQOocjhZjdxVFuUcc3KfOv4KZvlt-fDrRGKuGd6sqN4I61XBLqMelZjDGixVDQ~GA9DcqwPsOdjIDRHodIjpcM2DOIcC-YAneCyKSSDh8mPljFYHKSwwP7i3E4daAqnnKWkg-FynIiG84RIi~sTmtl2Vk8NGTqKUVd2wyhsbw__',
      'rating': 4,
      'title': 'Kota Lama',
      'address': 'Tj Mas, SMG Utara',
      'ticketPrice': 5000,
    },
        {
      'imageUrl': 'https://asset.kompas.com/crops/BYBaMiKef2Mrpqw7LBWmOIX1ppk=/0x0:1073x715/750x500/data/photo/2020/10/10/5f816da132025.jpeg',
      'rating': 4,
      'title': 'Pantai Marina',
      'address': 'Tawangsari',
      'ticketPrice': 5000,
    },

    // Tambahkan data populer lainnya sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  UserAccountsDrawerHeader(
                    accountName: const Text('Rifqi Mubarok'),
                    accountEmail: const Text('rifqi@gmail.com'),
                    currentAccountPicture: const CircleAvatar(
                      backgroundImage: AssetImage('asset/img/profil.png'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.home,
                      color: Colors.blue,
                      size: 25,
                    ),
                    title: const Text(
                      'Beranda',
                      style: TextStyle(
                        color: Color(0xFF454140),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    onTap: () {
                      // Tambahkan logika untuk beranda
                    },
                  ),
                  const Divider(
                    color: Colors.blue,
                    thickness: 1,
                    indent: 16,
                    endIndent: 16,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.search,
                      color: Colors.blue,
                      size: 25,
                    ),
                    title: const Text(
                      'Pencarian',
                      style: TextStyle(
                        color: Color(0xFF454140),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    onTap: () {
                      // Tambahkan logika untuk pencarian
                    },
                  ),
                  const Divider(
                    color: Colors.blue,
                    thickness: 1,
                    indent: 16,
                    endIndent: 16,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.favorite,
                      color: Colors.blue,
                      size: 25,
                    ),
                    title: const Text(
                      'Favorit',
                      style: TextStyle(
                        color: Color(0xFF454140),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    onTap: () {
                      // Tambahkan logika untuk favorit
                    },
                  ),
                  const Divider(
                    color: Colors.blue,
                    thickness: 1,
                    indent: 16,
                    endIndent: 16,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.person,
                      color: Colors.blue,
                      size: 25,
                    ),
                    title: const Text(
                      'Profil',
                      style: TextStyle(
                        color: Color(0xFF454140),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
                      // Tambahkan logika untuk profil
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 100),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  ListTile(
                    leading: const Icon(
                      Icons.notifications,
                      color: Colors.blue,
                      size: 25,
                    ),
                    title: const Text(
                      'Notifikasi',
                      style: TextStyle(
                        color: Color(0xFF454140),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    onTap: () {
                      // Tambahkan logika untuk notifikasi
                    },
                  ),
                  const Divider(
                    color: Colors.blue,
                    thickness: 1,
                    indent: 16,
                    endIndent: 16,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.info,
                      color: Colors.blue,
                      size: 25,
                    ),
                    title: const Text(
                      'Tentang',
                      style: TextStyle(
                        color: Color(0xFF454140),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    onTap: () {
                      // Tambahkan logika untuk tentang
                      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AboutPage()),
        );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 30.0),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0),
            child: Text(
              'Selamat Datang',
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              'Ayo cari tempat menarik untukmu',
              style: TextStyle(
                color: Color(0xFF6B6B6B),
                fontSize: 13,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Cari...',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Populer',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PopulerPage()),
                    );
                  },
                  child: Text(
                    'Lihat semua',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 280.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: popularData.length,
              itemBuilder: (BuildContext context, int index) {
                return PopulerCard(
  imageUrl: popularData[index]['imageUrl'],
  rating: (popularData[index]['rating'] as num).toDouble(),
  title: popularData[index]['title'],
  address: popularData[index]['address'],
  ticketPrice: (popularData[index]['ticketPrice'] as num).toDouble(),
);
              },
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Destinasi',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          SizedBox(
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                // ... existing destination cards ...
                Container(
                  height: 200,
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          'asset/img/sejarah.jpg',
                          width: 200.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Sejarah',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          'asset/img/religi.png',
                          width: 200.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Religi',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          'asset/img/alam.png',
                          width: 200.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Alam',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
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
                // Navigasi untuk Beranda
                // ... (Tambahkan logika beranda)
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
                Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
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
