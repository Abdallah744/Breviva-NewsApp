

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget myDivider() => Padding(
  padding: EdgeInsetsDirectional.symmetric(horizontal: 10,),
  child: Column(
    children: [
      SizedBox(height: 15,),
      Container(
        height: 2,
        color: Colors.grey[300],
      ),
      SizedBox(height: 15,),
    ],
  ),
);