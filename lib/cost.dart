import 'package:flutter/material.dart';
import 'package:spot/review.dart';

class CostPage extends StatefulWidget {
  const CostPage({Key? key});

  @override
  State<CostPage> createState() => _CostPageState();
}

class _CostPageState extends State<CostPage> {
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
                          MaterialPageRoute(builder: (context) => CostPage()),
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
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          fontFamily: 'Inter'
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
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                  ],
                ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 45.0, right: 45.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Kategori', style: TextStyle(fontWeight: FontWeight.bold),),
                        Text('Harga Tiket', style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  itemCost('Anak-anak', 'Rp.10.000', Icons.person_pin),
                  SizedBox(
                    height: 15,
                  ),
                  itemCost('Dewasa', 'Rp.20.000', Icons.person_pin),
                  SizedBox(
                    height: 15,
                  ),
                  itemCost('Orang Tua', 'Rp.30.000', Icons.person_pin),
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

itemCost(String title, String additionalText, IconData iconData,) {
  return Container(
      decoration: BoxDecoration(
        color: Colors.blue[300],
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
      height: 54.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
            textColor: Colors.white,
            leading: Icon(iconData, color: Colors.white),
            title: Row(
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            trailing: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(9.0),
              ),
              width: 100, // Adjust the width as needed
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.attach_money, color: Colors.green,), // Dollar icon
                  SizedBox(width: 4.0), // Add space between icon and text
                  Flexible(
                    child: Text(
                      additionalText,
                      style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 12.0),
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



