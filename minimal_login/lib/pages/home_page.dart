import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Şu E-Mail ile giriş yapıldı " + user.email!),
          MaterialButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            color: Colors.deepPurple[300],
            child: Text("Çıkış Yap"),
          )
        ],
      )),
      appBar: AppBar(
        centerTitle: true,
        title: Text("H O Ş G E L D İ N"),
        backgroundColor: Colors.deepPurple,
      ),
      bottomNavigationBar: Container(
        color: Colors.deepPurple,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
              style: GnavStyle.google,
              backgroundColor: Colors.deepPurple,
              activeColor: Colors.white,
              color: Colors.white,
              tabBackgroundColor: Colors.deepPurple.shade300,
              gap: 8,
              onTabChange: (index) {
                print(index);
              },
              padding: EdgeInsets.all(16),
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: "Home",
                ),
                GButton(
                  icon: Icons.favorite_border,
                  text: "Likes",
                ),
                GButton(
                  icon: Icons.search,
                  text: "Search",
                ),
                GButton(
                  icon: Icons.settings,
                  text: "Settings",
                ),
              ]),
        ),
      ),
    );
  }
}
