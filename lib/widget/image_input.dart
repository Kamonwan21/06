import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;

class ImageInput extends StatefulWidget {
  final Function imagesaveat;
  ImageInput(this.imagesaveat);
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _imageFile;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (imageFile == null) {
      return;
    }
    setState(() {
      _imageFile = File(imageFile.path);
    });

    final appDir = await syspath.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final saveImagePath = await _imageFile?.copy('${appDir.path}/$fileName');
    widget.imagesaveat(saveImagePath);
  }

  Future<void> _galleryPicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );
    if (imageFile == null) {
      return;
    }
    setState(() {
      _imageFile = File(imageFile.path);
    });
    final appDir = await syspath.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final saveImagePath = await _imageFile?.copy('${appDir.path}/$fileName');
    widget.imagesaveat(saveImagePath);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.black12),
            ),
            child: _imageFile != null
                ? Image.file(
                    _imageFile!,
                    fit: BoxFit.cover,
                  )
                : Center(child: Text("กรุณาเพิ่มรูปภาพ")),
          ),
        SizedBox(height: 30),
        Container(
          child: Column(
            children: [
              TextButton.icon(
                  onPressed: _galleryPicture,
                  icon: Icon(Icons.image, size: 40, color: Colors.green),
                  label: Text('คลังรูปภาพ',
                      style: TextStyle(fontSize: 20, color: Colors.black))),
            ],
          ),
        ),
        TextButton.icon(
            onPressed: _takePicture,
            icon: Icon(Icons.camera, size: 40, color: Colors.green),
            label: Text('กล้องถ่ายภาพ',
                style: TextStyle(fontSize: 20, color: Colors.black))),
      ],
    ));
  }
}
