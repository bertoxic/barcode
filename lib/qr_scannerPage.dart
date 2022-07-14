import 'dart:io';

import 'package:bar_code/qr_generatorScreen.dart';
import 'package:bar_code/qr_value.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({Key? key}) : super(key: key);

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller?.dispose();
  }
   String? barcod;
  @override
  void reassemble() async {
    // TODO: implement reassemble
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [QrViewer(context), Positioned(top: 70, child: Result())],
      ),
    ));
  }

  Widget QrViewer(BuildContext x) {
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
          borderRadius: 20,
          borderColor: Colors.blue),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((barcode) => setState(() {
          this.barcode = barcode;
           barcod = barcode.code.toString();
        }
        ));
    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => QRValue(
                barcode: barcod,
              )));
    });

  }

  Widget Result() {
    return Container(
        padding: EdgeInsets.all(10),
        color: Colors.blue,
        child:
            Text(barcode != null ? 'Result ${barcode!.code}' : 'scan please',style: TextStyle(color: Colors.grey.shade100),));
  }
}
