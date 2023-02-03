import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../shared/components/constants.dart';


class pdfviewer extends StatefulWidget {
  @override
  _pdfviewerState createState() => _pdfviewerState();
}

class _pdfviewerState extends State<pdfviewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Lectures",
            style: TextStyle(fontSize: 23, fontStyle: FontStyle.italic),
          ),
        ),
        body: Center(
          child: SfPdfViewer.asset(
            "assets/images/DM.pdf",
          ),
        ));
  }
}
