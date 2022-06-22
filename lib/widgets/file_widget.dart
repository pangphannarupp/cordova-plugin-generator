import 'package:flutter/material.dart';

class FileWidget extends StatelessWidget {
  final String fileName;
  final DateTime lastModified;

  FileWidget({required this.fileName, required this.lastModified});

  @override
  Widget build(BuildContext context) {
    Widget fileNameWidget = Text(fileName);
    Icon fileIcon = const Icon(Icons.insert_drive_file, color: Colors.grey,);

    // return Card(
    //   elevation: 0.0,
    //   color: Colors.transparent,
    //   child: ListTile(
    //     leading: fileIcon,
    //     title: fileNameWidget,
    //     // onTap: (()=> print(fileName)),
    //   ),
    // );
    return Card(
      elevation: 0.0,
      color: Colors.transparent,
      child: Row(
        children: [
          fileIcon,
          const SizedBox(width: 5,),
          fileNameWidget
        ],
      ),
    );
  }
}
