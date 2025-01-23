import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainSettings extends StatefulWidget {
  const MainSettings({super.key});

  @override
  State<MainSettings> createState() => _MainSettingsState();
}

class _MainSettingsState extends State<MainSettings> {
  final TextEditingController excelClimbRacing = TextEditingController();
  final TextEditingController spaceShooter = TextEditingController();
  final TextEditingController astroDrop = TextEditingController();
  final TextEditingController flappyBird = TextEditingController();
  
  Future<void> savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('excelClimbRacing', excelClimbRacing.text);
    await prefs.setString('spaceShooter', spaceShooter.text);
    await prefs.setString('astroDrop', astroDrop.text);
    await prefs.setString('flappyBird', flappyBird.text);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Data saved successfully! Now go and play!!!'),
      ));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings: Specify Path",
          style: GoogleFonts.mulish(),
        ),
      ),
      backgroundColor: Colors.purple[700],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Form Field 1
            TextFormField(
              controller: spaceShooter,
              decoration: InputDecoration(
                labelText: 'Space Shooter',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            
            // Form Field 2
            TextFormField(
              controller: excelClimbRacing,
              decoration: InputDecoration(
                labelText: 'Excel Climb Racing',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            
            // Form Field 3
            TextFormField(
              controller: astroDrop,
              decoration: InputDecoration(
                labelText: 'Astro Drop',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            
            // Form Field 4
            TextFormField(
              controller: flappyBird,
              decoration: InputDecoration(
                labelText: 'Flappy Bird',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            
            // Save Button
            ElevatedButton(
              onPressed: savePreferences,
              child: Text('Save Path'),
            ),
          ],
        ),
      ),
    );
  }
}