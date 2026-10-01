import 'package:flutter/material.dart';
import 'package:kuis_060/views/home.dart';
import 'package:kuis_060/views/profile.dart';

class Root extends StatefulWidget {
  final String username;

  const Root({super.key, required this.username});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(selectedIndex == 0 ? "Home" : "Profile")),
      // IndexedStack supaya isi pencarian/filter di Home tidak hilang saat pindah tab
      body: IndexedStack(
        index: selectedIndex,
        children: [
          const HomePage(),
          ProfilePage(username: widget.username),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
