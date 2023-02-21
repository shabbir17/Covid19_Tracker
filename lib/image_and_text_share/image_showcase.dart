import 'package:flutter/material.dart';
import 'dart:io';
 class ImageShowcase extends StatelessWidget {

   final List<String> imagePaths;
   final Function(int) onDelete;
     const ImageShowcase({Key? key,required this.imagePaths,required this.onDelete}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     final imageWidget=<Widget>[];
     for(var i=0; i<imagePaths.length; i++){
       imageWidget.add(
         SingleImageShowCase(imagePath: imagePaths[i],
         onDelete: onDelete!=null ?()=>onDelete(i):null,),
       );
     }
    if(imagePaths.isEmpty){
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child:Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("No image selected"),
          SizedBox(width: 10.0,),
          Icon(Icons.image_not_supported_outlined)],)
        ),
      );
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children:imageWidget,),
    );
   }
 }
 class SingleImageShowCase extends StatelessWidget {
   final String imagePath;
   final VoidCallback? onDelete;
   const SingleImageShowCase({Key? key,required this.imagePath,required this.onDelete}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return Padding(padding: EdgeInsets.all(8),
     child: Stack(
       children: [
         SizedBox(
           height: 200,
           width: 200,
           child:Image.file( File(imagePath),fit: BoxFit.cover,),
         ),
         Positioned(right:0,child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: FloatingActionButton(onPressed: (){},
           backgroundColor: Colors.red,
           child: const Icon(Icons.delete),),
         ))
       ],
     ),
     );
   }
 }


