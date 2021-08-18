import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String subText;
  final bool obscureText;
  final fontSize;
  const CommonTextField(
      {Key key, this.controller, this.label, this.subText, this.obscureText, this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 0, 12),
          child: Text(
            label ?? '',
            style: TextStyle(color: HexColor('#303E72')),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: HexColor('#A9A9A9').withOpacity(0.29),
                offset: Offset(3, 4),
                blurRadius: 12,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: fontSize ?? 14,
                ),
                obscureText: obscureText ?? false,
                controller: controller,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 12, 0, 0),
          child: Text(
            subText ?? '',
            style: TextStyle(
              color: HexColor('#303E72').withOpacity(0.5),
              fontSize: 8,
            ),
          ),
        ),
      ],
    );
  }
}
