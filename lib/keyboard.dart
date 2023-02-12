import 'package:flutter/material.dart';

class CustomKeyBoard extends StatefulWidget {
  const CustomKeyBoard({
    Key? key,
    required this.onSubmit,
    required this.controller,
    this.maxLength = 12,
    this.backgroundColor = Colors.grey,
    this.buttonColor = Colors.white,
    this.iconColor = Colors.black,
    this.backgroundOpacity = 0.3,
    this.textSize = 25,
  }) : super(key: key);

  final TextEditingController controller;
  final Function onSubmit;
  final int maxLength;
  final Color backgroundColor;
  final Color buttonColor;
  final Color iconColor;
  final double backgroundOpacity;
  final double textSize;

  @override
  State<CustomKeyBoard> createState() => _CustomKeyBoardState();
}

class _CustomKeyBoardState extends State<CustomKeyBoard> {
  // true 한글 false 영어
  bool language = true;
  bool upperCase = false;
  // ["1","2","3","4","5","6","7","8","9","0"],
  List<List<String>> keys = [
    ["ㅂ","ㅈ","ㄷ","ㄱ","ㅅ","ㅛ","ㅕ","ㅑ","ㅐ","ㅔ"],
    ["ㅁ","ㄴ","ㅇ","ㄹ","ㅎ","ㅗ","ㅓ","ㅏ","ㅣ"],
    ["CAPS","ㅋ","ㅌ","ㅊ","ㅍ","ㅠ","ㅜ","ㅡ","DEL"],
    ["한/영","space","Enter"],
  ];

  final keysKor = [
    ["ㅂ","ㅈ","ㄷ","ㄱ","ㅅ","ㅛ","ㅕ","ㅑ","ㅐ","ㅔ"],
    ["ㅁ","ㄴ","ㅇ","ㄹ","ㅎ","ㅗ","ㅓ","ㅏ","ㅣ"],
    ["CAPS","ㅋ","ㅌ","ㅊ","ㅍ","ㅠ","ㅜ","ㅡ","DEL"],
    ["한/영","space","Enter"],
  ];

  final keysKorCaps = [
    ["ㅃ","ㅉ","ㄸ","ㄲ","ㅆ","ㅛ","ㅕ","ㅑ","ㅒ","ㅖ"],
    ["ㅁ","ㄴ","ㅇ","ㄹ","ㅎ","ㅗ","ㅓ","ㅏ","ㅣ"],
    ["CAPS","ㅋ","ㅌ","ㅊ","ㅍ","ㅠ","ㅜ","ㅡ","DEL"],
    ["한/영","space","Enter"],
  ];

  final keysEng = [
    ["q","w","e","r","t","y","u","i","o","p"],
    ["a","s","d","f","g","h","j","k","l"],
    ["CAPS","z","x","c","v","b","n","m","DEL"],
    ["한/영","space","Enter"],
  ];

  String cho = '0x0000';
  String jun = '0x0000';
  String jon = '0x0000';
  String jonFlag = '0x0000';
  String doubleJonFlag = '0x0000';
  String junFlag = '0x0000';
  List<int> chos = [0x3131, 0x3132, 0x3134, 0x3137, 0x3138, 0x3139, 0x3141,0x3142, 0x3143, 0x3145, 0x3146, 0x3147, 0x3148, 0x3149, 0x314a, 0x314b, 0x314c, 0x314d, 0x314e];
  List<int> juns = [0x314f, 0x3150, 0x3151, 0x3152, 0x3153, 0x3154, 0x3155, 0x3156, 0x3157, 0x3158, 0x3159, 0x315a, 0x315b, 0x315c, 0x315d, 0x315e, 0x315f, 0x3160, 0x3161, 0x3162, 0x3163];
  List<int> jons = [0x0000, 0x3131, 0x3132, 0x3133, 0x3134, 0x3135, 0x3136, 0x3137, 0x3139, 0x313a, 0x313b, 0x313c, 0x313d, 0x313e, 0x313f, 0x3140, 0x3141, 0x3142, 0x3144, 0x3145, 0x3146, 0x3147, 0x3148, 0x314a, 0x314b, 0x314c, 0x314d, 0x314e];

