import 'package:flutter/material.dart';
import 'package:game_launcher/Screens/MainScreen/Widgets/icon_container.dart';
import 'package:game_launcher/Screens/MainScreen/Widgets/main_settings.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[700],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Excel 2024",
                    style: GoogleFonts.mulish(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MainSettings()));
                    },
                    child: Icon(
                      Icons.settings,
                      size: 28,
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconContainer(image: "assets/spaceShooter.png", name: "Space Shooter", prefName: "spaceShooter",),
                IconContainer(image: "assets/hcr.png", name: "Excel Climb Racing", prefName: "excelClimbRacing",)
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconContainer(image: "assets/flappyBird.png", name: "Flappy Bird", prefName: "flappyBird",),
                IconContainer(image: "assets/astro_drop.png", name: "Astro Drop", prefName: "astroDrop",)
              ],
            )
          ],
        ),
      ),
    );
  }
}