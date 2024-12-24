import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:savethewhales/pages/beluga.dart';
import 'package:savethewhales/pages/bluewhale.dart';
import 'package:savethewhales/pages/orca.dart';
import 'package:savethewhales/pages/spermwhale.dart';

class AboutWhales extends StatefulWidget {
  const AboutWhales({super.key});

  @override
  State<AboutWhales> createState() => _AboutWhalesState();
}

class _AboutWhalesState extends State<AboutWhales> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About whales'),
      ),
      body: main(),
    );
  }

  Widget main() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: SizedBox(
            width: double.infinity,
            height: 200,
            child: Image.asset(
              'assets/svgs/about-whale.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
              'Paus adalah salah satu jenis hewan terbesar di dunia yang menguasai wilayah lautan. Hewan ini kerap disebut sebagai ikan, padahal nyatanya bukan. Di seluruh lautan di dunia, paus tersebar dengan berbagai famili. Status paus merupakan hewan yang dilindungi karena populasinya yang terancam. Namun sayangnya, saat ini populasi paus terus menurun sebagai akibat dari perburuan liar yang dilakukan manusia.'),
        ),
        Expanded(
          child: Container(),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Orca()),
                  );
                },
                child: Chip(
                  avatar: Container(
                    width: 40,
                    height: 40,
                    child: ClipOval(
                      child: SvgPicture.asset(
                        'assets/svgs/orca.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  label: Text('Paus Orca'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BlueWhale()),
                  );
                },
                child: Chip(
                  avatar: Container(
                    width: 40,
                    height: 40,
                    child: ClipOval(
                      child: SvgPicture.asset(
                        'assets/svgs/bluewhale.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  label: Text('Paus Biru'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SpermWhale()),
                  );
                },
                child: Chip(
                  avatar: Container(
                    width: 40,
                    height: 40,
                    child: ClipOval(
                      child: SvgPicture.asset(
                        'assets/svgs/spermwhale.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  label: Text('Paus Sperma'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Beluga()),
                  );
                },
                child: Chip(
                  avatar: Container(
                    width: 40,
                    height: 40,
                    child: ClipOval(
                      child: SvgPicture.asset(
                        'assets/svgs/beluga.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  label: Text('Beluga'),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
