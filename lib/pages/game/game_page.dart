import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guess_the_number/pages/game/game.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late Game _game; //or Game? _game;
  final _controller = TextEditingController(); //ปรับเปลี่ยนค่า text field
  String _guessNumber = ''; //เลขที่ทายเข้ามา
  String _feedback = ''; //ผลลัพธ์ที่ได้ว่าทายถูกหรือผิด
  bool start = false;
  bool correct = false;
  int g = 0;

  void _showMaterialDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // ปิด dialog
                Navigator.of(context).pop();
                },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _game = Game();
  }

  @override //keep or clear
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'GUESS THE NUMBER',
        style: TextStyle(color: Colors.white),
      )),
      body: Container(
        color: Colors.yellow.shade100,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildHeader(),
                _buildMainContent(),
                _buildInputPanel(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Image.asset(
          'assets/images/logo_number.png',
          width: 300.0,
        ),
        Text('Guess The Number',
            style: GoogleFonts.balsamiqSans(fontSize: 22.0)),
      ],
    );
  }

  Widget _buildMainContent() {
    return start == false
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "I'm thinking of a number between 1 and 100",
                textAlign: TextAlign.center,
                style: GoogleFonts.balsamiqSans(fontSize: 40.0),
              ),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Can you guess it?',
                    style: GoogleFonts.balsamiqSans(fontSize: 30.0),
                  ),
                  Icon(
                    Icons.favorite_rounded,
                    size: 35.0,
                    color: Colors.red,
                  ),
                ],
              ),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                g.toString(),
                style: GoogleFonts.balsamiqSans(fontSize: 70.0),
              ),
              correct
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_outlined,
                          size: 30.0,
                          color: Colors.green,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          _feedback,
                          style: GoogleFonts.balsamiqSans(fontSize: 25.0),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.close_outlined,
                          size: 30.0,
                          color: Colors.red,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          _feedback,
                          style: GoogleFonts.balsamiqSans(fontSize: 25.0),
                        ),
                      ],
                    ),
              SizedBox(height: 20.0),
              correct
                  ? TextButton(
                      onPressed: () {
                        setState(() {
                          correct = false;
                          start = false;
                        });
                      },
                      child: Text('NEW GAME'))
                  : SizedBox.shrink(),
            ],
          );
  }

  Widget _buildInputPanel() {
    return Row(
      children: [
        Flexible(
          child: TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            style: const TextStyle(
              color: Colors.cyan,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
            cursorColor: Colors.cyan,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              isDense: true,

              // กำหนดลักษณะเส้น border ของ TextField ในสถานะปกติ
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),

              // กำหนดลักษณะเส้น border ของ TextField เมื่อได้รับโฟกัส
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),

              hintText: 'Enter the number here',
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 24.0,
              ),
            ),
          ),
        ),
        TextButton(
            onPressed: () {
              setState(() {
                start = true;
                _guessNumber = _controller.text;
                int? guess = int.tryParse(_guessNumber);
                if (guess != null) {
                  g = guess;
                  var result = _game.doGuess(guess);
                  if (result == 0) {
                    //ทายถูก
                    _feedback = 'CORRECT!';
                    correct = true;
                  } else if (result == 1) {
                    //ทายมาก
                    _feedback = 'TOO HIGH!';
                  } else {
                    //ทายน้อย
                    _feedback = 'TOO LOW!';
                  }
                } else {
                  //_feedback = ''; or _feedback ?? '';
                  _showMaterialDialog('ERROR', 'Please enter the number.');
                }
                if (guess == _game.answer) {
                  int ans = _game.answer;
                  int total = _game.totalGuess;
                  String sort = _game.sortG();
                  _showMaterialDialog('GOOD JOB!',
                      'The answer is $ans\n You have made $total guesses.\n\n $sort');
                }
                _controller.clear();
              });
            },
            child: Text('GUESS'))
      ],
    );
  }
}
