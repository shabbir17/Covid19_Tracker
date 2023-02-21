import 'dart:io';

import 'package:flutter/material.dart';

class ImageShowcase extends StatelessWidget {
  final List<String> imagePaths;
  final Function(int) onDelete;

    ImageShowcase({Key? key, required this.imagePaths,required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageWidget = <Widget>[];
    for (var i = 0; i < imagePaths.length; i++) {
      imageWidget.add(SingleImageShowcase(
        imagePath: imagePaths[i],
        onDelete: onDelete!= null ? (){onDelete(i);}: null,
      ));
    }
    if (imagePaths.isEmpty) {
      return Container(
          child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("No image selected"),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.image_not_supported_outlined),
          ],
        ),
      ));
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: imageWidget,
      ),
    );
  }
}

class SingleImageShowcase extends StatelessWidget {
  final VoidCallback? onDelete;
  final String imagePath;

  const SingleImageShowcase({Key? key, required this.imagePath,required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Stack(
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: Image.file(
              File(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              right: 0,
              child: Padding(
            padding: EdgeInsets.all(8),
                child: FloatingActionButton(
                  onPressed: onDelete,
                  backgroundColor: Colors.red.shade400,
                  child: Icon(Icons.delete,color: Colors.white,),
                ),
          ))
        ],
      ),
    );
  }
}