  int hangleState = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor.withOpacity(widget.backgroundOpacity),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0, left: 5.0, right: 5.0),
        child: Column(
          children: [
            Table(
              children: [
                TableRow(
                    children: List.generate(
                        keys[0].length,
                            (i) => TableCell(
                          child: SizedBox(
                            height: 100,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
                              child: ElevatedButton(
//                                 elevation: 0,
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius:
//                                     BorderRadius.circular(5.0)),
// //                              side: BorderSide(color: Colors.red)),
//                                 textColor: Colors.black,
//                                 color: Colors.white,
                                  child: Text(keys[0][i],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: widget.textSize),
                                  ),
                                  onPressed: () {
                                    _buttonClick(columnIndex: 0, rowIndex: i);
                                  }),
                            ),
                          ),
                        ))),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Table(
                children: [
                  TableRow(
                      children: List.generate(
                          keys[1].length,
                              (i) => TableCell(
                            child: SizedBox(
                              height: 100,
                              child: Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
                                child: ElevatedButton(
//                                     elevation: 0,
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                         BorderRadius.circular(5.0)),
// //                              side: BorderSide(color: Colors.red)),
//                                     textColor: Colors.black,
//                                     color: Colors.white,
                                    child: Text(keys[1][i],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: widget.textSize),
                                    ),
                                    onPressed: () {
                                      //   _answerPush(i + 10);
                                      _buttonClick(columnIndex: 1, rowIndex: i);
                                    }),
                              ),
                            ),
                          ))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Table(
                children: [
                  TableRow(
                      children: List.generate(
                          keys[2].length,
                              (i) => TableCell(
                            child: SizedBox(
                              height: 100,
                              child: Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
                                child: ElevatedButton(
//                                     elevation: 0,
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                         BorderRadius.circular(5.0)),
// //                              side: BorderSide(color: Colors.red)),
//                                     textColor: Colors.black,
//                                     color: Colors.white,
                                    child: Text(keys[2][i],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: widget.textSize),
                                    ),
                                    onPressed: () {
                                      //   _answerPush(i + 19);
                                      _buttonClick(columnIndex: 2, rowIndex: i);
                                    }),
                              ),
                            ),
                          ))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Table(
                children: [
                  TableRow(
                      children: List.generate(
                          keys[3].length,
                              (i) => TableCell(
                            child: SizedBox(
                              height: 100,
                              child: Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
                                child: ElevatedButton(
//                                     elevation: 0,
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                         BorderRadius.circular(5.0)),
// //                              side: BorderSide(color: Colors.red)),
//                                     textColor: Colors.black,
//                                     color: Colors.white,
                                    child: Text(keys[3][i],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: widget.textSize),
                                    ),
                                    onPressed: () {
                                      _buttonClick(columnIndex: 3, rowIndex: i);
                                    }),
                              ),
                            ),
                          ))),
                ],
              ),
            ),
          ],

        ),
      ),
    );
  }

  _buttonClick({required columnIndex, required int rowIndex}){
    if (keys[columnIndex][rowIndex] == '') {
      return;
    } else {
      if(keys[columnIndex][rowIndex] == '한/영'){
        if(language){
          setState(() {
            keys.clear();
            keys.addAll(keysEng);
            language = false;
            upperCase = false;
          });
        } else {
          setState(() {
            keys.clear();
            keys.addAll(keysKor);
            language = true;
            upperCase = false;
          });
        }
      } else if(keys[columnIndex][rowIndex] == 'CAPS'){
        if(!language){
          if(!upperCase){
            setState(() {
              upperCase = true;
              keys = keys.map((e) => e.map((e) => e != "CAPS" && e != "DEL" && e != "한/영" && e != "space" && e != "Enter" ? e.toUpperCase() : e).toList()).toList();
            });
          } else {
            setState(() {
              upperCase = false;
              keys = keys.map((e) => e.map((e) => e != "CAPS" && e != "DEL" && e != "한/영" && e != "space" && e != "Enter" ? e.toLowerCase() : e).toList()).toList();
            });
          }
          //한글 일때
        } else {
          if(!upperCase){
            setState(() {
              upperCase = true;
              keys.clear();
              keys.addAll(keysKorCaps);
            });
          } else {
            setState(() {
              upperCase = false;
              keys.clear();
              keys.addAll(keysKor);
            });
          }
        }
      } else if(keys[columnIndex][rowIndex] == 'space') {
        setState(() {
          hangleState = 0;
          clear();
          widget.controller.text += ' ';
        });
      } else if(keys[columnIndex][rowIndex] == 'DEL') {
        delete();
      } else if(keys[columnIndex][rowIndex] == 'Enter') {
        widget.onSubmit();
      } else {
        if(language){
          commit(keys[columnIndex][rowIndex]);
        } else {
          setState(() {
            widget.controller.text += keys[columnIndex][rowIndex];
          });
        }

      }
    }
  }

  clear(){
    setState(() {
      cho = '0x0000';
      jun = '0x0000';
      jon = '0x0000';
      jonFlag = '0x0000';
      doubleJonFlag = '0x0000';
      junFlag = '0x0000';
    });
  }

  String makeHan(){
    if(hangleState == 0){
      return '0x0000';
    }
    if(hangleState == 1){
      return String.fromCharCode(int.parse(cho));
    }
    int choIndex = chos.indexOf(int.parse(cho));
    int junIndex = juns.indexOf(int.parse(jun));
    int jonIndex = jons.indexOf(int.parse(jon));

    int makeResult = 0xAC00 + (28 * 21 * (choIndex)) + (28 * (junIndex))  + jonIndex;

    return String.fromCharCode(makeResult);
  }

  commit(String hanGle){
    if(!chos.contains(hanGle.codeUnitAt(0)) && !juns.contains(hanGle.codeUnitAt(0)) && !jons.contains(hanGle.codeUnitAt(0))){
      setState(() {
        directlyCommit();
        widget.controller.text += hanGle.toString();
      });
      return;
    }
    if(hangleState == 0){
      if(juns.contains(hanGle.codeUnitAt(0))){
        setState(() {
          widget.controller.text += hanGle.toString();
          clear();
        });
        //초성일 경우
      }else{
        setState(() {
          hangleState = 1;
          cho = hanGle.codeUnitAt(0).toString();
          widget.controller.text += makeHan();
        });
      }
    } else if(hangleState == 1){
      if(chos.contains(hanGle.codeUnitAt(0))){
        setState(() {
          clear();
          // hangleState = 0;
          cho = hanGle.codeUnitAt(0).toString();
          widget.controller.text += makeHan();
        });
      }else{
        //중성일 경우
        setState(() {
          hangleState = 2;
          jun = hanGle.codeUnitAt(0).toString();
          widget.controller.text = widget.controller.text.substring(0, widget.controller.text.length - 1);
          widget.controller.text += makeHan();
        });
      }
    } else if(hangleState == 2){
      if(juns.contains(hanGle.codeUnitAt(0))){
        // 다른 중성 일때 바꿈
        if(doubleJunEnable(hanGle)){
          setState(() {
            widget.controller.text = widget.controller.text.substring(0, widget.controller.text.length - 1);
            widget.controller.text += makeHan().toString();
          });
        } else {
          setState(() {
            widget.controller.text += hanGle.toString();
            clear();
            hangleState = 0;
          });
        }
        //종성이 들어왔을 경우
      } else if(jons.contains(hanGle.codeUnitAt(0))){
        setState(() {
          jon = hanGle.codeUnitAt(0).toString();
          widget.controller.text = widget.controller.text.substring(0, widget.controller.text.length - 1);
          widget.controller.text += makeHan();
          // inputConnection.setComposingText(makeHan().toString(), 1);
          hangleState = 3;
        });
        // 초성이 들어왔을때
      } else{
        setState(() {
          directlyCommit();
          cho = hanGle.codeUnitAt(0).toString();
          hangleState = 1;
          widget.controller.text = widget.controller.text.substring(0, widget.controller.text.length - 1);
          widget.controller.text += makeHan();
        });
      }
    } else {
      // 종성 일때
      if(jons.contains(hanGle.codeUnitAt(0))){
        if(doubleJonEnable(hanGle)){
          setState(() {
            widget.controller.text = widget.controller.text.substring(0, widget.controller.text.length - 1);
            widget.controller.text += makeHan().toString();
          });
        } else {
          setState(() {
            widget.controller.text = widget.controller.text.substring(0, widget.controller.text.length - 1);
            widget.controller.text += makeHan().toString();
            clear();
            hangleState = 1;
            cho = hanGle.codeUnitAt(0).toString();
            widget.controller.text += makeHan().toString();
          });
        }
        //3번째가 초성일때
      } else if(chos.contains(hanGle.codeUnitAt(0))){
        widget.controller.text += makeHan().toString();
        hangleState = 1;
        clear();
        cho = hanGle.codeUnitAt(0).toString();
        widget.controller.text += makeHan().toString();

        // 중성일때
      } else {
        String temp = '0x0000';
        if(doubleJonFlag == '0x0000'){
          setState(() {
            temp = jon;
            jon = '0x0000';
            widget.controller.text = widget.controller.text.substring(0, widget.controller.text.length - 1);
            widget.controller.text += makeHan().toString();
          });
        } else {
          setState(() {
            temp = doubleJonFlag;
            jon = jonFlag;
            widget.controller.text += makeHan().toString();
          });
        }
        setState(() {
          hangleState = 2;
          clear();
          cho = temp;
          jun = hanGle.codeUnitAt(0).toString();
          widget.controller.text += makeHan().toString();
        });
      }
    }
  }

  void directlyCommit(){
    if(hangleState == 0){
      return;
    }
    setState(() {
      widget.controller.text += makeHan().toString();
      hangleState = 0;
      clear();
    });

  }

  void delete(){
    setState(() {
      widget.controller.text = widget.controller.text.substring(0, widget.controller.text.length - 1);
      clear();
      hangleState = 0;
    });
  }


  bool doubleJunEnable(String newJun) {
    if(String.fromCharCode(int.parse(jun)) == 'ㅗ'){
      if(newJun == 'ㅏ'){
        junFlag = jun;
        jun = 'ㅘ'.codeUnitAt(0).toString();
        return true;
      } else if(newJun == 'ㅐ'){
        junFlag = jun;
        jun = 'ㅙ'.codeUnitAt(0).toString();
        return true;
      } else if(newJun == 'ㅣ'){
        junFlag = jun;
        jun = 'ㅚ'.codeUnitAt(0).toString();
        return true;
      } else {
        return false;
      }
    } else if(String.fromCharCode(int.parse(jun)) == 'ㅜ'){
      if(newJun == 'ㅓ'){
        junFlag = jun;
        jun = 'ㅝ'.codeUnitAt(0).toString();
        return true;
      }
      if(newJun == 'ㅔ'){
        junFlag = jun;
        jun = 'ㅞ'.codeUnitAt(0).toString();
        return true;
      }
      if(newJun == 'ㅣ'){
        junFlag = jun;
        jun = 'ㅟ'.codeUnitAt(0).toString();
        return true;
      } else {
        return false;
      }
    } else if(String.fromCharCode(int.parse(jun)) == 'ㅡ'){
      if(newJun == 'ㅣ'){
        junFlag = jun;
        jun = 'ㅢ'.codeUnitAt(0).toString();
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  bool doubleJonEnable(String newJon){
    jonFlag = jon;
    doubleJonFlag = newJon.codeUnitAt(0).toString();
    if(String.fromCharCode(int.parse(jon)) == 'ㄱ'){
      if(String.fromCharCode(int.parse(doubleJonFlag)) == 'ㅅ'){
        jon = 'ㄳ'.codeUnitAt(0).toString();
        return true;
      } else {
        return false;
      }
    } else if(String.fromCharCode(int.parse(jon)) == 'ㄴ'){
      if(String.fromCharCode(int.parse(doubleJonFlag)) == 'ㅈ'){
        jon = 'ㄵ'.codeUnitAt(0).toString();
        return true;
      } else if(String.fromCharCode(int.parse(doubleJonFlag)) == 'ㅎ'){
        jon = 'ㄶ'.codeUnitAt(0).toString();
        return true;
      } else {
        return false;
      }
    } else if(String.fromCharCode(int.parse(jon)) == 'ㄹ'){
      if(String.fromCharCode(int.parse(doubleJonFlag)) == 'ㄱ'){
        jon = 'ㄺ'.codeUnitAt(0).toString();
        return true;
      } else if(String.fromCharCode(int.parse(doubleJonFlag)) == 'ㅁ'){
        jon = 'ㄻ'.codeUnitAt(0).toString();
        return true;
      } else if(String.fromCharCode(int.parse(doubleJonFlag)) == 'ㅂ'){
        jon = 'ㄼ'.codeUnitAt(0).toString();
        return true;
      } else if(String.fromCharCode(int.parse(doubleJonFlag)) == 'ㅅ'){
        jon = 'ㄽ'.codeUnitAt(0).toString();
        return true;
      } else if(String.fromCharCode(int.parse(doubleJonFlag)) == 'ㅌ'){
        jon = 'ㄾ'.codeUnitAt(0).toString();
        return true;
      } else if(String.fromCharCode(int.parse(doubleJonFlag)) == 'ㅍ'){
        jon = 'ㄿ'.codeUnitAt(0).toString();
        return true;
      } else if(String.fromCharCode(int.parse(doubleJonFlag)) == 'ㅎ'){
        jon = 'ㅀ'.codeUnitAt(0).toString();
        return true;
      } else {
        return false;
      }
    } else if(String.fromCharCode(int.parse(jon)) == 'ㅂ'){
      if(String.fromCharCode(int.parse(doubleJonFlag)) == 'ㅅ'){
        jon = 'ㅄ'.codeUnitAt(0).toString();
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
  bool junAvailable(){
    if(jun == 'ㅙ'.codeUnitAt(0).toString() || jun == 'ㅞ'.codeUnitAt(0).toString() || jun == 'ㅢ'.codeUnitAt(0).toString()
        || jun == 'ㅐ'.codeUnitAt(0).toString() || jun == 'ㅔ'.codeUnitAt(0).toString() || jun == 'ㅛ'.codeUnitAt(0).toString()
        || jun == 'ㅒ'.codeUnitAt(0).toString() || jun == 'ㅖ'.codeUnitAt(0).toString()){
      return false;
    }
    return true;
  }

  bool isDoubleJun(){
    if(jun == 'ㅙ'.codeUnitAt(0).toString() || jun == 'ㅞ'.codeUnitAt(0).toString() || jun == 'ㅚ'.codeUnitAt(0).toString()
        || jun == 'ㅝ'.codeUnitAt(0).toString() || jun == 'ㅟ'.codeUnitAt(0).toString() || jun == 'ㅘ'.codeUnitAt(0).toString()
        || jun == 'ㅢ'.codeUnitAt(0).toString()){
      return true;
    }
    return false;
  }


}
