List<String> structureList = [
  'plugin.xml',
  'package.json',
  'www/plugin_name.js',
  'src/android/plugin_name.java',
  'src/ios/plugin_name.swift',
];

String formatFunctionJS = "\tfunction_name: function(arg, onSuccess, onFail) {\n"+
    "\t\texec(onSuccess, onFail, 'plugin_name', 'function_name', [arg]);\n"+
    "\t},\n";

String formatFunctionSwift = "\t@objc(function_name:)\n"+
"\tfunc function_name(command: CDVInvokedUrlCommand) {\n"+
    "\t\t//callbackId = command.callbackId\n"+
    "\t\t//guard let param = command.argument(at: 0) as? Dictionary<String, Any>,\n"+
    "\t\t//    let body = param[\"body\"] as? Dictionary<String, Any> else {\n"+
"\t\t//        return\n"+
"\t\t//}\n"+
"\t}\n\n";

String formatActionJava = "\t\tif (action.equals(\"action_name\")) {\n"+
"\t\t\tthis.action_name();\n"+
"\t\t\treturn true;\n"+
"\t\t}\n";

String formatFunctionJava = "\tprivate void function_name() {\n"+
    "\t\tcordova.getActivity().runOnUiThread(() -> {\n\n"+
    "\t\t});\n"+
    "\t}\n\n";