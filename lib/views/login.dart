import 'package:flutter/material.dart';
import 'package:kuis_060/models/data.dart';
import 'package:kuis_060/root.dart';


const String logoUrl =
    'https://play-lh.googleusercontent.com/bB_cyOTbQfFmV4IaeqTIFJVc1Wm4UdQwQai8GjthG4uaXrTHNZTKsMtg9_9058GeZGLgoJzIasYYdFkSvdyQ';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void showMessage(String message, Color color) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(backgroundColor: color, content: Text(message)));
  }

  void login() {
    final username = usernameController.text.trim();
    final password = passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      showMessage("Username dan password tidak boleh kosong", Colors.red);
      return;
    }

    if (username == account.username && password == account.password) {
      showMessage("Login berhasil", Colors.green);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Root(username: username)),
      );
    } else {
      showMessage("Login gagal. Username atau password salah", Colors.red);
    }
  }

  Widget buildLogo() {
    const fallback = Center(
      child: Text(
        "UNIQLO",
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      ),
    );

    if (logoUrl.isEmpty) {
      return fallback;
    }

    return Image.network(
      logoUrl,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) => fallback,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 180, child: buildLogo()),
                const SizedBox(height: 10),
                const Text("Selamat Datang di UNIQLO"),
                const SizedBox(height: 30),
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    hintText: "username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  onSubmitted: (_) => login(),
                  decoration: const InputDecoration(
                    hintText: "password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 40,
                  width: 180,
                  child: ElevatedButton(
                    onPressed: login,
                    child: const Text("Login"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
