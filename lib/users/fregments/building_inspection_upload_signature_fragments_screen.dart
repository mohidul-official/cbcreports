import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../../api_connection/api_connection.dart';
import 'building_inspection_pdf_create_fragments_screen.dart';

class BuildingInspectionUploadSignatureFragments extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  BuildingInspectionUploadSignatureFragments(
      {Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildingInspectionUploadSignatureFragments> createState() =>
      _BuildingInspectionUploadSignatureFragmentsState();
}

class _BuildingInspectionUploadSignatureFragmentsState
    extends State<BuildingInspectionUploadSignatureFragments> {
  File? imagePath;
  String? imageName;
  String? imageData;
  ImagePicker imagePicker = new ImagePicker();

  Future<void> getImage() async {
    var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imagePath = File(getimage!.path);
      imageName = getimage.path.split('/').last;
      imageData = base64Encode(imagePath!.readAsBytesSync());
      print(imagePath);
      print(imageName);
      print(imageData);
    });
  }

  Future<void> uploadImage(String id) async {
    try {
      //String uri = "http://192.168.0.111/cbcreports/imageupload.php";
      var res =
          await http.post(Uri.parse(API.prepurchasesignatureupload), body: {
        "id": id,
        "data": imageData,
        "name": imageName,
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        print("uploaded");

        Fluttertoast.showToast(msg: "Record Inserted");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildInspectionPdfCreateFragments(reportId: id)));
      } else {
        print("Not Uploaded");

        Fluttertoast.showToast(msg: "Not Uploaded");
      }
    } catch (e) {
      print(e);
    }
  }

  /*Future<void> updateSignature(String id) async {
    try {
      var res =
          await http.post(Uri.parse(API.prepurchasesignatureupload), body: {
        "id": id,
        "signatureImageData": signatureImageName,
        "signatureImageName": signatureImageName,
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        //print("Record Inserted");
        //saveSignatureImage();

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
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pre Purchase Inspection"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Upload Signature',
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
              child: imagePath != null
                  ? Image.file(imagePath!)
                  : Text('Image Not Choose Yet'),
              //child: Text('Image Goes Here'),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    getImage();
                  },
                  child: Text('Choose Image')),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      uploadImage(widget.reportId);
                    });
                  },
                  child: Text('Save & Next')),
            ),
            /* Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () {
                          getSignatureImage();
                        },
                        child: Text('Chosse Image')),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            updateSignature(widget.reportId);
                          });
                        },
                        child: Text('Save & Next')),
                  ),
                ],
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
