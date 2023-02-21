import 'package:flutter/material.dart';

class SelectableScreen extends StatefulWidget {
  const SelectableScreen({Key? key}) : super(key: key);

  @override
  State<SelectableScreen> createState() => _SelectableScreenState();
}

class _SelectableScreenState extends State<SelectableScreen> {

  TextEditingController textData= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: TextFormField(
              controller: textData,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "your Text"

              ),
            )),
            TextButton(onPressed: (){print(textData.text);}, child: Text("Button")),
            Expanded(
                flex: 3,
                child: SelectableText(
                  "Lorem Ipsum is simply dummy text of the "
                      "printing"
                      " and typesetting industry. Lorem Ipsum has"
                      " been the industry's standard dummy text "
                      "ever since the 1500s, when an unknown printer"
                      " took a galley of type and scrambled it to make a"
                      " type specimen book. It has survived not only five "
                      "centuries, but also the leap into electronic "
                      "typesetting, remaining essentially unchanged. "
                      "It was popularised in the 1960s with the release"
                      " of Letraset sheets containing Lorem Ipsum passages,"
                      " and more recently with desktop publishing software "
                      "like Aldus PageMaker including versions of Lorem "
                      "Lorem Ipsum is simply dummy text of the printing"
                      " and typesetting industry. Lorem Ipsum has"
                      " been the industry's standard dummy text "
                      "ever since the 1500s, when an unknown printer"
                      " took a galley of type and scrambled it to make a"
                      " type specimen book. It has survived not only five "
                      "centuries, but also the leap into electronic "
                      "typesetting, remaining essentially unchanged. "
                      "It was popularised in the 1960s with the release"
                      " of Letraset sheets containing Lorem Ipsum passages,"
                      " and more recently with desktop publishing software "
                      "like Aldus PageMaker including versions of Lorem "
                      "like Aldus PageMaker including versions of Lorem "
                      "Lorem Ipsum is simply dummy text of the printing"
                      " and typesetting industry. Lorem Ipsum has"
                      " been the industry's standard dummy text "
                      "ever since the 1500s, when an unknown printer"
                      " took a galley of type and scrambled it to make a"
                      " type specimen book. It has survived not only five "
                      "centuries, but also the leap into electronic "
                      "typesetting, remaining essentially unchanged. "
                      "It was popularised in the 1960s with the release"
                      " of Letraset sheets containing Lorem Ipsum passages,"
                      " and more recently with desktop publishing software "
                      "like Aldus PageMaker including versions of Lorem "
                      "Ipsum.",style: TextStyle(fontSize: 24
                    ,fontWeight: FontWeight.w300),
                  //scrollPhysics: ClampingScrollPhysics(),
                  scrollPhysics: BouncingScrollPhysics(),
                  toolbarOptions: ToolbarOptions(
                      copy: true,
                      selectAll: true,paste: true,cut: true

                  ),
                  showCursor: true,
                  cursorColor: Colors.red,
                  cursorHeight: 5,
                  cursorWidth: 10,
                  cursorRadius: Radius.circular(16.0),

                )),
          ],
        ),
      ),)
    );
  }
}
