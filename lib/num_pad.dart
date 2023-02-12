import 'package:flutter/material.dart';

class KNumPad extends StatelessWidget {
  final double buttonSize;
  final Color buttonColor;
  final Color iconColor;
  final int maxLength;
  final bool isNotPhoneNumber;
  final TextEditingController controller;
  final Function onSubmit;

  const KNumPad({
    Key? key,
    this.buttonSize = 70,
    this.buttonColor = Colors.indigo,
    this.iconColor = Colors.amber,
    this.maxLength = 12,
    this.isNotPhoneNumber = false,
    required this.onSubmit,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          // const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NumberButton(
                number: 1,
                size: buttonSize,
                color: buttonColor,
                maxLength: maxLength,
                controller: controller,
                isNotPhoneNumber: isNotPhoneNumber,
              ),
              NumberButton(
                number: 2,
                size: buttonSize,
                color: buttonColor,
                maxLength: maxLength,
                controller: controller,
                isNotPhoneNumber: isNotPhoneNumber,
              ),
              NumberButton(
                number: 3,
                size: buttonSize,
                color: buttonColor,
                maxLength: maxLength,
                controller: controller,
                isNotPhoneNumber: isNotPhoneNumber,
              ),
            ],
          ),
          // const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NumberButton(
                number: 4,
                size: buttonSize,
                color: buttonColor,
                maxLength: maxLength,
                controller: controller,
                isNotPhoneNumber: isNotPhoneNumber,
              ),
              NumberButton(
                number: 5,
                size: buttonSize,
                color: buttonColor,
                maxLength: maxLength,
                controller: controller,
                isNotPhoneNumber: isNotPhoneNumber,
              ),
              NumberButton(
                number: 6,
                size: buttonSize,
                color: buttonColor,
                maxLength: maxLength,
                controller: controller,
                isNotPhoneNumber: isNotPhoneNumber,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NumberButton(
                number: 7,
                size: buttonSize,
                color: buttonColor,
                maxLength: maxLength,
                controller: controller,
                isNotPhoneNumber: isNotPhoneNumber,
              ),
              NumberButton(
                number: 8,
                size: buttonSize,
                color: buttonColor,
                maxLength: maxLength,
                controller: controller,
                isNotPhoneNumber: isNotPhoneNumber,
              ),
              NumberButton(
                number: 9,
                size: buttonSize,
                color: buttonColor,
                maxLength: maxLength,
                controller: controller,
                isNotPhoneNumber: isNotPhoneNumber,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: buttonSize,
                  height: buttonSize,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        // borderRadius: BorderRadius.circular(size / 2),
                      ),
                    ),
                    onPressed: () {
                      if(isNotPhoneNumber){
                        controller.text = controller.text
                            .substring(0, controller.text.length - 1);
                      } else {
                        controller.text = controller.text
                            .substring(0, controller.text.length - 1);
                        // length의 마지막이 '-' 일때 '-'를 없애준다
                        if(controller.text.substring(controller.text.length - 1) == '-'){
                          controller.text = controller.text
                              .substring(0, controller.text.length - 1);
                        }
                        // 000-0000-000 이 안되도록 배제
                        var oldText = controller.text.replaceAll('-', '');
                        var tmp = '';
                        if(oldText.length < 4){
                          null;
                        } else if(oldText.length < 7){
                          tmp += oldText.substring(0, 3);
                          tmp += '-';
                          tmp += oldText.substring(3, oldText.length);
                          controller.text = tmp;
                        } else if(oldText.length < 11){
                          tmp += oldText.substring(0, 3);
                          tmp += '-';
                          tmp += oldText.substring(3, 6);
                          tmp += '-';
                          tmp += oldText.substring(6, oldText.length);
                          controller.text = tmp;
                        } else {
                          tmp += oldText.substring(0, 3);
                          tmp += '-';
                          tmp += oldText.substring(3, 7);
                          tmp += '-';
                          tmp += oldText.substring(7, oldText.length);
                          controller.text = tmp;
                        }
                      }
                    },
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
              NumberButton(
                number: 0,
                size: buttonSize,
                color: buttonColor,
                maxLength: maxLength,
                controller: controller,
                isNotPhoneNumber: isNotPhoneNumber,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: buttonSize,
                  height: buttonSize,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        // borderRadius: BorderRadius.circular(size / 2),
                      ),
                    ),
                    onPressed: () => onSubmit(),
                    child: const Center(
                      child: Text(
                        '확인',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// 개별 숫자버튼, 모양 등등 수정가능
class NumberButton extends StatelessWidget {
  final int number;
  final double size;
  final Color color;
  final int maxLength;
  final bool isNotPhoneNumber;
  final TextEditingController controller;

  const NumberButton({
    Key? key,
    required this.number,
    required this.size,
    required this.color,
    required this.maxLength,
    required this.isNotPhoneNumber,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: size / 8,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {
            if(controller.text.length > maxLength){
              null;
            }else {
              if(isNotPhoneNumber){
                controller.text += number.toString();
              } else {
                controller.text += number.toString();
                // controller.text = controller.text.replaceAll(RegExp(r'/[^0-9]/g'), '');
                var oldText = controller.text.replaceAll('-', '');
                var tmp = '';
                if(oldText.length < 4){
                  null;
                } else if(oldText.length < 7){
                  tmp += oldText.substring(0, 3);
                  tmp += '-';
                  tmp += oldText.substring(3, oldText.length);
                  controller.text = tmp;
                } else if(oldText.length < 11){
                  tmp += oldText.substring(0, 3);
                  tmp += '-';
                  tmp += oldText.substring(3, 6);
                  tmp += '-';
                  tmp += oldText.substring(6, oldText.length);
                  controller.text = tmp;
                } else {
                  tmp += oldText.substring(0, 3);
                  tmp += '-';
                  tmp += oldText.substring(3, 7);
                  tmp += '-';
                  tmp += oldText.substring(7, oldText.length);
                  controller.text = tmp;
                }
              }
            }

          },
          child: Center(
            child: Text(
              number.toString(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black, fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
