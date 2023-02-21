import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class TextShare extends StatefulWidget {
  const TextShare({Key? key}) : super(key: key);

  @override
  State<TextShare> createState() => _TextShareState();
}

class _TextShareState extends State<TextShare> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textData = TextEditingController();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextField(
                controller: textData,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("Enter Message")),
              ),
              ElevatedButton(

                child: Text("Share Text Message"),
                onPressed: ()async{ if(textData.value.text.isNotEmpty){
                  await Share.share(textData.text);

                }},
              )
            ],
          ),
        ),
      ),
    );
  }
}
