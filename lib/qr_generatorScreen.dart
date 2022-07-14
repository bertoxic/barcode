
import 'package:bar_code/qr_scannerPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRPage extends StatefulWidget {
  const QRPage({Key? key}) : super(key: key);

  @override
  State<QRPage> createState() => _QRPageState();

}

class _QRPageState extends State<QRPage> {
  final TextEditingController controller =TextEditingController();
  late String home='homily';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: SingleChildScrollView(child: Column(
          children: [
            QrImage(
              data: home,
              size: 250,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 20),
              child: TextField(
                  controller:controller ,
              ),
            ),
            Container(
              child: TextButton(onPressed: (){
                setState(() {

                  home=controller.text;
                  controller.clear();

                });
              }, child: Container( padding: EdgeInsets.all(20),
                  color: Colors.blue,
                  child: Text('Generate userID',style: TextStyle(color: Colors.white),))),
            ),
            Container(
              child: TextButton(onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>QRScanner()));
              }, child: Container( padding: EdgeInsets.all(20),
                  color: Colors.blue,
                  child: Text('   QR_Scanner   ',style: TextStyle(color: Colors.white),))),
            )
          ],
        )),
      ),
    );
  }
}
