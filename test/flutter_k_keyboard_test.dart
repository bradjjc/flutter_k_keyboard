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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'you can type',
            ),
            TextField(
              controller: _textController,
              style: Theme.of(context).textTheme.headlineSmall,
              decoration: const InputDecoration(
                helperText: '8자를 입력해주세요',
              ),
              onTap: (){
                onOpenKeyBoard(controller: _textController, numericType: true,);
              },
            ),

          ],
        ),
      ),

    );
  }

  void onOpenKeyBoard({required TextEditingController controller, required bool numericType}) {
    var box = SizedBox(
      height: numericType ? MediaQuery.of(context).size.height * 0.35 : MediaQuery.of(context).size.height * 0.3,
      child: numericType
          ? Center(
        child: KNumPad(
          controller: controller,
          maxLength: 7,
          buttonSize: 130,
          isNotPhoneNumber: true,
          onSubmit: (){
            Navigator.pop(context);
          },
        ),
      )
          : CustomKeyBoard(
        controller: controller,
        onSubmit: (){
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
