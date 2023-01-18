import 'dart:io';

import 'package:cordova_plugin_tool/widgets/banner_widget.dart';
import 'package:cordova_plugin_tool/widgets/directory_widget.dart';
import 'package:cordova_plugin_tool/models/document.dart';
import 'package:cordova_plugin_tool/widgets/file_widget.dart';
import 'package:cordova_plugin_tool/structure.dart';
import 'package:filesystem_picker/filesystem_picker.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:url_launcher/url_launcher.dart';
// ignore: depend_on_referenced_packages
import 'package:window_manager/window_manager.dart';
import 'package:tree_view/tree_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  windowManager.waitUntilReadyToShow().then((_) async {
    double width = 1000, height = 850;
    await windowManager.setMaximumSize(Size(width, height));
    await windowManager.setMinimumSize(Size(width, height));
    // await windowManager.setFullScreen(false);
    // await windowManager.center();
    await windowManager.show();
    await windowManager.setSkipTaskbar(false);
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cordova Plugin Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Cordova Plugin Generator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: non_constant_identifier_names
  final String PLUGIN_NAME = 'plugin_name';
  // ignore: non_constant_identifier_names
  final String PLUGIN_ID = 'plugin_id';
  // ignore: non_constant_identifier_names
  final String FUNCTION_NAME = 'function_name';
  // ignore: non_constant_identifier_names
  final String ACTION_NAME = 'action_name';
  // ignore: non_constant_identifier_names
  final String PACKAGE_ID = 'package_id';
  // ignore: non_constant_identifier_names
  final String PACKAGE_PATH = 'package_path';
  // ignore: non_constant_identifier_names
  final String PACKAGE_VERSION = 'plugin_version';

  String projectPath = 'C:/cordova-plugin/';
  String pluginId = 'cordova-plugin-name';
  String pluginVersion = '1.0.0';
  String pluginName = 'PluginName';
  List<String> functionNameList = [];

  final formKey = GlobalKey<FormState>();
  String txtPluginName = '';
  String txtPluginId = '';
  String txtPluginVersion = '';
  String txtFunctionList = '';
  String txtOutputPath = '';

  int menuIndex = 0;

  List<Document> documentList = [
    Document(
      name: 'PluginName',
      dateModified: DateTime.now(),
      isFile: false,
      childData: [
        Document(name: 'src', dateModified: DateTime.now(), childData: [
          Document(name: 'android', dateModified: DateTime.now(), childData: [
            Document(
              name: 'PluginName.java',
              dateModified: DateTime.now(),
              isFile: true,
            ),
          ]),
          Document(name: 'ios', dateModified: DateTime.now(), childData: [
            Document(
              name: 'PluginName.swift',
              dateModified: DateTime.now(),
              isFile: true,
            ),
          ])
        ]),
        Document(name: 'www', dateModified: DateTime.now(), childData: [
          Document(
            name: 'PluginName.js',
            dateModified: DateTime.now(),
            isFile: true,
          ),
        ]),
        Document(
          name: 'package.json',
          dateModified: DateTime.now(),
          isFile: true,
        ),
        Document(
          name: 'plugin.xml',
          dateModified: DateTime.now(),
          isFile: true,
        ),
      ],
    ),
    Document(
      name: 'Ionic Interface',
      dateModified: DateTime.now(),
      isFile: false,
      childData: [
        Document(name: 'ngx', dateModified: DateTime.now(), childData: [
          Document(
            name: 'index.d.ts',
            dateModified: DateTime.now(),
            isFile: true,
          ),
          Document(
            name: 'index.js',
            dateModified: DateTime.now(),
            isFile: true,
          ),
          Document(
            name: 'index.metadata.json',
            dateModified: DateTime.now(),
            isFile: true,
          ),
        ]),
        Document(
          name: 'index.d.ts',
          dateModified: DateTime.now(),
          isFile: true,
        ),
        Document(
          name: 'index.js',
          dateModified: DateTime.now(),
          isFile: true,
        ),
      ],
    ),
  ];

  void generateTreeView(String pluginName, String pluginId) {
    setState(() {
      pluginName = pluginName != '' ? pluginName : 'PluginName';
      pluginId = pluginId != '' ? pluginId : 'cordova-plugin-name';
      documentList.clear();
      documentList.add(Document(
        name: pluginName,
        dateModified: DateTime.now(),
        isFile: false,
        childData: [
          Document(name: 'src', dateModified: DateTime.now(), childData: [
            Document(name: 'android', dateModified: DateTime.now(), childData: [
              Document(
                name: '$pluginName.java',
                dateModified: DateTime.now(),
                isFile: true,
              ),
            ]),
            Document(name: 'ios', dateModified: DateTime.now(), childData: [
              Document(
                name: '$pluginName.swift',
                dateModified: DateTime.now(),
                isFile: true,
              ),
            ])
          ]),
          Document(name: 'www', dateModified: DateTime.now(), childData: [
            Document(
              name: '$pluginName.js',
              dateModified: DateTime.now(),
              isFile: true,
            ),
          ]),
          Document(
            name: 'package.json',
            dateModified: DateTime.now(),
            isFile: true,
          ),
          Document(
            name: 'plugin.xml',
            dateModified: DateTime.now(),
            isFile: true,
          ),
        ],
      ));
      documentList.add(Document(
        name: pluginId,
        dateModified: DateTime.now(),
        isFile: false,
        childData: [
          Document(name: 'ngx', dateModified: DateTime.now(), childData: [
            Document(
              name: 'index.d.ts',
              dateModified: DateTime.now(),
              isFile: true,
            ),
            Document(
              name: 'index.js',
              dateModified: DateTime.now(),
              isFile: true,
            ),
            Document(
              name: 'index.metadata.json',
              dateModified: DateTime.now(),
              isFile: true,
            ),
          ]),
          Document(
            name: 'index.d.ts',
            dateModified: DateTime.now(),
            isFile: true,
          ),
          Document(
            name: 'index.js',
            dateModified: DateTime.now(),
            isFile: true,
          ),
        ],
      ));
    });
  }

  List<Widget> getChildList(List<Document> childDocuments) {
    return childDocuments.map((document) {
      if (!document.isFile) {
        return Container(
          margin: const EdgeInsets.only(left: 8),
          child: TreeViewChild(
            parent: getDocumentWidget(document: document),
            children: getChildList(document.childData),
          ),
        );
      }
      return Container(
        margin: const EdgeInsets.only(left: 8.0),
        child: getDocumentWidget(document: document),
      );
    }).toList();
  }

  Widget getDocumentWidget({required Document document}) => document.isFile
      ? getFileWidget(document: document)
      : getDirectoryWidget(document: document);

  DirectoryWidget getDirectoryWidget({required Document document}) =>
      DirectoryWidget(
        directoryName: document.name,
        lastModified: document.dateModified,
      );

  FileWidget getFileWidget({required Document document}) => FileWidget(
        fileName: document.name,
        lastModified: document.dateModified,
      );

  Future<void> alertMessage(String description) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(description),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
                //launch(txtOutputPath);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> loadAndWriteStringBody(String file) async {
    String stringBody = await rootBundle.loadString('assets/sample/$file');
    if (file.contains('$PLUGIN_NAME.js')) {
      var functionName = '';
      for (int i = 0; i < functionNameList.length; i++) {
        functionName += formatFunctionJS
            .replaceAll(PLUGIN_NAME, pluginName)
            .replaceAll(FUNCTION_NAME, functionNameList[i]);
      }
      stringBody = stringBody.replaceAll(PLUGIN_NAME, pluginName);
      stringBody = stringBody.replaceAll(FUNCTION_NAME, functionName);
    } else if (file.contains('$PLUGIN_NAME.swift')) {
      var functionName = '';
      for (int i = 0; i < functionNameList.length; i++) {
        functionName +=
            formatFunctionSwift.replaceAll(FUNCTION_NAME, functionNameList[i]);
      }
      stringBody = stringBody.replaceAll(PLUGIN_NAME, pluginName);
      stringBody = stringBody.replaceAll(FUNCTION_NAME, functionName);
    } else if (file.contains('$PLUGIN_NAME.java')) {
      var actionName = '';
      var functionName = '';
      for (int i = 0; i < functionNameList.length; i++) {
        actionName +=
            formatActionJava.replaceAll(ACTION_NAME, functionNameList[i]);
        functionName +=
            formatFunctionJava.replaceAll(FUNCTION_NAME, functionNameList[i]);
      }
      stringBody = stringBody
          .replaceAll(PACKAGE_ID, pluginId.replaceAll('-', '.'))
          .replaceAll(PLUGIN_NAME, pluginName);
      stringBody = stringBody
          .replaceAll(ACTION_NAME, actionName)
          .replaceAll(FUNCTION_NAME, functionName);
    } else if (file.contains('$PLUGIN_ID/index.js')) {
      var functionName = '';
      for (int i = 0; i < functionNameList.length; i++) {
        functionName += formatFunctionIndexJS
            .replaceAll(FUNCTION_NAME, functionNameList[i])
            .replaceAll(PLUGIN_NAME, pluginName);
      }
      stringBody = stringBody.replaceAll(FUNCTION_NAME, functionName);
      stringBody = stringBody.replaceAll(PLUGIN_NAME, pluginName);
      stringBody = stringBody.replaceAll(PLUGIN_ID, pluginId);
    } else if (file.contains('$PLUGIN_ID/ngx/index.js')) {
      var functionName = '';
      for (int i = 0; i < functionNameList.length; i++) {
        functionName += formatFunctionIndexJSNGX
            .replaceAll(FUNCTION_NAME, functionNameList[i])
            .replaceAll(PLUGIN_NAME, pluginName);
      }
      stringBody = stringBody.replaceAll(FUNCTION_NAME, functionName);
      stringBody = stringBody.replaceAll(PLUGIN_NAME, pluginName);
      stringBody = stringBody.replaceAll(PLUGIN_ID, pluginId);
    } else if (file.contains('index.d.ts')) {
      var functionName = '';
      for (int i = 0; i < functionNameList.length; i++) {
        functionName += formatFunctionIndexDTS.replaceAll(
            FUNCTION_NAME, functionNameList[i]);
      }
      stringBody = stringBody.replaceAll(FUNCTION_NAME, functionName);
      stringBody = stringBody.replaceAll(PLUGIN_NAME, pluginName);
    } else if (file.contains('index.metadata.json')) {
      var functionName = '';
      for (int i = 0; i < functionNameList.length; i++) {
        functionName += formatFunctionIndexMetadataJSON.replaceAll(
            FUNCTION_NAME, functionNameList[i]);
      }
      functionName = functionName.substring(0, functionName.length - 1);
      stringBody = stringBody.replaceAll(FUNCTION_NAME, functionName);
      stringBody = stringBody.replaceAll(PLUGIN_NAME, pluginName);
    } else {
      stringBody = stringBody
          .replaceAll(PLUGIN_ID, pluginId)
          .replaceAll(PACKAGE_VERSION, pluginVersion)
          .replaceAll(PLUGIN_NAME, pluginName)
          .replaceAll(PACKAGE_ID, pluginId.replaceAll('-', '.'))
          .replaceAll(PACKAGE_PATH, pluginId.replaceAll('-', '/'));
    }
    file = file.contains(PLUGIN_NAME)
        ? file.replaceAll(PLUGIN_NAME, pluginName)
        : file;
    // if (kDebugMode) {
    //   print(stringBody);
    // }
    // writeStringBody(file, stringBody);
    writeStringBody(file.replaceAll(PLUGIN_ID, pluginId), stringBody);
  }

  Future<void> writeStringBody(String file, String body) async {
    final newFile = File('$projectPath/$pluginName/$file');
    await newFile.writeAsString(body.toString());
  }

  void createFile(String file) {
    var newFile = file.contains(PLUGIN_NAME)
        ? file.replaceAll(PLUGIN_NAME, pluginName)
        : file;
    File('$projectPath/$pluginName/${newFile.replaceAll(PLUGIN_ID, pluginId)}')
        .create(recursive: true)
        .then((File f) {
      loadAndWriteStringBody(file);
    });
  }

  void createProject() {
    for (int i = 0; i < structureList.length; i++) {
      createFile(structureList[i]);

      if (i == structureList.length - 1) {
        formKey.currentState!.reset();
        setState(() {
          txtPluginName = '';
          txtPluginId = '';
          txtPluginVersion = '';
          txtFunctionList = '';
          txtOutputPath = '';
        });
        generateTreeView('', '');
        alertMessage('$pluginName is generated successfully.');
      }
    }
  }

  @override
  initState() {
    super.initState();

    generateTreeView(pluginName, pluginId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const BannerWidget(),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: TreeView(
                      startExpanded: true,
                      children: getChildList(documentList),
                    ),
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: SingleChildScrollView(
                      child: Container(
                          margin: const EdgeInsets.only(top: 0),
                          padding: const EdgeInsets.only(
                              left: 0, right: 10, bottom: 10),
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter plugin name';
                                    }
                                    setState(() {
                                      txtPluginName = value;
                                    });
                                    return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      txtPluginName = value;
                                    });
                                    generateTreeView(
                                        txtPluginName, txtPluginId);
                                  },
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    prefixIcon:
                                        const Icon(Icons.insert_drive_file),
                                    hintText: 'PluginName',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter plugin id';
                                    }
                                    setState(() {
                                      txtPluginId = value;
                                    });
                                    return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      txtPluginId = value;
                                    });
                                    generateTreeView(
                                        txtPluginName, txtPluginId);
                                  },
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    prefixIcon:
                                        const Icon(Icons.sd_card_rounded),
                                    hintText: 'cordova-plugin-name',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter plugin version';
                                    }
                                    setState(() {
                                      txtPluginVersion = value;
                                    });
                                    return null;
                                  },
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.verified),
                                    hintText: '1.0.0',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter all functions and separate by comma';
                                    }
                                    setState(() {
                                      txtFunctionList = value;
                                    });
                                    return null;
                                  },
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.list),
                                    hintText: 'function name, function name',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    // Expanded(
                                    //     child: TextFormField(
                                    //   validator: (value) {
                                    //     if (value == null || value.isEmpty) {
                                    //       return 'Please enter output path';
                                    //     }
                                    //     setState(() {
                                    //       txtOutputPath = value;
                                    //     });
                                    //     return null;
                                    //   },
                                    //   enabled: false,
                                    //   maxLines: 1,
                                    //   decoration: InputDecoration(
                                    //     prefixIcon: const Icon(Icons.folder),
                                    //     hintText: Platform.isWindows
                                    //         ? 'C:/cordova-plugin'
                                    //         : '/Users/Desktop',
                                    //     border: OutlineInputBorder(
                                    //       borderRadius:
                                    //           BorderRadius.circular(10),
                                    //     ),
                                    //   ),
                                    // )),
                                    Expanded(child:
                                    Container(
                                      padding: const EdgeInsets.all(17),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 1,
                                          )),
                                      child: Text(txtOutputPath),
                                    )),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        Directory rootPath =
                                            await getLibraryDirectory();
                                        String? path =
                                            await FilesystemPicker.open(
                                          title: 'Save to folder',
                                          context: context,
                                          rootDirectory: rootPath,
                                          fsType: FilesystemType.folder,
                                          pickText: 'Choose',
                                          folderIconColor:
                                              Theme.of(context).primaryColor,
                                        );
                                        setState(() {
                                          txtOutputPath = path!;
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(17),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 1,
                                            )),
                                        child: const Text('Browse'),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      functionNameList.clear();
                                      txtFunctionList =
                                          txtFunctionList.replaceAll(' ', '');
                                      List<String> functionList =
                                          txtFunctionList.split(',');

                                      txtOutputPath = !txtOutputPath[
                                                  txtOutputPath.length - 1]
                                              .contains('/')
                                          ? '$txtOutputPath/'
                                          : txtOutputPath;
                                      txtOutputPath =
                                          txtOutputPath.replaceAll('\\', '/');

                                      setState(() {
                                        pluginName =
                                            txtPluginName.replaceAll(' ', '');
                                        pluginId =
                                            txtPluginId.replaceAll(' ', '');
                                        pluginVersion = txtPluginVersion
                                            .replaceAll(' ', '');
                                        projectPath = txtOutputPath;
                                        for (int i = 0;
                                            i < functionList.length;
                                            i++) {
                                          if (functionList[i] != '') {
                                            functionNameList
                                                .add(functionList[i]);
                                          }
                                        }
                                      });
                                      createProject();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 15, 40, 15),
                                  ),
                                  child: const Text(
                                    'Generate',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    )),
                // const Expanded(flex: 1, child: SizedBox(),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
