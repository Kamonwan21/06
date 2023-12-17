import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/my_input_screen.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/models/classes.dart' as ima;

class MyHomePage extends StatelessWidget {
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          speak('เพิ่มบุคคล');
          Navigator.pushNamed(context, MyInputScreen.routeName);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      appBar: AppBar(
        title: Text('บุคคล',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder(
        future: Provider.of<ima.ImageFile>(context, listen: false).fetchImage(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            // Use Consumer here to rebuild the widget when the data changes
            return Consumer<ima.ImageFile>(
                child: Text('data'),
                builder: (context, image, child) => image.items.length <= 0
                    ? Center(
                        child: Text('No images available.'),
                      )
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 3 / 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: GridTile(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: GestureDetector(
                                onTap: () {
                                  speak(image.items[index].title);
                                  print(image.items[index].title);
                                },
                                child: Image.file(
                                  image.items[index].image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            footer: GridTileBar(
                              leading: Text(
                                image.items[index].title,
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        itemCount: image.items.length,
                      ));
          }
        },
      ),
    );
  }
}
