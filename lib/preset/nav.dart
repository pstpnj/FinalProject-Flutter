import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../pages/home.dart';
import '../pages/info.dart';
import '../pages/contactus.dart';
import '../pages/bmi.dart';
import '../pages/timecv.dart';

import '../auth_gate.dart';

class PresetAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PresetAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/kosen.png',
            height: 50,
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const AuthGate()),
              );
            },
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class PresetDrawer extends StatelessWidget {
  const PresetDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: const Text("Home"),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
            ListTile(
              title: const Text("Information"),
              leading: const Icon(Icons.info),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Info()),
                );
              },
            ),
            ExpansionTile(
              title: const Text("Services"),
              leading: const Icon(Icons.settings),
              children: [
                ListTile(
                  title: const Text("BMI Calculator"),
                  leading: const Icon(Icons.face),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Bmi()),
                    );
                  },
                ),
                ListTile(
                  title: const Text("Timezone Converter"),
                  leading: const Icon(Icons.access_time),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Timezone()),
                    );
                  },
                ),
              ],
            ),
            ListTile(
              title: const Text("Contact us"),
              leading: const Icon(Icons.phone),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
