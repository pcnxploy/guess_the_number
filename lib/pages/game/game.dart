import 'dart:math';

class Game {
  final int _answer;
  int _totalGuesses = 0;

  Game() : _answer = Random().nextInt(100) + 1 {
    print('The answer is: $_answer');
  }

  /*  totalGuess is private

  int getTotalGuess(){
    return _totalGuesses;
  }

  or  */
  int get totalGuess {
    return _totalGuesses;
  }

  int get answer{
    return _answer;
  }

  String sort = '';
  String sortG(){
    return sort;
  }

  //check num > or < answer
  int doGuess(int num) {
    _totalGuesses++;

    if(num==answer){
      sort = sort + num.toString();
    }else{
      sort = sort + num.toString() + ' -> ';
    }

    if (num > _answer) {
      return 1;
    } else if (num < _answer) {
      return -1;
    } else {
      return 0;
    }
  }
}
