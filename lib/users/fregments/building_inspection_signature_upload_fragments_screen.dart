import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'dart:math';

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

import 'building_inspection_upload_signature_fragments_screen.dart';

class BuildingInspectionSignatureUploadFragments extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  BuildingInspectionSignatureUploadFragments(
      {Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildingInspectionSignatureUploadFragments> createState() =>
      _BuildingInspectionSignatureUploadFragmentsState();
}

class _BuildingInspectionSignatureUploadFragmentsState
    extends State<BuildingInspectionSignatureUploadFragments> {
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();

  var b64image = "NA";
  var b64imagename = "NA";
  //var date = "NA";

  Future<void> updateincidenceofmajordefectsDetails(String id) async {
    //saveSignatureImage();
    try {
      var res = await http.post(
          Uri.parse(API.prepurchasecontacttheinspectorsignaturedetails),
          body: {
            "id": id,

            "b64image": b64image,
            "b64imagename": b64imagename,

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
                BuildInspectionPdfCreateFragments(reportId: id)));
      } else {
        print("Some Issue.");
        Fluttertoast.showToast(msg: "Some Issue.");
      }
    } catch (e) {
      print(e);

      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future<void> saveSignatureImage(String id) async {
    RenderSignaturePad boundary = signatureGlobalKey.currentContext
        ?.findRenderObject() as RenderSignaturePad;
    ui.Image image = await boundary.toImage();

    //var imageData = await base64Encode(image.toByteData());
    ByteData? byteData = await (image.toByteData(format: ui.ImageByteFormat.png)
        as FutureOr<ByteData?>);
    if (byteData != null) {
      //print(byteData.buffer.asByteData());
      final time = DateTime.now().microsecond;

      Random random = new Random();
      int randomNumber = random.nextInt(4294967296);
      final name = "signature_${randomNumber}_$time.png";
      /*final result = await ImageGallerySaver.saveImage(
          byteData.buffer.asUint8List(),
          quality: 100,
          name: name);
      //print(result['filePath']);

      Fluttertoast.showToast(msg: result.toString());
      final isSuccess = result['isSuccess'];*/
      signatureGlobalKey.currentState?.clear();

      b64image = base64.encode(byteData.buffer.asUint8List());
      b64imagename = name;
      updateincidenceofmajordefectsDetails(id);

      print(b64image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pre Purchase Reports'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              'SIGNATURE',
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

          //Signature
          Container(
            margin: EdgeInsets.all(10),
            child: SfSignaturePad(
              key: signatureGlobalKey,
              backgroundColor: Color.fromARGB(255, 187, 224, 243),
              strokeColor: Colors.black,
              minimumStrokeWidth: 3.0,
              maximumStrokeWidth: 6.0,
            ),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: ElevatedButton(
                onPressed: () {
                  signatureGlobalKey.currentState?.clear();
                },
                child: Text('Clear Signature')),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Back')),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                      onPressed: () {
                        saveSignatureImage(widget.reportId);
                      },
                      child: Text('Save & Next')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
