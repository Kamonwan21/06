import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/image_input.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/models/classes.dart';

class MyInputScreen extends StatefulWidget {
  static const routeName = 'MyInputScreen';

  @override
  State<MyInputScreen> createState() => _MyInputScreenState();
}

class _MyInputScreenState extends State<MyInputScreen> {
  final _titleController = TextEditingController();
  File? savedImage;

  void saveImages(File image) {
    savedImage = image;
  }

  void onsave() {
    if (_titleController.text.isEmpty || savedImage == null) {
      return;
    } else {
      Provider.of<ImageFile>(context, listen: false)
          .addImagePlace(_titleController.text, savedImage!);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เพิ่มบุคคล'),backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'ชื่อ',
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ImageInput(saveImages),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
  onPressed: onsave,
  child: Text('บันทึกข้อมูล'),
  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
),
    ));
  }
}
