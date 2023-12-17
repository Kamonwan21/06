import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import '../Data/data.dart';

class InputScreen extends StatefulWidget {
  final Function(Map<String, dynamic>) onSave;
  final Function(String) imagesaveat;

  const InputScreen({Key? key, required this.onSave, required this.imagesaveat})
      : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  File? _imageFile;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String imp_path = "";

  void savedImages(File image) {
    if (image != null) {
      _imageFile = image;
    }
  }

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (imageFile != null) {
      setState(() {
        _imageFile = File(imageFile.path);
      });

      final appDir = await getApplicationDocumentsDirectory();
      final fileName = path.basename(imageFile.path);
      final saveImagePath = '${appDir.path}/$fileName';
      imp_path = saveImagePath;
      print("xxxxx:"+imp_path);
      widget.imagesaveat(saveImagePath);
    }
  }

  Future<void> _galleryPicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );
    if (imageFile != null) {
      setState(() {
        _imageFile = File(imageFile.path);
      });
    }
  }

  void onsave() async{
    if (_titleController.text.isEmpty || _imageFile == null) {
      return;
    } else {
      
      widget.onSave({
        'title': _titleController.text,
        'description': imp_path,
      });
      Navigator.pop(context);
    }
  }

  Future<void> _addItem() async {
    await SQLHelper.createItem(
        _titleController.text, imp_path);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'เพิ่มบุคคล',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(hintText: 'ชื่อบุคคล'),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.black12
                      ),
                    ),
                    child: _imageFile != null? Image.file(_imageFile!,fit: BoxFit.cover): Center(child: Text("No Image"))
                  ),
                  SizedBox(height: 30),
                  TextButton.icon(onPressed: _galleryPicture, icon: Icon(Icons.image, size: 40, color: Colors.black),
                  label:Text('แกลอรี่',style: TextStyle(fontSize: 20, color: Colors.black))
                  ),
                  TextButton.icon(onPressed: _takePicture, icon: Icon(Icons.camera, size: 40, color: Colors.black),
                  label:Text('กล้องถ่ายภาพ',style: TextStyle(fontSize: 20, color: Colors.black))
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  widget.onSave({
                    'title': _titleController.text,
                    'description': imp_path,
                  });
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                child: Text(
                  'บันทึก',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
