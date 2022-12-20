import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  @override
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
                  child: Text('Escolher arquivos'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 76, 67, 107))),
                  onPressed: () {}),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                  child: Text('Formato '),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 76, 67, 107))),
                  onPressed: () {
                    print('a');
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                  child: Text('Converter'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 76, 67, 107))),
                  onPressed: () {}),
            ),
          ),
        ],
      ),
    );
  }
}
