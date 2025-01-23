import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:process_run/process_run.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IconContainer extends StatefulWidget {
  final String image;
  final String name;
  final String prefName;
  const IconContainer({super.key, required this.image, required this.name, required this.prefName});

  @override
  State<IconContainer> createState() => _IconContainerState();
}

class _IconContainerState extends State<IconContainer> {
Future<void> launchGame(String path) async {
  final shell = Shell();
  String command = 'start "" $path';
  // print('Launching game with command: $command');
  try {
    await shell.run(command);
  } catch (e) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error during execution. Check again!!'),
      ));
    }
  }
}


  Future<String?> getGameName() async {
    final prefs = await SharedPreferences.getInstance();
    if (widget.prefName == "spaceShooter") {
      return prefs.getString('spaceShooter');
    } else if (widget.prefName == "excelClimbRacing") {
      return prefs.getString('excelClimbRacing');
    } else if (widget.prefName == "astroDrop") {
      return prefs.getString('astroDrop');
    } else {
      return prefs.getString("flappyBird");
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Text(
          widget.name,
          style: GoogleFonts.mulish(
            fontSize: 26,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: height * 0.3,
          width: width * 0.2,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image.asset(widget.image,fit: BoxFit.cover,),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () async {
            String? prefName = await getGameName();
            if (prefName != null) {
              launchGame(prefName);
            } 
            // else {
            //   print("Game not found!");
            // }
          },
          child: Text(
            "Play Game!",
            style: GoogleFonts.mulish(),
          ),
        ),
      ],
    );
  }
}
