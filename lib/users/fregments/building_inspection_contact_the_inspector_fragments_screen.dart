import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import '../../api_connection/api_connection.dart';
import 'building_inspection_pdf_create_fragments_screen.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'dart:ui' as ui;

import 'building_inspection_signature_upload_fragments_screen.dart';
import 'building_inspection_upload_signature_fragments_screen.dart';

class BuildingInspectionContactTheIspectorFragments extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  BuildingInspectionContactTheIspectorFragments(
      {Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildingInspectionContactTheIspectorFragments> createState() =>
      _BuildingInspectionContactTheIspectorFragmentsState();
}

class _BuildingInspectionContactTheIspectorFragmentsState
    extends State<BuildingInspectionContactTheIspectorFragments> {
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();
  /*TextEditingController inspectionCarriedOutByController =
      TextEditingController();
  TextEditingController inspectorAddressController = TextEditingController();
  TextEditingController inspectorLicenceController = TextEditingController();*/
  TextEditingController inspectorDatedThisController = TextEditingController();
  /*TextEditingController inspectorDayOfController = TextEditingController();
  TextEditingController inspectorBehalfOfController = TextEditingController();
  TextEditingController inspectorSignatureController = TextEditingController();*/

  var incidenceofmajordefects = "NA";

  var incidenceofminordefects = "NA";

  var theoverallcondition = "NA";
  /*var b64image = "NA";
  var b64imagename = "NA";*/
  //var date = "NA";

  Future<void> updateincidenceofmajordefectsDetails(String id) async {
    //saveSignatureImage();
    try {
      var res = await http
          .post(Uri.parse(API.prepurchasecontacttheinspectordetails), body: {
        "id": id,
        "incidenceofmajordefects": incidenceofmajordefects,
        "incidenceofminordefects": incidenceofminordefects,
        "theoverallcondition": theoverallcondition,
        //"inspectorcarriedout": inspectionCarriedOutByController.text.trim(),
        //"inspectoraddress": inspectorAddressController.text.trim(),
        //"inspectorlicence": inspectorLicenceController.text.trim(),
        "inspectordatedthis": inspectorDatedThisController.text.trim(),
        /*"b64image": b64image,
        "b64imagename": b64imagename,*/

        //"inspectordayof": inspectorDayOfController.text.trim(),
        //"inspectorbehalfof": inspectorBehalfOfController.text.trim(),
        //"inspectorsignature": inspectorSignatureController.text.trim(),
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        //print("Record Inserted");
        //saveSignatureImage();

        Fluttertoast.showToast(msg: "Record Inserted");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingInspectionSignatureUploadFragments(reportId: id)));
      } else {
        print("Some Issue.");
        Fluttertoast.showToast(msg: "Some Issue.");
      }
    } catch (e) {
      print(e);

      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future<void> updateincidenceofmajordefectsuploadDetails(String id) async {
    //saveSignatureImage();
    try {
      var res = await http
          .post(Uri.parse(API.prepurchasecontacttheinspectordetails), body: {
        "id": id,
        "incidenceofmajordefects": incidenceofmajordefects,
        "incidenceofminordefects": incidenceofminordefects,
        "theoverallcondition": theoverallcondition,
        //"inspectorcarriedout": inspectionCarriedOutByController.text.trim(),
        //"inspectoraddress": inspectorAddressController.text.trim(),
        //"inspectorlicence": inspectorLicenceController.text.trim(),
        "inspectordatedthis": inspectorDatedThisController.text.trim(),
        /*"b64image": b64image,
        "b64imagename": b64imagename,*/

        //"inspectordayof": inspectorDayOfController.text.trim(),
        //"inspectorbehalfof": inspectorBehalfOfController.text.trim(),
        //"inspectorsignature": inspectorSignatureController.text.trim(),
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        //print("Record Inserted");
        //saveSignatureImage();

        Fluttertoast.showToast(msg: "Record Inserted");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingInspectionUploadSignatureFragments(reportId: id)));
      } else {
        print("Some Issue.");
        Fluttertoast.showToast(msg: "Some Issue.");
      }
    } catch (e) {
      print(e);

      Fluttertoast.showToast(msg: e.toString());
    }
  }

  /*Future<void> saveSignatureImage(String id) async {
    RenderSignaturePad boundary = signatureGlobalKey.currentContext
        ?.findRenderObject() as RenderSignaturePad;
    ui.Image image = await boundary.toImage();

    //var imageData = await base64Encode(image.toByteData());
    ByteData? byteData = await (image.toByteData(format: ui.ImageByteFormat.png)
        as FutureOr<ByteData?>);
    if (byteData != null) {
      //print(byteData.buffer.asByteData());
      final time = DateTime.now().microsecond;
      final name = "signature_$time.png";
      final result = await ImageGallerySaver.saveImage(
          byteData.buffer.asUint8List(),
          quality: 100,
          name: name);
      print(result['filePath']);

      Fluttertoast.showToast(msg: result.toString());
      final isSuccess = result['isSuccess'];
      signatureGlobalKey.currentState?.clear();

      b64image = base64.encode(byteData.buffer.asUint8List());
      b64imagename = name;
      updateincidenceofmajordefectsDetails(id);

      print(b64image);
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pre Purchase Reports'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Conclusion and Summary',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            //Report id

            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Report Id:${widget.reportId}',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),

            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'The incidence of Major Defects in this Residential Building as compared with similar Buildings is considered:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  //label: Text('Is there cracking to the Building Members: '),
                ),
                value: incidenceofmajordefects,
                items: [
                  DropdownMenuItem(
                    child: Text('-Select-'),
                    value: "NA",
                  ),
                  DropdownMenuItem(
                    child: Text('High'),
                    value: "High",
                  ),
                  DropdownMenuItem(
                    child: Text('Typical'),
                    value: "Typical",
                  ),
                  DropdownMenuItem(
                    child: Text('Low'),
                    value: "Low",
                  ),
                ],
                onChanged: (incidenceofmajordefects) {
                  setState(() {
                    this.incidenceofmajordefects = incidenceofmajordefects!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),

            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'The incidence of Minor Defects in this Residential Building as compared with similar Buildings is considered:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  //label: Text('Is there cracking to the Building Members: '),
                ),
                value: incidenceofminordefects,
                items: [
                  DropdownMenuItem(
                    child: Text('-Select-'),
                    value: "NA",
                  ),
                  DropdownMenuItem(
                    child: Text('High'),
                    value: "High",
                  ),
                  DropdownMenuItem(
                    child: Text('Typical'),
                    value: "Typical",
                  ),
                  DropdownMenuItem(
                    child: Text('Low'),
                    value: "Low",
                  ),
                ],
                onChanged: (incidenceofminordefects) {
                  setState(() {
                    this.incidenceofminordefects = incidenceofminordefects!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),

            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'The overall condition of this Residential Dwelling in the context of its age, type and general expectations of similar properties is:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  //label: Text('Is there cracking to the Building Members: '),
                ),
                value: theoverallcondition,
                items: [
                  DropdownMenuItem(
                    child: Text('-Select-'),
                    value: "NA",
                  ),
                  DropdownMenuItem(
                    child: Text('Above Average'),
                    value: "Above Average",
                  ),
                  DropdownMenuItem(
                    child: Text('Average'),
                    value: "Average",
                  ),
                  DropdownMenuItem(
                    child: Text('Below Average'),
                    value: "Below Average",
                  ),
                ],
                onChanged: (theoverallcondition) {
                  setState(() {
                    this.theoverallcondition = theoverallcondition!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),

            //CONTACT THE INSPECTOR
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'CONTACT THE INSPECTOR ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            //The Inspection and Report was carried out by

            /* Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: inspectionCarriedOutByController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('The Inspection and Report was carried out by'),
                ),
              ),
            ),
            //Address
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: inspectorAddressController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Address'),
                ),
              ),
            ),
            //Licence
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: inspectorLicenceController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Licence'),
                ),
              ),
            ),*/
            //Dated this
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: inspectorDatedThisController,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Dated this'),
                ),
                onTap: () async {
                  DateTime? date = DateTime(1900);
                  FocusScope.of(context).requestFocus(new FocusNode());
                  date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now());

                  var beforeFormattedDate = DateTime.parse(date.toString());
                  var afterFormattedDate =
                      "${beforeFormattedDate.day}-${beforeFormattedDate.month}-${beforeFormattedDate.year}";
                  inspectorDatedThisController.text = afterFormattedDate;
                },
              ),
            ),
            //Day of
            /*Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: inspectorDayOfController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Day of'),
                ),
              ),
            ),
            //SIGNED FOR AND ON BEHALF OF:
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: inspectorBehalfOfController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('SIGNED FOR AND ON BEHALF OF'),
                ),
              ),
            ),
            //Signature
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: inspectorSignatureController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Signature'),
                ),
              ),
            ),*/

            //Signature
            /*Container(
              margin: EdgeInsets.all(10),
              child: SfSignaturePad(
                key: signatureGlobalKey,
                backgroundColor: Color.fromARGB(255, 187, 224, 243),
                strokeColor: Colors.black,
                minimumStrokeWidth: 3.0,
                maximumStrokeWidth: 6.0,
              ),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    signatureGlobalKey.currentState?.clear();
                  },
                  child: Text('Clear Signature')),
            ),*/
            Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child:
                        ElevatedButton(onPressed: () {}, child: Text('Back')),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () {
                          updateincidenceofmajordefectsDetails(widget.reportId);
                        },
                        child: Text('Draw Signature')),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () {
                          updateincidenceofmajordefectsuploadDetails(
                              widget.reportId);
                        },
                        child: Text('Upload Signature')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
