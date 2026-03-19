import 'package:flutter/material.dart';
import 'package:lesson_flutter_1/model/user.dart';
import 'package:lesson_flutter_1/user/presentation/login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Flutter Hello World',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        // useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    User user = User(firstName: "Adilet", lastName: "Adiletov");
    
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          // переход на экран логина
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  Login()),
              );
            },
            child: const Text("Go to Login"),
          ),
          const SizedBox(height: 10),
          // переход на экран прямоугольника
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RectanglePage()),
              );
            },
            child: const Text("Go to Rectangle"),
          ),
        ],
      ),
    );
  }
}

class RectanglePage extends StatefulWidget {
  const RectanglePage({super.key});

  @override
  _RectanglePageState createState() => _RectanglePageState();
}

class _RectanglePageState extends State<RectanglePage> {
  double boxWidth = 100;
  double boxHeight = 60;
  Color boxColor = Colors.red;

  TextEditingController widthController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController colorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rectangle Page')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text("Enter rectangle xy and color :"),
            // input width
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: TextFormField(
                controller: widthController,
                decoration: const InputDecoration(labelText: "Width"),
                keyboardType: TextInputType.number,
              ),
            ),
            // инпут  height
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: TextFormField(
                controller: heightController,
                decoration: const InputDecoration(labelText: "Height"),
                keyboardType: TextInputType.number,
              ),
            ),
            // инпут филд
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: TextFormField(
                controller: colorController,
                decoration: const InputDecoration(labelText: "Color (e.g., 'red')"),
              ),
            ),
            // апдейт состояния кнопки
            ElevatedButton(
              onPressed: () {
                setState(() {
                  boxWidth = double.tryParse(widthController.text) ?? 100;
                  boxHeight = double.tryParse(heightController.text) ?? 60;
                  String colorName = colorController.text.toLowerCase();
                  boxColor = _getColorFromString(colorName);
                });
              },
              child: const Text("Create Rectangle"),
            ),
            const SizedBox(height: 20),
            //отображение rectangle
            Container(
              width: boxWidth,
              height: boxHeight,
              color: boxColor,
            ),
          ],
        ),
      ),
    );
  }

  // get color from string
  Color _getColorFromString(String colorString) {
    switch (colorString) {
      case 'red':
        return Colors.red;
      case 'cyan':
        return Colors.cyan;
      case 'green':
        return Colors.green;
      case 'blue':
        return Colors.blue;
      case 'yellow':
        return Colors.yellow;
      case 'grey':
        return Colors.grey;
      default:
        return Colors.red;
    }
  }
}