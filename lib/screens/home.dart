import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 128.0, right: 128.0, top: 80.0, bottom: 8.0),
              child: Image.asset('assets/images/logo_white_theme.png'),
            ),
          ),
          const Text(
            'Converter arquivos nunca foi tão fácil!',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color.fromARGB(255, 76, 67, 107)),
          ),
          // const Padding(
          //   padding: EdgeInsets.only(left: 32.0, right: 32.0, top: 64.0),
          //   child: LinearProgressIndicator(
          //     backgroundColor: Colors.lightGreenAccent,
          //     color: Colors.green,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 76, 67, 107))),
                  onPressed: () async {
                    final result = await FilePicker.platform.pickFiles();
                    if (result == null) return;

                    final file = result.files.first;
                    openFile(file);
                  },
                  child: const Text('Escolher arquivos')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 76, 67, 107))),
                  onPressed: () {},
                  child: const Text('Escolher Formato ')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 76, 67, 107))),
                  onPressed: () {},
                  child: const Text('Converter')),
            ),
          ),
        ],
      ),
    );
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }
}

Future<bool> fetchData() async {
  var username = 'e55954b420f7b83b3cddeb3df60c5453509b1dd8';
  var password = "";
  var auth = 'Basic ${base64.encode(utf8.encode('$username:$password'))}';
  var url = Uri.parse('https://sandbox.zamzar.com/v1/formats/gif ');
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': auth,
  };
  var response = await http.get(url, headers: headers);
  print(response.statusCode);
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    print(data);
    return true;
  } else {
    throw Exception('Falha\n ${response.body}');
  }
}
