import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/my_home_page.dart';
import 'package:flutter_application_1/widget/my_input_screen.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/models/classes.dart';

import 'Draw/drawning.dart';
import 'models/Page1.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context) => ImageFile(),
      child: MaterialApp(
        home: Home(),
        routes: {
          MyInputScreen.routeName:(context) => MyInputScreen(),
        },
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FlutterTts flutterTts = FlutterTts();

  speak(String text) async {
    await flutterTts.setSharedInstance(true);
    await flutterTts.setLanguage("th-TH");
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APHASIA HELP CARE",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: GridView.count(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 0.9,
          shrinkWrap: true,
          children: [
            OutlinedButton(
              onPressed: () {
                speak('คำพูด');
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) =>
                          Page1(title: "items_talk", title_name: "คำพูด")),
                );
              },
              child: Column(
                children: [
                  Image.asset("images/01.png", width: 200, height: 150),
                  Text(
                    "คำพูด",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ),
            OutlinedButton(
              onPressed: () {
                speak('กิน');
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => Page1(
                            title: "items_eat",
                            title_name: 'กิน',
                          )),
                );
              },
              child: Column(
                children: [
                  Image.asset("images/02.png", width: 200, height: 150),
                  Text(
                    "กิน",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ),
            OutlinedButton(
              onPressed: () {
                speak('ความรู้สึก');
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => Page1(
                            title: "items_feeling",
                            title_name: 'ความรู้สึก',
                          )),
                );
              },
              child: Column(
                children: [
                  Image.asset("images/03.png", width: 200, height: 150),
                  Text(
                    "ความรู้สึก",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ),
            OutlinedButton(
              onPressed: () {
                speak('ของใช้');
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => Page1(
                            title: "items_items",
                            title_name: 'ของใช้',
                          )),
                );
              },
              child: Column(
                children: [
                  Image.asset("images/04.jpg", width: 200, height: 150),
                  Text(
                    "ของใช้",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ),
            OutlinedButton(
              onPressed: () {
                speak('งานอดิเรก');
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => Page1(
                            title: "items_hobby",
                            title_name: 'งานอดิเรก',
                          )),
                );
              },
              child: Column(
                children: [
                  Image.asset("images/05.png", width: 200, height: 150),
                  Text(
                    "งานอดิเรก",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ),
            OutlinedButton(
              onPressed: () {
                speak('บุคคล');
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
              child: Column(
                children: [
                  Image.asset("images/06.png", width: 200, height: 150),
                  Text(
                    "บุคคล",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ),
            OutlinedButton(
              onPressed: () {
                speak('กิจวัตรประจำวัน');
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => Page1(
                            title: "items_dailyroutine",
                            title_name: 'กิจวัตรประจำวัน',
                          )),
                );
              },
              child: Column(
                children: [
                  Image.asset("images/211.jpg", width: 200, height: 150),
                  Text(
                    "กิจวัตรประจำวัน",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ),
            OutlinedButton(
              onPressed: () {
                speak('สถานที่');
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => Page1(
                            title: "items_staion",
                            title_name: 'สถานที่',
                          )),
                );
              },
              child: Column(
                children: [
                  Image.asset("images/173.jpg", width: 200, height: 150),
                  Text(
                    "สถานที่",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ),
            OutlinedButton(
              onPressed: () {
                speak('ตัวเลข');
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => Page1(
                            title: "items_number",
                            title_name: 'ตัวเลข',
                          )),
                );
              },
              child: Column(
                children: [
                  Image.asset("images/169.jpg", width: 200, height: 150),
                  Text(
                    "ตัวเลข",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ),
            OutlinedButton(
              onPressed: () {
                speak('เครื่องแต่งกาย');
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => Page1(
                            title: "items_clothing",
                            title_name: 'เครื่องแต่งกาย',
                          )),
                );
              },
              child: Column(
                children: [
                  Image.asset("images/191.jpg", width: 200, height: 150),
                  Text(
                    "เครื่องแต่งกาย",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ),
            OutlinedButton(
              onPressed: () {
                speak('ยานพาหนะ');
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => Page1(
                            title: "items_vehicle",
                            title_name: 'ยานพาหนะ',
                          )),
                );
              },
              child: Column(
                children: [
                  Image.asset("images/170.jpg", width: 200, height: 150),
                  Text(
                    "ยานพาหนะ",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ),
            OutlinedButton(
              onPressed: () {
                speak('วาดรูป');
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => Drawning(
                            title_name: 'วาดรูป',
                          )),
                );
              },
              child: Column(
                children: [
                  Image.asset("images/192.png", width: 200, height: 150),
                  Text(
                    "วาดรูป",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

