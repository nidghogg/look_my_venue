import 'package:flutter/material.dart';

import '../ui_helper.dart';

class ButtonWidget extends StatelessWidget {
  final Color color;
  final String text;
  final Color shadow;
  final double topPadding;

  const ButtonWidget(
      {Key? key,
      required this.color,
      required this.text,
      required this.shadow,
      required this.topPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: EdgeInsets.fromLTRB(30, topPadding, 30, 0),
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: shadow,
                    blurRadius: 10.0, // has the effect of softening the shadow
                    spreadRadius: 1.0, // has the effect of extending the shadow
                    offset: const Offset(
                      0.0, // horizontal, move right 10
                      5.0, // vertical, move down 10
                    ),
                  ),
                ],
              ),
              child: RaisedButton(
                color: color,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                onPressed: () {},
                child: Text(
                  text,
                  style: const TextStyle(
                      fontSize: 20, color: UIHelper.SPOTIFY_TEXT_COLOR),
                ),
              ),
            ),
          )),
    );
  }
}
