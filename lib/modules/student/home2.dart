
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home2 extends StatefulWidget {

  @override
  State<Home2> createState() => _HomeState();
}

class _HomeState extends State<Home2> {
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
      body: Center(
        child: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:  10.0,vertical: 40),
              child: SingleChildScrollView(child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: double.infinity,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: InkWell(
                        onTap: (){Navigator.of(context).pushNamed("pdf1s");},
                        child: Flex(
                          direction: Axis.vertical,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
                              ),
                              child: Image.asset(
                                'assets/ui/1.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              'الفرقة الاولي',
                              style: GoogleFonts.robotoCondensed(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: double.infinity,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: InkWell(
                        onTap: (){Navigator.of(context).pushNamed("pdf2s");},
                        child: Flex(
                          direction: Axis.vertical,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
                              ),
                              child: Image.asset(
                                'assets/ui/2.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              'الفرقة الثانية',
                              style: GoogleFonts.robotoCondensed(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: double.infinity,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: InkWell(
                        onTap: (){Navigator.of(context).pushNamed("pdf3s");},
                        child: Flex(
                          direction: Axis.vertical,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
                              ),
                              child: Image.asset(
                                'assets/ui/3.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              'الفرقة الثالثة',
                              style: GoogleFonts.robotoCondensed(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: double.infinity,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: InkWell(
                        onTap: (){Navigator.of(context).pushNamed("pdf4s");},
                        child: Flex(
                          direction: Axis.vertical,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
                              ),
                              child: Image.asset(
                                'assets/ui/4.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              'الفرقة الرابعة',
                              style: GoogleFonts.robotoCondensed(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),),
            )
        ),
      ),
    );
  }
}


// body: Center(
//   child: Directionality(
//     textDirection: TextDirection.rtl,
//     child: Padding(
//       padding: const EdgeInsets.symmetric(horizontal:  10.0,vertical: 40),
//       child: SingleChildScrollView(child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Container(
//               width: double.infinity,
//               height: 250,
//               decoration: BoxDecoration(
//                 color: Colors.grey[900],
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Flex(
//                 direction: Axis.vertical,
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     height: 200,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
//                     ),
//                     child: Image.asset(
//                       'assets/ui/a0.png',
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   SizedBox(height: 10,),
//                   Text(
//                     'الفرقة الاولي',
//                     style: GoogleFonts.robotoCondensed(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Container(
//               width: double.infinity,
//               height: 250,
//               decoration: BoxDecoration(
//                 color: Colors.grey[900],
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Flex(
//                 direction: Axis.vertical,
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     height: 200,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
//                     ),
//                     child: Image.asset(
//                       'assets/ui/a4.png',
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   SizedBox(height: 10,),
//                   Text(
//                     'فيزياء خاص',
//                     style: GoogleFonts.robotoCondensed(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Container(
//               width: double.infinity,
//               height: 250,
//               decoration: BoxDecoration(
//                 color: Colors.grey[900],
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Flex(
//                 direction: Axis.vertical,
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     height: 200,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
//                     ),
//                     child: Image.asset(
//                       'assets/ui/a1.png',
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   SizedBox(height: 10,),
//                   Text(
//                     'الفيزياء والكيمياء',
//                     style: GoogleFonts.robotoCondensed(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Container(
//               width: double.infinity,
//               height: 250,
//               decoration: BoxDecoration(
//                 color: Colors.grey[900],
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Flex(
//                 direction: Axis.vertical,
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     height: 200,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
//                     ),
//                     child: Image.asset(
//                       'assets/ui/a2.png',
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   SizedBox(height: 10,),
//                   Text(
//                     'رياضة والفيزياء',
//                     style: GoogleFonts.robotoCondensed(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Container(
//               width: double.infinity,
//               height: 250,
//               decoration: BoxDecoration(
//                 color: Colors.grey[900],
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Flex(
//                 direction: Axis.vertical,
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     height: 200,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
//                     ),
//                     child: Image.asset(
//                       'assets/ui/a3.png',
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   SizedBox(height: 10,),
//                   Text(
//                     'الفيزياء والحاسب',
//                     style: GoogleFonts.robotoCondensed(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),),
//     )
//   ),
// ),