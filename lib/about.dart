import 'package:flutter/material.dart';


class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 70.0),
              child: Container(
                width: 300,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                // Isi konten logo disini
                child: Image.asset(
                  'asset/img/logospot.png', // Sesuaikan dengan path dan nama file logo
                  fit: BoxFit.contain, // Sesuaikan fit sesuai keinginan
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              
            ),
            SizedBox(height: 15,),
            Text('Version 1.0.1.01.20', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 15,),
            Text('Team: ', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(
              height: 15,
            ),
            itemProfile('Rifqi Mubarok', 'Dev', Icons.person_pin),
            SizedBox(
              height: 15,
            ),
            itemProfile('Baromim Triwijaya', 'Dev', Icons.person_pin),
            SizedBox(
              height: 15,
            ),
            itemProfile('Zaenal Abidin', 'Dev', Icons.person_pin),
          ],
        ),
      ),
    );
  }
}


itemProfile(String title, String subtitle, IconData iconData) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 10,
          )
        ]),
    child: ListTile(
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: TextStyle(color: Colors.blue)),
      leading: Icon(iconData),
      tileColor: Colors.white,
    ),
  );
}