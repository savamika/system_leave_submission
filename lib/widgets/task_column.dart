// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskColumn extends StatelessWidget {
  final IconData icon;
  final Color iconBackgroundColor;
  final String title;
  final String subtitle;
  final String directLink;

  TaskColumn({
    required this.icon,
    required this.iconBackgroundColor,
    required this.title,
    required this.subtitle,
    required this.directLink
  });
  @override
  Widget build(BuildContext context) {


    return GestureDetector(
        onTap: () async {

          var collection = FirebaseFirestore.instance.collection('manage_link');
          var docSnapshot = await collection.doc('QMUflRH7R4UNFpMm7TG4').get();
          Map<String, dynamic> data = docSnapshot.data()!;

          if (data[directLink] != 'NOLINK') {
            if (await canLaunch(data[directLink])) {
              await launch(data[directLink]);
            } else {
              throw 'Could not launch $data[directLink]';
            }
          } else {
            showAlertDialog(context, 'Untuk saat ini menu belum tersedia');
          }
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 20.0,
              backgroundColor: iconBackgroundColor,
              child: Icon(
                icon,
                size: 15.0,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black45),
                ),

              ],
            )
          ],
        )
    );
  }

  showAlertDialog(BuildContext context, String text) {

    // set up the buttons

    Widget cancelButton = TextButton(
      child: Text("Tutup"),
        onPressed: () => Navigator.pop(context, 'Tutup')
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Perhatian!"),
      content: Text(text),
      actions: [
        cancelButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

Future openFile({required String url, required String fileName}) async {
  await downloadFile(url, fileName);
}

Future<File?> downloadFile(String url, String name) async{
  final appStorage = await getApplicationDocumentsDirectory();
  final file = File('${appStorage.path}/$name');

  try {
    final response = await Dio().get(
      url,
      options: Options(
        responseType: ResponseType.bytes,
        followRedirects: false,
        receiveTimeout: 0,
      ),
    );

    final rat = file.openSync(mode: FileMode.write);
    rat.writeFromSync(response.data);
    await rat.close();

    return file;
  }catch (e){
    return null;
  }
}
