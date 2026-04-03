import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/services.dart';

class ReadingBookFile extends StatefulWidget {
  final String fileName;

  ReadingBookFile({required this.fileName});

  @override
  _ReadingBookFileState createState() => _ReadingBookFileState();
}

class _ReadingBookFileState extends State<ReadingBookFile> {
  String localPath = '';

  @override
  void initState() {
    super.initState();
    loadPDF();
  }

  Future<void> loadPDF() async {
    final bytes = await rootBundle.load('assets/pdf/${widget.fileName}');
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/${widget.fileName}');

    await file.writeAsBytes(bytes.buffer.asUint8List(), flush: true);

    setState(() {
      localPath = file.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.fileName)),
      body: localPath.isEmpty
          ? Center(child: CircularProgressIndicator())
          : PDFView(filePath: localPath),
    );
  }
}