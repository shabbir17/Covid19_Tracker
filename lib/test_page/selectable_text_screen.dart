import 'package:flutter/material.dart';

class SelectableTextScreen extends StatefulWidget {
  const SelectableTextScreen({Key? key}) : super(key: key);

  @override
  State<SelectableTextScreen> createState() => _SelectableTextScreenState();
}

class _SelectableTextScreenState extends State<SelectableTextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Your Text',
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: SelectableText(
                  "Lorem Ipsum is simply dummy text of the printing"
                  " and typesetting industry. "
                  "Lorem Ipsum has been the industry's standard dummy"
                  " text ever since the "
                  "1500s, when an unknown printer took a galley of "
                  "type and scrambled it "
                  "to make a type specimen book. It has survived not only five centuries, "
                  "but also the leap into electronic typesetting,"
                  " remaining essentially unchanged."
                  " It was popularised in the 1960s with the release of Letraset sheets containing"
                  " Lorem Ipsum passages, and more recently with "
                  "desktop publishing software like "
                  "Aldus PageMaker including versions of Lorem Ipsum."
                  "Aldus PageMaker including versions of Lorem Ipsum."
                  "Lorem Ipsum is simply dummy text of the printing"
                  " and typesetting industry. "
                  "Lorem Ipsum has been the industry's standard dummy "
                  "text ever since the "
                  "1500s, when an unknown printer took a galley of "
                  "type and scrambled it "
                  "to make a type specimen book. It has survived not"
                  " only five centuries, "
                  "but also the leap into "
                  "electronic typesetting, remaining essentially unchanged."
                  " It was popularised in the 1960s"
                  " with the release of Letraset sheets containing"
                  " Lorem Ipsum passages, and more recently"
                  " with desktop publishing software like "
                  " remaining essentially unchanged."
                  " It was popularised in the 1960s with the release of Letraset sheets containing"
                  " Lorem Ipsum passages, and more recently with "
                  "desktop publishing software like "
                  "Aldus PageMaker including versions of Lorem Ipsum."
                  "Aldus PageMaker including versions of Lorem Ipsum."
                  "Lorem Ipsum is simply dummy text of the printing"
                  " and typesetting industry. "
                  "Lorem Ipsum has been the industry's standard dummy "
                  "text ever since the "
                  "1500s, when an unknown printer took a galley of "
                  "type and scrambled it "
                  "to make a type specimen book. It has survived not"
                  " only five centuries, "
                  "but also the leap into "
                  "electronic typesetting, remaining essentially unchanged."
                  " It was popularised in the 1960s"
                  " with the release of Letraset sheets containing"
                  " Lorem Ipsum passages, and more recently",
                  style: TextStyle(fontSize: 24),
                  onTap: () {print("Click Selected Text.....");},
                  scrollPhysics: ClampingScrollPhysics( ),


                  cursorColor: Colors.red,
                  cursorHeight: 5,
                  cursorWidth: 10,
                  cursorRadius: Radius.circular(10),
                  //autofocus: false,
                  maxLines: 10,
                  showCursor: true,
                  //enableInteractiveSelection: true,
                  toolbarOptions: ToolbarOptions(
                      copy: true, cut: true, paste: true, selectAll: true),
                ),
              ),
            ],
          )),
    );
  }
}
