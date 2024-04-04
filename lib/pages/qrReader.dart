import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QrReaderPage extends StatefulWidget {
  const QrReaderPage({super.key});
  @override
  State<StatefulWidget> createState() => QrReaderState();
}

class QrReaderState extends State<QrReaderPage> {
  String id = '';

  readQRcode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
        '#ffffff', 'Cancelar', false, ScanMode.QR);
    setState(() {
      id = code != '-1' ? code : '000000';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(id),
          ElevatedButton(
              onPressed: readQRcode, child: const Icon(Icons.qr_code))
        ],
      )),
    );
  }
}
