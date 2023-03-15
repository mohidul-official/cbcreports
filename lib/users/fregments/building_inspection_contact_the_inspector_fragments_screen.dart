import 'dart:convert';
import 'dart:async';

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
  TextEditingController inspectionCarriedOutByController =
      TextEditingController();
  TextEditingController inspectorAddressController = TextEditingController();
  TextEditingController inspectorLicenceController = TextEditingController();
  TextEditingController inspectorDatedThisController = TextEditingController();
  TextEditingController inspectorDayOfController = TextEditingController();
  TextEditingController inspectorBehalfOfController = TextEditingController();
  TextEditingController inspectorSignatureController = TextEditingController();

  Future<void> updateCrackingBuildingMembersDetails(String id) async {
    try {
      var res = await http
          .post(Uri.parse(API.prepurchasecontacttheinspectordetails), body: {
        "id": id,
        "inspectorcarriedout": inspectionCarriedOutByController.text.trim(),
        "inspectoraddress": inspectorAddressController.text.trim(),
        "inspectorlicence": inspectorLicenceController.text.trim(),
        "inspectordatedthis": inspectorDatedThisController.text.trim(),
        "inspectordayof": inspectorDayOfController.text.trim(),
        "inspectorbehalfof": inspectorBehalfOfController.text.trim(),
        "inspectorsignature": inspectorSignatureController.text.trim(),
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        //print("Record Inserted");
        saveSignatureImage();

        Fluttertoast.showToast(msg: "Record Inserted");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildInspectionPdfCreateFragments(reportId: id)));
        /*inspectorLicenceController.clear();
        inspectorLicenceController.clear();
        inspectorDayOfController.clear();
        inspectorSignatureController.clear();
        piersCommentsController.clear();
        flooringCommentsController.clear();*/
      } else {
        print("Some Issue.");
        Fluttertoast.showToast(msg: "Some Issue.");
      }
    } catch (e) {
      print(e);

      Fluttertoast.showToast(msg: e.toString());
    }
  }

  void saveSignatureImage() async {
    RenderSignaturePad boundary = signatureGlobalKey.currentContext
        ?.findRenderObject() as RenderSignaturePad;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await (image.toByteData(format: ui.ImageByteFormat.png)
        as FutureOr<ByteData?>);
    if (byteData != null) {
      final time = DateTime.now().microsecond;
      final name = "signature_$time.png";
      final result = await ImageGallerySaver.saveImage(
          byteData.buffer.asUint8List(),
          quality: 100,
          name: name);
      print(result);
      Fluttertoast.showToast(msg: result.toString());
      final isSuccess = result['isSuccess'];
      signatureGlobalKey.currentState?.clear();
    }
  }

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
                'CONTACT THE INSPECTOR ',
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
            //The Inspection and Report was carried out by
            Container(
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
            ),
            //Dated this
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: inspectorDatedThisController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Dated this'),
                ),
              ),
            ),
            //Day of
            Container(
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
            ),
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
                          updateCrackingBuildingMembersDetails(widget.reportId);
                        },
                        child: Text('Save & Next')),
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
