import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiveproject/widgets/color.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {super.key,
      required this.pressFn,
      required this.buttonName,
      required this.heightBtn,
      required this.widthBtn});
  final String buttonName;
  final Function()? pressFn;
  final dynamic widthBtn;
  final dynamic heightBtn;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(defaultColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
      onPressed: pressFn,
      child: SizedBox(
        width: widthBtn,
        height: heightBtn,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonName,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
