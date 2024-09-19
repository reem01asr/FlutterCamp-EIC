/* 
 * Author: Reem Asiri
 * Sorry if my code feels a bit different, my wifi was really bad,
 * and I couldn't keep up, so I had to look up some parts myself.
 * Looking up to learning more stuff!
 */

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 61, 45, 78),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 209, 164, 233),
          title: const Text(
            "Login page",
            style: TextStyle(
                color: Color.fromARGB(255, 61, 45, 78),
                fontSize: 25,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
              Image.asset(
                'assets/purple-planet.png',
                width: 100,
                height: 200,
              ),
              Column(children: [
                TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        labelText: "Email Address",
                        prefixIcon: Icon(Icons.account_circle_outlined),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))))),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock_outline_rounded),
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))))),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    _login(context);
                  },
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 209, 164, 233),
                  ),
                )
              ]),
            ])),
      ),
    );
  }

  void _login(BuildContext context) {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email == 'test@example.com' && password == 'password') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login Successful')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid Email or Password')),
      );
    }
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
