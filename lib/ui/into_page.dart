import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:providerapp/ui/home_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50, top: 30),
              child: Container(
                height: 300,
                width: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/avocado.png'),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('We Deliver Groceries At Your Doorstep',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.notoSerif(
                      fontSize: 36, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),
            Text("Fresh Items Everyday",
                style: GoogleFonts.notoSerif(
                    fontSize: 20, color: Colors.grey[600])),
            const Spacer(),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Colors.deepPurple,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(24),
                  child: Text(
                    'Get Started',
                  ),
                ),
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
