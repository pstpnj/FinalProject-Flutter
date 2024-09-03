import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../preset/nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PresetAppBar(),
      drawer: const PresetDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Image.asset(
                  'assets/sudlhao.webp', // Ensure kosen.webp is in your assets directory
                  width: double.infinity,
                  height: 300, // Increase the height here
                  fit: BoxFit.cover,
                ),
                Container(
                  width: double.infinity,
                  height: 300, // Match the height of the image
                  color: Colors.black
                      .withOpacity(0.5), // Black overlay with opacity
                ),
                const Positioned(
                  left: 16,
                  bottom: 125,
                  child: Text(
                    'Welcome \nto\nKOSEN-KMITL',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.only(top: 16.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'About Us',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'KOSEN-KMITL is a collaboration between King Mongkut\'s Institute of Technology Ladkrabang (KMITL) and the National Institute of Technology (KOSEN) in Japan. The collaboration aims to provide students with a unique opportunity to study in both countries and gain international experience.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.only(top: 16.0),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 300.0,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(milliseconds: 1500),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: [
                    "https://scontent.fbkk7-2.fna.fbcdn.net/v/t39.30808-6/369849926_777023334423233_8359969307874670616_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=f727a1&_nc_eui2=AeHVS9__sHxdbSQ99j3hY3fgWMF0-u8HjoRYwXT67weOhLLNPmVpHa9hTeue9PA0xO9iiRH3WcmJ0j6elQRtwWco&_nc_ohc=oofbss-ptIEQ7kNvgGTY65p&_nc_ht=scontent.fbkk7-2.fna&oh=00_AYDTTWiTWpFP8E9Rb2FM43i6gpTrEGWK7xaayr2GQbpjbQ&oe=66DB99F1",
                    "https://scontent.fbkk7-3.fna.fbcdn.net/v/t39.30808-6/369737938_777023384423228_6138093373493641972_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=f727a1&_nc_eui2=AeEqQW7VIEYPHJkRAWHZSJ3Jan5xYYyxdWdqfnFhjLF1Z_6vwacVF6JPOZA6IP4YJ4HljUUyF6-UksuZPb0aBu6s&_nc_ohc=uwD8ypwUqUgQ7kNvgFP0Cpk&_nc_ht=scontent.fbkk7-3.fna&_nc_gid=A6JhF12A88m7dceSR5NrLmJ&oh=00_AYBW6y37kkGGkUigUjw8LFfJfAqoALUnFuarrwOX37tcQg&oe=66DBB541",
                    "https://scontent.fbkk7-2.fna.fbcdn.net/v/t39.30808-6/378063565_788408639951369_4228855642168736746_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=f727a1&_nc_eui2=AeE3Yd5BilXNtJY8qi_ooXizxhK_X7-cmJPGEr9fv5yYk5uoWSNUFDKUV9wovNG1TNnlg9y6DZOcwK1WnHx1YO6X&_nc_ohc=HUXeQr72qi4Q7kNvgEyzXRR&_nc_ht=scontent.fbkk7-2.fna&oh=00_AYAit_C8uTQSqlI2ev6-zy81o-ttvRYkAufVSxW2aZct2g&oe=66DBB751",
                  ].map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                          ),
                          child: Image.network(item, fit: BoxFit.cover),
                        );
                      },
                    );
                  }).toList(),
                )),
          ],
        ),
      ),
    );
  }
}
