import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  String defaultLogin = "login";
  String defaultPassword = "password";

  Login({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  String login = "";
  String password = "";
  bool viewBox = false;

  // переменные для прямоугольника
  double boxWidth = 100;
  double boxHeight = 60;
  Color boxColor = Colors.red;

  // контроллеры для логина и пароля
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // контроллеры для ректангл
  TextEditingController widthController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController colorController = TextEditingController();

  @override
  void initState() {
    login = widget.defaultLogin;
    password = widget.defaultPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Form(
        child: Column(
          children: [
            //логин и пассворд
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
              child: TextFormField(
                controller: loginController,
                decoration: const InputDecoration(label: Text("Username")),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(label: Text("Password")),
              ),
            ),
            // login button
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    viewBox = true;
                    login = loginController.text;
                    password = passwordController.text;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                child: const Text("Sign in"),
              ),
            ),
            // отображаем логин паролль
            Container(
              margin: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: Text(login),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    child: Text(password),
                  ),
                ],
              ),
            ),
            // Отображение прямоугольника после логина
            viewBox
                ? Column(
                    children: [
                      // Поля для изменения параметров прямоугольника
                      Container(
                        margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                        child: TextFormField(
                          controller: widthController,
                          decoration: const InputDecoration(label: Text("Width")),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                        child: TextFormField(
                          controller: heightController,
                          decoration: const InputDecoration(label: Text("Height")),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                        child: TextFormField(
                          controller: colorController,
                          decoration: const InputDecoration(
                            label: Text("Color (e.g., 'red')"),
                          ),
                        ),
                      ),
                      // Кнопка для обновления прямоугольника
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            // Получаем значения из инпутов для прямоугольника
                            boxWidth = double.tryParse(widthController.text) ?? 100;
                            boxHeight = double.tryParse(heightController.text) ?? 60;
                            String colorName = colorController.text.toLowerCase();
                            boxColor = _getColorFromString(colorName);
                          });
                        },
                        child: const Text("Create Rectangle"),
                      ),
                      // Прямоугольник
                      Container(
                        width: boxWidth,
                        height: boxHeight,
                        color: boxColor,
                        margin: const EdgeInsets.only(top: 20),
                      ),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  // Метод для получения цвета из строки
  Color _getColorFromString(String colorString) {
    switch (colorString) {
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      case 'blue':
        return Colors.blue;
      case 'yellow':
        return Colors.yellow;
      default:
        return Colors.red; // Цвет по умолчанию
    }
  }
}