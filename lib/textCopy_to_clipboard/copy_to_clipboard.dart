import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyToClipBoard extends StatefulWidget {
  const CopyToClipBoard({Key? key}) : super(key: key);

  @override
  State<CopyToClipBoard> createState() => _CopyToClipBoardState();
}

class _CopyToClipBoardState extends State<CopyToClipBoard> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String mText = "My name is Rahim,,My name is RahimMy name is RahimMy name is RahimMy name is Rahim";

    _copy() {
      Clipboard.setData(ClipboardData(text:mText));
      //final value= ClipboardData(text:mText );
     // Clipboard.setData(value);
    }
    _paste() async{
      final data= await Clipboard.getData("text/plain");
      if(data!=null){
       setState(() {
         controller.text=data.text?? " ";
       });
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller,
              decoration: InputDecoration(hintText: "Enter Text",border: null
              ),
              style: TextStyle(fontSize: 36.0),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                ElevatedButton.icon(
                    onPressed: _copy,
                    icon: const Icon(Icons.copy),
                    label: const Text("Copy")),
                SizedBox(
                  width: 15,
                ),
                ElevatedButton.icon(
                  onPressed: _paste,
                  icon: const Icon(Icons.paste),
                  label: const Text("Paste"),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(mText),
          ],
        ),
      ),
    );
  }
}

