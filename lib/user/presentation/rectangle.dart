import 'package:flutter/material.dart';

class RectanglePage extends StatefulWidget {
  const RectanglePage({super.key});

  @override
  State<RectanglePage> createState() => _RectanglePageState();
}

class _RectanglePageState extends State<RectanglePage> {
  final TextEditingController widthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController colorController = TextEditingController();

  double width = 100;
  double height = 100;
  Color boxColor = Colors.blue;
  bool showBox = false;

  Color getColor(String color) {
    switch (color.toLowerCase()) {
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      case 'yellow':
        return Colors.yellow;
      case 'black':
        return Colors.black;
      case 'orange':
        return Colors.orange;
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rectangle Builder"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: widthController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Width",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Height",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: colorController,
              decoration: const InputDecoration(
                labelText: "Color (red, green, yellow...)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  width = double.tryParse(widthController.text) ?? 100;
                  height = double.tryParse(heightController.text) ?? 100;
                  boxColor = getColor(colorController.text);
                  showBox = true;
                });
              },
              child: const Text("Create Rectangle"),
            ),
            const SizedBox(height: 20),
            showBox
                ? Container(
                    width: width,
                    height: height,
                    color: boxColor,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}