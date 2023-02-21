import 'package:covid_19_tracker_app/image_and_text_share/image_showcase.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String text = "";
  String subject = "";
  List<String> imagePaths = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Text", hintText: "Enter your text here"),
              onChanged: (val) {
                setState(() {
                  text = val;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Subject", hintText: "Enter your subject here"),
              onChanged: (val) {
                setState(() {
                  subject = val;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            //Image showcase
            ImageShowcase(
              imagePaths: imagePaths,
              onDelete: deleteImage,
            ),
            ListTile(
              title: const Text("Add image"),
              leading: const Icon(Icons.add),
              onTap: () async {
                final imagePicker = ImagePicker();
                final pickedImage =
                    await imagePicker.pickImage(source: ImageSource.gallery);
                if (pickedImage != null) {
                  setState(() {
                    imagePaths.add(pickedImage.path);
                  });
                }
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
                onPressed: text.isEmpty && imagePaths.isEmpty
                    ? null
                    : () {
                        share();
                      },
                child: Text("Share"))
          ],
        ),
      ),
    );
  }

  void share() async {
    if (imagePaths.isEmpty) {
      await Share.share(text, subject: subject);
    } else {
      await Share.shareFiles(text: text, subject: subject, imagePaths);
    }
  }

  void deleteImage(int position) {
    imagePaths.removeAt(position);
  }
}
