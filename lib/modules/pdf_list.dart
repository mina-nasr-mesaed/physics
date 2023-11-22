
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class pdf_list extends StatefulWidget {

  @override
  State<pdf_list> createState() => _HomeState();
}

class _HomeState extends State<pdf_list> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  List<Map<String,dynamic>> pdfData = [];

  Future<String> uploadpdf(String FileName,File file) async {
    final refrence = FirebaseStorage.instance.ref().child("pdfs/$FileName.pdf");
    final uploadTask = refrence.putFile(file);
    await uploadTask.whenComplete(() {});
    final downloadlink = await refrence.getDownloadURL();
    return downloadlink;
  }
  void pickFile() async {

    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if(pickedFile != null){
      String filename = pickedFile.files[0].name;
      File file = File(pickedFile.files[0].path!);
      final downloadlink =await uploadpdf(filename,file);

      _firebaseFirestore.collection("pdfs").add({
        "name":filename,
        "url":downloadlink,
      });
      print('pdffffffff uploaded Successfully');
    }
  }

  void getAllPdf()async{
    final results =await _firebaseFirestore.collection("pdfs").get();
    pdfData =results.docs.map((e) => e.data()).toList();
    setState(() {

    });
  }
  @override
  void initState(){
    super.initState();
    getAllPdf();
  }
  Widget build(BuildContext context) {
    return  Scaffold(
      body: GridView.builder(
          itemCount: pdfData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context,index){
            return Padding(padding: const EdgeInsets.all(8),
              child: InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => pdfViwerScreen(pdfUrl: pdfData[index]['url'],)));
                },
                child: Container(
                  decoration:  BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/logo-pdf.png',height: 120,width: 100,),
                      Text("${pdfData[index]['name']}",style: TextStyle(
                        fontSize: 18,
                      ),),
                    ],
                  ),
                ),
              ),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.upload_file),
        onPressed: pickFile,
      ),
    );
  }
}

class pdfViwerScreen extends StatefulWidget {
  final String pdfUrl;
  const pdfViwerScreen({super.key,required this.pdfUrl});

  @override
  State<pdfViwerScreen> createState() => _pdfViwerScreenState();
}

class _pdfViwerScreenState extends State<pdfViwerScreen> {
  PDFDocument? document;

  void initialisePdf() async {
    document =await PDFDocument.fromURL(widget.pdfUrl);
    setState(() {

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialisePdf();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: document !=null
          ? PDFViewer(document: document!,
      ):Center(child: CircularProgressIndicator(),
      )
    );
  }
}
