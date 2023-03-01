import 'package:flutter/material.dart';
import 'package:flutter_k_keyboard/flutter_k_keyboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'k_keyboard Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("k_keyboard"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: const Center(
                child: Text(
                  'you can type',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _textController,
                  style: Theme.of(context).textTheme.headlineMedium,
                  decoration: const InputDecoration(
                    hintText: 'type text',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.0),
                    ),
                  ),
                  onTap: () {
                    onOpenKeyBoard(
                      controller: _textController,
                      numericType: false,
                      // isNotPhoneNumber: true,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onOpenKeyBoard({
    required TextEditingController controller,
    required bool numericType,
    bool isNotPhoneNumber = false,
  }) {
    var box = SizedBox(
      height: numericType
          ? MediaQuery.of(context).size.height * 0.4
          : MediaQuery.of(context).size.height * 0.25,
      child: numericType
          ? Center(
              child: KNumPad(
                controller: controller,
                maxLength: 11,
                buttonSize: 65,
                isNotPhoneNumber: isNotPhoneNumber,
                onSubmit: () {
                  Navigator.pop(context);
                },
              ),
            )
          : CustomKeyBoard(
              controller: controller,
              maxLength: 12,
              textSize: 15,
              onSubmit: () {
                Navigator.pop(context);
              },
            ),
    );
    showModalBottomSheet(
      elevation: 0,
      context: context,
      isScrollControlled: true,
      barrierColor: Colors.transparent,
      builder: (context) {
        return box;
      },
    );
  }
}
