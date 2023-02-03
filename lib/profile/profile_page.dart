import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: height,
          width: width,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Stack(
                  children: [
                    const CircleAvatar(
                      radius: 100,
                      backgroundImage: NetworkImage(
                          'https://akcdn.detik.net.id/visual/2022/01/04/ilustrasi-kucing-oranye_169.jpeg?w=650'),
                    ),
                    Positioned(
                      bottom: 2,
                      right: -16,
                      child: RawMaterialButton(
                        onPressed: () {},
                        elevation: 2.0,
                        fillColor: const Color(0xFFF5F6F9),
                        padding: const EdgeInsets.all(15.0),
                        shape: const CircleBorder(),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              userInfo(
                Icons.person,
                'Name',
                'Ferdi Firmansyah',
              ),
              gap(width),
              userInfo(
                Icons.info,
                'About',
                'Rise above the crowd',
              ),
              gap(width),
              userInfo(
                Icons.phone,
                'Phone',
                '+6285239110184',
              ),
              gap(width),
              userInfo(
                Icons.email,
                'Email',
                'ferdi.fmsh@gmail.com',
              ),
              gap(width),
            ],
          ),
        ),
      ),
    );
  }

  Container gap(double width) => Container(height: 1,width: width,margin: const EdgeInsets.all(16),color: Colors.grey,);

  Container userInfo(IconData icon, String tag, String content) {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tag,
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    content,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}
