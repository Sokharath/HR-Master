import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hr_master/components/button/hr_button.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.white,
              borderWidth: 10,
            ),
          ),
          const Positioned(
            top: 50,
            left: 20,
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 25,
            ),
          ),
          Positioned(
            top: 660,
            left: 120,
            child: RoundedTextButton(
              label: 'ស្គេនឃួរអកូតតាមរូបភាព',
              onPressed: () {},
              buttonColor: Colors.white,
              labelColor: Colors.blue,
              spaceStandard: 20,
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      print(scanData.code); // Handle the scanned data here
      controller.pauseCamera();
      Navigator.pop(context, scanData.code);
    });
  }
}
