import 'package:flutter/material.dart';

class DirectoryWidget extends StatelessWidget {
  final String directoryName;
  final DateTime lastModified;
  final VoidCallback? onPressedNext;

  DirectoryWidget({
    required this.directoryName,
    required this.lastModified,
    this.onPressedNext,
  });

  @override
  Widget build(BuildContext context) {
    Widget titleWidget = Text(directoryName);
    Icon folderIcon = const Icon(Icons.folder, color: Colors.blue,);

    IconButton expandButton = IconButton(
      icon: const Icon(Icons.navigate_next),
      onPressed: onPressedNext,
    );

    return Card(
      elevation: 0.0,
      color: Colors.transparent,
      child: Row(
        children: [
          folderIcon,
          const SizedBox(width: 5,),
          titleWidget,
        ],
      ),
    );
  }
}
