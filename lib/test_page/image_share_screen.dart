import 'dart:io';
import 'package:share_plus/share_plus.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ImageShareScreen extends StatefulWidget {
  const ImageShareScreen({Key? key}) : super(key: key);

  @override
  State<ImageShareScreen> createState() => _ImageShareScreenState();
}

class _ImageShareScreenState extends State<ImageShareScreen> {
  final imageurl =
      "https://res.cloudinary.com/practicaldev/image/fetch/s--_HBZhuhF--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://thepracticaldev.s3.amazonaws.com/i/nweeqf97l2md3tlqkjyt.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(imageurl),
            ElevatedButton(
                onPressed: () async {
                  final uri = Uri.parse(imageurl);
                  final res = await http.get(uri);
                  final bytes = res.bodyBytes;

                  final temp = await getTemporaryDirectory();
                  final path = '${temp.path}/image.jpg';

                  await Share.shareXFiles([XFile(path)], text: 'Great picture');

                  //await Share.shareFiles([path]);
                },
                child: Text('Share Image'))
          ],
        ),
      ),
    );
  }
}
