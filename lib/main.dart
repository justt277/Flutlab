import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;
  double fontSize = 16;
  String selectedColor = "Blue";

  Color getAccentColor() {
    switch (selectedColor) {
      case "Green":
        return Colors.green;
      case "Orange":
        return Colors.orange;
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color accent = getAccentColor();
    Color background = isDarkMode ? Colors.black : Colors.white;
    Color textColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings Panel"),
        backgroundColor: accent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// Dark Mode Switch
            SwitchListTile(
              title: const Text("Dark Mode (Preview Only)"),
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                });
              },
            ),

            const SizedBox(height: 10),

            /// Font Size Slider
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Font Size: ${fontSize.toStringAsFixed(0)}"),
                Slider(
                  min: 12,
                  max: 30,
                  divisions: 18,
                  value: fontSize,
                  label: fontSize.toStringAsFixed(0),
                  onChanged: (value) {
                    setState(() {
                      fontSize = value;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 10),

            /// Accent Color Dropdown
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Accent Color"),
                DropdownButton<String>(
                  value: selectedColor,
                  items: const [
                    DropdownMenuItem(value: "Blue", child: Text("Blue")),
                    DropdownMenuItem(value: "Green", child: Text("Green")),
                    DropdownMenuItem(value: "Orange", child: Text("Orange")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedColor = value!;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// Preview Container
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: accent, width: 3),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, size: 40, color: accent),
                    const SizedBox(height: 10),
                    Text(
                      "Preview Text",
                      style: TextStyle(
                        fontSize: fontSize,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Icon(Icons.favorite, size: 30, color: accent),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
