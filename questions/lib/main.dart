import 'package:flutter/material.dart';
import 'package:questions/appBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('اختبار'),
          backgroundColor: Colors.grey,
        ),
        body: const Padding(
          padding: EdgeInsets.all(20),
          child: HomeBoby(),
        ),
      ),
    );
  }
}

class HomeBoby extends StatefulWidget {
  const HomeBoby({super.key});

  @override
  State<HomeBoby> createState() => _HomeBobyState();
}

class _HomeBobyState extends State<HomeBoby> {
  AppBrain appbrain = AppBrain();
  List<Widget> iconsList = [];
  int rightAnswer = 0;
  void cheekAnswer(bool whatuserPut) {
    bool curectanswer = appbrain.getquestionAnswer();
    setState(() {
      if (whatuserPut == curectanswer) {
        rightAnswer++;
        iconsList.add(const Padding(
          padding: EdgeInsets.all(3.0),
          child: Icon(Icons.thumb_up, color: Colors.green),
        ));
      } else {
        iconsList.add(const Padding(
          padding: EdgeInsets.all(3.0),
          child: Icon(Icons.thumb_down, color: Colors.red),
        ));
      }
      if (appbrain.isFineshed() == true) {
        Alert(
          context: context,
          title: "انتهاء الاختبار ",
          desc: "لقد اجبت على $rightAnswer اسئلة صحيحة من اصل 7",
          buttons: [
            DialogButton(
              onPressed: () => Navigator.pop(context),
              width: 120,
              child: const Text(
                "ابدا من جديد",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ).show();
        appbrain.rest();
        iconsList = [];
        rightAnswer = 0;
      } else {
        appbrain.nextQuestion();
      }
    });
  }

  List<bool> booll = [true, true, false, false];
  int questionNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: iconsList,
        ),
        Expanded(
            flex: 5,
            child: Column(
              children: [
                Image.asset(appbrain.getquestionImage()),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  appbrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24),
                )
              ],
            )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: MaterialButton(
            color: Colors.indigo,
            onPressed: () {
              cheekAnswer(true);
            },
            child: const Text(
              'صح',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: MaterialButton(
            color: Colors.deepOrange,
            onPressed: () {
              cheekAnswer(false);
            },
            child: const Text(
              'خطا',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        )),
      ],
    );
  }
}
