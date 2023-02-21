import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareScreen extends StatefulWidget {
  const ShareScreen({Key? key}) : super(key: key);

  @override
  State<ShareScreen> createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  TextEditingController textData = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextFormField(
              controller: textData,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter Message"),
            ),
          ),
          ElevatedButton(onPressed: () async{
            if(textData.value.text.isNotEmpty){
              await Share.share(textData.text);
            }
          }, child: Text("Share Message"))
        ],
      ),
    );
  }
}
