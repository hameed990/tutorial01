import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'TextFieldDesign.dart';
import 'bynumber.dart';

void main() {
  runApp(CHB());
}

class CHB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: rootpage(),
    );
  }
}

class rootpage extends StatefulWidget {
  const rootpage({Key? key}) : super(key: key);

  @override
  State<rootpage> createState() => _rootpageState();
}

class _rootpageState extends State<rootpage> {
  int selectedIndex = 0;
  final List<Widget> _pages = [
    const TextFeildDesgin(),
    const TextNumber(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Chemical Hazard Bulletin'),
      ),
      bottomNavigationBar: Container(
        color: Colors.blueGrey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
          child: GNav(
            onTabChange: (index) => setState(() {
              selectedIndex = index;
            }),
            gap: 8.0,
            backgroundColor: Colors.blueGrey,
            tabBackgroundColor: Colors.blueGrey.shade700,
            color: Colors.white,
            activeColor: Colors.white,
            selectedIndex: selectedIndex,
            tabs: const [
              GButton(
                icon: Icons.search,
                text: 'CHB Name',
              ),
              GButton(
                icon: Icons.numbers,
                text: 'CHB Number',
              )
            ],
          ),
        ),
      ),
      body: _pages[selectedIndex],
    );
  }
}
