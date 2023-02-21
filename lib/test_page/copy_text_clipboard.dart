import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyTextClipBoard extends StatefulWidget {
  const CopyTextClipBoard({Key? key}) : super(key: key);

  @override
  State<CopyTextClipBoard> createState() => _CopyTextClipBoardState();
}

class _CopyTextClipBoardState extends State<CopyTextClipBoard> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _copy() {
      final value = ClipboardData(text: controller.text);
      Clipboard.setData(value);
    }

    _paste() async {
      final data = await Clipboard.getData("text/plain");
      if (data != null) {
        setState(() {
          controller.text = data.text ?? "";
        });
      }
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller,
              decoration: InputDecoration(hintText: "Enter Text"),
              style: TextStyle(fontSize: 36),
            ),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: _copy,
                  icon: const Icon(Icons.copy),
                  label: const Text("Copy"),
                ),
                SizedBox(
                  width: 10.0,
                ),
                ElevatedButton.icon(
                  onPressed: _paste,
                  icon: const Icon(Icons.paste),
                  label: const Text("Paste"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
