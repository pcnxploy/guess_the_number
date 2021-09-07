import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  String font = 'Prompt';

  promptFont() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.cyan,
        ),
        onPressed: () {
          setState(() {
            font = 'Prompt';
          });
        },
        child: Text(
          'Prompt',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  sarabunFont() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.cyan,
        ),
        onPressed: () {
          setState(() {
            font = 'Sarabun';
          });
        },
        child: Text(
          'Sarabun',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  maliFont() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.cyan,
        ),
        onPressed: () {
          setState(() {
            font = 'Mali';
          });
        },
        child: Text(
          'Mali',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  srirachaFont() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.cyan,
        ),
        onPressed: () {
          setState(() {
            font = 'Sriracha';
          });
        },
        child: Text(
          'Sriracha',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  trirongFont() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.cyan,
        ),
        onPressed: () {
          setState(() {
            font = 'Trirong';
          });
        },
        child: Text(
          'Trirong',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  changeFont(String font){
    if(font == 'Prompt') {
      return Text(
        'การเดินทางขากลับคงจะเหงาน่าดู',
        textAlign: TextAlign.center,
        style: GoogleFonts.prompt(fontSize: 50.0),
      );
    }else if(font == 'Sarabun'){
      return Text(
        'การเดินทางขากลับคงจะเหงาน่าดู',
        textAlign: TextAlign.center,
        style: GoogleFonts.sarabun(fontSize: 50.0),
      );
    }else if(font == 'Mali'){
      return Text(
        'การเดินทางขากลับคงจะเหงาน่าดู',
        textAlign: TextAlign.center,
        style: GoogleFonts.mali(fontSize: 50.0),
      );
    }else if(font == 'Sriracha'){
      return Text(
        'การเดินทางขากลับคงจะเหงาน่าดู',
        textAlign: TextAlign.center,
        style: GoogleFonts.sriracha(fontSize: 50.0),
      );
    }else{
      return Text(
        'การเดินทางขากลับคงจะเหงาน่าดู',
        textAlign: TextAlign.center,
        style: GoogleFonts.trirong(fontSize: 50.0),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'THAI FONT VIEWER',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.amber[50],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: changeFont(font),
                ),
              ),
              Center(child: Text('Font: $font')),
              Card(
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      promptFont(),
                      sarabunFont(),
                      maliFont(),
                      srirachaFont(),
                      trirongFont(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
