import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';


class QbPage extends StatefulWidget {
  const QbPage({Key? key}) : super(key: key);
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const QbPage());
  }
  @override
  State<QbPage> createState() => _QbPageState();
}

class _QbPageState extends State<QbPage> {
  // Future<String> downloadFile(String url, String fileName, String dir) async {
  Future<String> downloadFile(String fileName, String dir) async {
    HttpClient httpClient = HttpClient();
    File file;
    String filePath = '';
    String myUrl = 'http://englishonlineclub.com/pdf/iOS%20Programming%20-%20The%20Big%20Nerd%20Ranch%20Guide%20(6th%20Edition)%20[EnglishOnlineClub.com].pdf';

    try {
     // myUrl = url;
      var request = await httpClient.getUrl(Uri.parse(myUrl));
      var response = await request.close();
      if(response.statusCode == 200) {
        var bytes = await consolidateHttpClientResponseBytes(response);
        filePath = '$dir/$fileName';
        file = File(filePath);
        await file.writeAsBytes(bytes);
      }
      else
        filePath = 'Error code: '+response.statusCode.toString();
    }
    catch(ex){
      filePath = 'Can not fetch url';
    }

    return filePath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Question Bank',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SafeArea(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) => Card(
                elevation: 6,
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.orangeAccent[200],
                    child: Text("QB ${index+1}"),
                  ),
                  title: Text("QB ${index+1} Title"),
                  subtitle: Text("QB ${index+1} Subtitle"),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.download_outlined,
                      size: 20.0,
                      color: Colors.brown[900],
                    ),
                    onPressed: () {
                      downloadFile("Local","QB ${index+1}");
                    },
                  ),
                ),
              ),
            )));
  }
}
