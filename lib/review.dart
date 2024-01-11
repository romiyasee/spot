import 'package:flutter/material.dart';
import 'package:spot/cost.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  int currentPage = 0;
  final List<String> imageList = [
    'asset/img/lawang_sewu.jpg',
    'asset/img/lawang_sewu2.jpg',
    'asset/img/lawang_sewu3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deskripsi'),
      ),
      body: Column(
        children: [
          Container(
            height: 200.0,
            width: double.infinity,
            child: PageView.builder(
              itemCount: imageList.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  imageList[index],
                  fit: BoxFit.cover,
                );
              },
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 0),
                  child: Text(
                    'Lawang Sewu',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Inter'),
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star_half, color: Colors.yellow),
                  ],
                ),
                SizedBox(height: 20, width: 100),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined),
                    Text('Jl.Pemuda No.160, Sekayu, SMG Tengah'),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ReviewPage()),
                        );
                      },
                      child: Text(
                        'Description',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CostPage()),
                        );
                      },
                      child: Text(
                        'Harga Tiket',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ReviewPage()),
                        );
                      },
                      child: Text(
                        'Ulasan',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          fontFamily: 'Inter'
                        ),
                      ),
                    ),
                  ],
                ),
                  SizedBox(height: 20),
                  SizedBox(height: 20),
                  itemCost('Fiony Alveria', '', Icons.person_pin),
                  SizedBox(
                    height: 15,
                  ),
                  itemCost('Alveria Fiony', '', Icons.person_pin),
                  SizedBox(
                    height: 15,
                  ),
                  itemCost('Agus', '', Icons.person_pin),
                ],
              ),
            ),
          ],
        ),
      );
      
      bottomNavigationBar: BottomAppBar(
        height: 25,
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Rp. 10k - 30k', style: TextStyle(color: Colors.white),
              ),
              
            ]
          ),
        ),
      );
  }
}

itemCost(String title, String subtitle, IconData iconData) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 5),
          color: Colors.black.withOpacity(0),
          spreadRadius: 4,
          blurRadius: 10,
        ),
      ],
    ),
    height: 100.0,
    child: Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
          textColor: Colors.blue,
          leading: Icon(iconData, color: Colors.blue),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4.0), // Add space between title and additional text
              Text(
                'Kunjungan Ke Lawang Sewu Sangat Luar Biasa Kunjungan Ke Lawang Sewu Sangat Luar Biasa Kunjungan Ke Lawang Sewu',
                style: TextStyle(fontSize: 12.0, color: Colors.black),
              ),
            ],
          ),
          trailing: Container(
            width: 100, // Adjust the width as needed
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16.0,),
                Icon(Icons.star, color: Colors.amber, size: 16.0,),
                Icon(Icons.star, color: Colors.amber, size: 16.0,),
                Icon(Icons.star, color: Colors.amber, size: 16.0,),
                Icon(Icons.star, color: Colors.amber, size: 16.0,),
                SizedBox(width: 2.0), // Add space between icon and text
                Flexible(
                  child: Text(
                    subtitle,
                    style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 12.0),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          tileColor: Colors.white,
        ),
      ],
    ),
  );
}
