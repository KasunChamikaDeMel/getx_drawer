import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentDate = '';

  void displayCurrentDate() {
    setState(() {
      currentDate = DateFormat('EEEE, d MMMM y').format(DateTime.now());
    });
  }

  Widget _buildImageCard(String imagePath) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Image.asset(imagePath, width: 150, fit: BoxFit.cover),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Navigation Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Get.to(const HomeScreen());
              },
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                Get.to(const ProfileScreen());
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Get.to(const SettingsScreen());
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Welcome to the Home Screen",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildImageCard("assets/image1.jpg"),
                  _buildImageCard("assets/image2.jpg"),
                  _buildImageCard("assets/image3.jpg"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: displayCurrentDate,
              child: const Text("Today"),
            ),
            const SizedBox(height: 10),
            if (currentDate.isNotEmpty)
              Text(
                currentDate,
                style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
          ],
        ),
      ),
    );
  }
}
