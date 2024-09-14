import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page1(),
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String kod = "";

  void onNumberPress(String number) {
    setState(() {
      if (kod.length < 6) {
        kod += number;
      }
    });
  }

  void n() {
    setState(() {
      if (kod.isNotEmpty) {
        kod = kod.substring(0, kod.length - 1);
      }
    });
  }

  void p() {
    if (kod == '123456') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Page2()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('PIN cod xato!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 90,
          ),
          const Text(
            '6 Xonalik PIN codni kiriting',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          Text(
            kod.padRight(
              6,
            ),
            style: const TextStyle(fontSize: 32, letterSpacing: 8),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberButton(number: '1', onTap: onNumberPress),
                  const SizedBox(
                    width: 5,
                  ),
                  NumberButton(number: '2', onTap: onNumberPress),
                  const SizedBox(
                    width: 5,
                  ),
                  NumberButton(number: '3', onTap: onNumberPress),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberButton(number: '4', onTap: onNumberPress),
                  const SizedBox(
                    width: 5,
                  ),
                  NumberButton(number: '5', onTap: onNumberPress),
                  const SizedBox(
                    width: 5,
                  ),
                  NumberButton(number: '6', onTap: onNumberPress),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberButton(number: '7', onTap: onNumberPress),
                  const SizedBox(
                    width: 5,
                  ),
                  NumberButton(number: '8', onTap: onNumberPress),
                  const SizedBox(
                    width: 5,
                  ),
                  NumberButton(number: '9', onTap: onNumberPress),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 60), // Placeholder for layout alignment
                  NumberButton(number: '0', onTap: onNumberPress),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: const Icon(Icons.backspace),
                      onPressed: n,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: p,
            child: const Text('Enter'),
          ),
        ],
      ),
    );
  }
}

class NumberButton extends StatelessWidget {
  final String number;
  final Function(String) onTap;

  const NumberButton({super.key, required this.number, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(number),
      child: Container(
        width: 60,
        height: 60,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          number,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  List<Data> list1 = [
    Data(path: "images/p1.png", name: "Tom"),
    Data(path: "images/p2.png", name: "Jon"),
    Data(path: "images/p3.png", name: "Jeck"),
    Data(path: "images/p4.png", name: "Don"),
  ];
  List<Data> list2 = [
    Data(path: "images/p3.png", name: "Tom"),
    Data(path: "images/p4.png", name: "Jon"),
    Data(path: "images/p1.png", name: "Jeck"),
    Data(path: "images/p2.png", name: "Don"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(
            Icons.person,
          ),
          Icon(
            Icons.snapchat,
            color: Colors.white,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/home.png"), fit: BoxFit.cover)),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.topLeft,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 15, right: 15, bottom: 11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "People",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: list1.map((e) => Design(e)).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: list2.map((e) => Design(e)).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: list1.map((e) => Design(e)).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 15, right: 15, bottom: 15),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade700)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: Text(
                            "Your Profile",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 30,
                            width: 150,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade100,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.copy,
                                  size: 15,
                                ),
                                Text(" Paste"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Container(
                          height: 30,
                          width: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade100,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.send,
                                size: 15,
                              ),
                              Text(" Send"),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          height: 30,
                          width: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade100,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.more,
                                size: 15,
                              ),
                              Text(" More"),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          height: 30,
                          width: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade100,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 15,
                              ),
                              Text(" Add"),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          height: 30,
                          width: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade100,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.push_pin,
                                size: 15,
                              ),
                              Text(" Pin"),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget Design(Data e) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
    child: Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(e.path!), // Convert String to AssetImage
          radius: 30,
        ),
        const SizedBox(height: 8),
        Text(e.name!),
      ],
    ),
  );
}

class Data {
  String? path;
  String? name;

  Data({this.path, this.name});
}
