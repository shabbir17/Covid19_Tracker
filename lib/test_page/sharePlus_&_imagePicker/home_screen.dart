import 'package:covid_19_tracker_app/test_page/sharePlus_&_imagePicker/image_showcase.dart';
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
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Text", hintText: "Enter your Text Here"),
                  onChanged: (val) {
                    setState(() {
                      text = val;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Subject", hintText: "Enter your subject Here"),
                  onChanged: (val) {
                    setState(() {
                      subject = val;
                    });
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                // image showcase
                ImageShowcase(imagePaths: imagePaths, onDelete: deleteImage,),

                ListTile(
                  leading: Icon(Icons.add),
                  title: const Text("Add image"),
                  onTap: () async {
                    final imagePicker = ImagePicker();
                    final pickedFile =
                    await imagePicker.pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      setState(() {
                        imagePaths.add(pickedFile.path);
                      });
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: text.isEmpty && imagePaths.isEmpty ? null : () {share();},
                    child: Text("Share"))
              ],
            ),
          ],
        ),
      ),
    );
  }
  void share()async{
    if(imagePaths.isEmpty){
      await Share.share(text,subject: subject);
    }else{
      await Share.shareFiles(imagePaths,text: text,subject: subject);

    }

  }
  void deleteImage(int position){
    setState(() {
      imagePaths.removeAt(position);
    });
  }
}
