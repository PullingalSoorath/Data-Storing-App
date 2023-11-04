import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiveproject/widgets/color.dart';

class DefaultIconTextButton extends StatelessWidget {
  const DefaultIconTextButton({
    super.key,
    required this.btnName,
    required this.fnOnPress,
    required this.btnTextSize,
    this.btnHeight,
    this.btnWidth,
  });
  final dynamic btnName;
  final Function()? fnOnPress;
  final dynamic btnTextSize;
  final double? btnHeight;
  final double? btnWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: btnWidth,
          height: btnHeight,
          child: ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(defaultColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              onPressed: fnOnPress,
              icon: const Icon(Icons.camera),
              label: Text(
                btnName,
                style: TextStyle(
                    fontSize: btnTextSize, fontWeight: FontWeight.w400),
              )),
        )
      ],
    );
  }
}

class CameraBtn extends StatelessWidget {
  const CameraBtn({
    super.key,
    required this.btnName,
    required this.fnOnPress,
    required this.btnTextSize,
    this.btnHeight,
    this.btnWidth,
  });
  final dynamic btnName;
  final Function()? fnOnPress;
  final dynamic btnTextSize;
  final dynamic btnHeight;
  final dynamic btnWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: btnWidth,
          height: btnHeight,
          child: ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(defaultColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              onPressed: fnOnPress,
              icon: const Icon(Icons.camera),
              label: Text(
                btnName,
                style: TextStyle(
                    fontSize: btnTextSize, fontWeight: FontWeight.w400),
              )),
        )
      ],
    );
  }
}

class GalleryBtn extends StatelessWidget {
  const GalleryBtn({
    super.key,
    required this.btnName,
    required this.fnOnPress,
    required this.btnTextSize,
    this.btnHeight,
    this.btnWidth,
  });
  final dynamic btnName;
  final Function()? fnOnPress;
  final dynamic btnTextSize;
  final double? btnHeight;
  final double? btnWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: btnWidth,
          height: btnHeight,
          child: ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(defaultColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              onPressed: fnOnPress,
              icon: const Icon(Icons.image),
              label: Text(
                btnName,
                style: TextStyle(
                    fontSize: btnTextSize, fontWeight: FontWeight.w400),
              )),
        )
      ],
    );
  }
}
