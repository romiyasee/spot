import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spot/DatabaseHelper.dart';

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  late DatabaseHelper dbHelper;
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  bool isEditing = false;
  late User _user;

  int _selectedIndex = 3;

  @override
  void initState() {
    super.initState();
    this.dbHelper = DatabaseHelper();
    this.dbHelper.initDB().whenComplete(() async {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Catatan Perjalanan'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            hintText: 'Masukkan Lokasi Wisata',
                            labelText: 'Lokasi Wisata',
                          ),
                        ),
                        TextFormField(
                          controller: ageController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          decoration: const InputDecoration(
                            hintText: 'Ke berapa kali ke tempat ini?',
                            labelText: 'Kunjungan keberapa',
                          ),
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: 'Masukkan Tanggal',
                            labelText: 'Tanggal',
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: ElevatedButton(
                                child: const Text('Simpan'),
                                onPressed: addOrEditUser,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SafeArea(child: userWidget()),
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
      ),
    );
  }

  Future<void> addOrEditUser() async {
    String email = emailController.text;
    String name = nameController.text;
    String age = ageController.text;

    if (!isEditing) {
      User user = new User(name: name, age: int.parse(age), email: email);
      await addUser(user);
    } else {
      _user.email = email;
      _user.age = int.parse(age);
      _user.name = name;
      await updateUser(_user);
    }
    resetData();
    setState(() {});
  }

  Future<int> addUser(User user) async {
    return await this.dbHelper.insertUser(user);
  }

  Future<int> updateUser(User user) async {
    return await this.dbHelper.updateUser(user);
  }

  void resetData() {
    nameController.clear();
    ageController.clear();
    emailController.clear();
    isEditing = false;
  }

  Widget userWidget() {
    return FutureBuilder(
      future: this.dbHelper.retrieveUsers(),
      builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, position) {
              return Dismissible(
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Icon(Icons.delete_forever),
                ),
                key: UniqueKey(),
                onDismissed: (DismissDirection direction) async {
                  await this
                      .dbHelper
                      .deleteUser(snapshot.data![position].id!);
                },
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => populateFields(snapshot.data![position]),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    12.0, 12.0, 12.0, 6.0),
                                child: Text(
                                  snapshot.data![position].name,
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    12.0, 6.0, 12.0, 12.0),
                                child: Text(
                                  snapshot.data![position].email.toString(),
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black26,
                                      borderRadius:
                                          BorderRadius.circular(100)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      snapshot.data![position].age.toString(),
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 2.0,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  void populateFields(User user) {
    _user = user;
    nameController.text = _user.name;
    ageController.text = _user.age.toString();
    emailController.text = _user.email;
    isEditing = true;
  }
}
