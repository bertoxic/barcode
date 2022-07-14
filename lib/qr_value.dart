

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QRValue extends StatelessWidget {
  String? barcode;
   QRValue({this.barcode,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      child: Center(
        child: Text(barcode! ,style:TextStyle(fontSize: 24),),
      ),
    ));
  }
}
