import 'package:flutter/material.dart';

Widget titlebutton(context, String title){
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600)
        ),
        Container(
          width: 70,
          height: 30,
          child: FlatButton(
            onPressed: (){},
            child: Text('More',style: TextStyle(color: Colors.white)),
            color: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        )
      ],
    ),
  );
}