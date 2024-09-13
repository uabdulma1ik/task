import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: bir(),
    );
  }
}

class bir extends StatefulWidget {
  @override
  _birState createState() => _birState();
}

class _birState extends State<bir> {
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
        MaterialPageRoute(builder: (context) => ikki()),
      );
    } else {
  
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('PIN cod xato!')),
        // chat gpt qilib berdi
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 90,),
          Text(
            '6 Xonalik PIN codni kiriting',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Text(
            kod.padRight(6,),
            style: TextStyle(fontSize: 32, letterSpacing: 8),
          ),
          SizedBox(height: 20),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberButton(number: '1', onTap: onNumberPress),
                  SizedBox(width: 5,),
                  NumberButton(number: '2', onTap: onNumberPress),
                  SizedBox(width: 5,),
                  NumberButton(number: '3', onTap: onNumberPress),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberButton(number: '4', onTap: onNumberPress),
                  SizedBox(width: 5,),
                  NumberButton(number: '5', onTap: onNumberPress),
                  SizedBox(width: 5,),
                  NumberButton(number: '6', onTap: onNumberPress),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberButton(number: '7', onTap: onNumberPress),
                  SizedBox(width: 5,),
                  NumberButton(number: '8', onTap: onNumberPress),
                  SizedBox(width: 5,),
                  NumberButton(number: '9', onTap: onNumberPress),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 60), // Placeholder for layout alignment
                  NumberButton(number: '0', onTap: onNumberPress),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: Icon(Icons.backspace),
                      onPressed: n,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: p,
            child: Text('Enter'),
          ),
        ],
      ),
    );
  }
}

class NumberButton extends StatelessWidget {
  final String number;
  final Function(String) onTap;

  const NumberButton({required this.number, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(number),
      child: Container(
        width: 60,
        height: 60,
        alignment: Alignment.center,
        margin: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          number,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}





class ikki extends StatefulWidget {
  const ikki({super.key});

  @override
  State<ikki> createState() => _ikkiState();
}

class _ikkiState extends State<ikki> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

// birxilgi joyini chat gpt bilan qildim abdumalik textfieldni ko'rinmidigon,raqam buttonlari,snekbardi qildim