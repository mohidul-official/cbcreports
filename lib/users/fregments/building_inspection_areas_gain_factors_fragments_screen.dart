import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../api_connection/api_connection.dart';
import 'building_inspection_description_identification_property_fragments_screen.dart';

class BuildingIspectionAreasGrainFactorsFragments extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  BuildingIspectionAreasGrainFactorsFragments(
      {Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildingIspectionAreasGrainFactorsFragments> createState() =>
      _BuildingIspectionAreasGrainFactorsFragmentsState();
}

class _BuildingIspectionAreasGrainFactorsFragmentsState
    extends State<BuildingIspectionAreasGrainFactorsFragments> {
  TextEditingController otherAreasInspectedController = TextEditingController();
  TextEditingController areasNotInspectedInspectedController =
      TextEditingController();
  TextEditingController areasNotFullyInspectedInspectedController =
      TextEditingController();
  TextEditingController gainedAccessController = TextEditingController();
  TextEditingController apparentDefectsController = TextEditingController();
  TextEditingController informationProvidedInspectorController =
      TextEditingController();
  TextEditingController influencingTheInspectionController =
      TextEditingController();
  var actualareasinspected = "NA";

  var limitationsyesno = "No Limitations at Time of Inspection";
  var limitationsis = "NA";
  File? imagePath;

  String? imageName;
  String? imageData;
  ImagePicker imagePicker = new ImagePicker();

  Future<void> getImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        imagePath = File(getimage.path);
        imageName = getimage.path.split('/').last;
        imageData = base64Encode(imagePath!.readAsBytesSync());
        print(imagePath);
        print(imageName);
        print(imageData);
      }
    });
  }

  Future<void> captureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        imagePath = File(getimage.path);
        imageName = getimage.path.split('/').last;
        imageData = base64Encode(imagePath!.readAsBytesSync());
        print(imagePath);
        print(imageName);
        print(imageData);
      }
    });
  }

  /*Future<void> uploadImage(String id) async {
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
  }*/
  Future<void> updateAreasGainFactorsDetails(String id) async {
    try {
      var res = await http
          .post(Uri.parse(API.prepurchaseareasgainfactorsdetails), body: {
        "id": id,
        "actualareasinspected": actualareasinspected,
        "otherareasinspected": otherAreasInspectedController.text.trim(),
        "notinspected": areasNotInspectedInspectedController.text.trim(),
        "notfullyinspected":
            areasNotFullyInspectedInspectedController.text.trim(),
        "gainaccessandreinspect": gainedAccessController.text.trim(),
        "limitationsyesno": limitationsyesno,
        "limitationsis": limitationsis,
        "possibledefects": apparentDefectsController.text.trim(),
        "informationprovidedinspector":
            informationProvidedInspectorController.text.trim(),
        "otherfactorsinfluencing":
            influencingTheInspectionController.text.trim(),
        "data": imageData,
        "name": imageName,
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        //print("Record Inserted");

        Fluttertoast.showToast(msg: "Record Inserted");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingInspetionDescriptionIdentificationPropertyFragments(
                    reportId: id)));
        /*otherAreasInspectedController.clear();
        areasNotInspectedInspectedController.clear();
        areasNotFullyInspectedInspectedController.clear();
        gainedAccessController.clear();
        apparentDefectsController.clear();
        informationProvidedInspectorController.clear();*/
      } else {
        print("Some Issue.");
        Fluttertoast.showToast(msg: "Some Issue.");
      }
    } catch (e) {
      print(e);

      Fluttertoast.showToast(msg: e.toString());
    }
  }

  conditionCheck() {
    if (limitationsyesno == "The limitations were") {
      return DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text('The limitations were:'),
        ),
        value: limitationsis,
        items: [
          DropdownMenuItem(
            child: Text('-Select-'),
            value: "NA",
          ),
          DropdownMenuItem(
            child: Text(
                'Subfloor was on slope, A thorough\n inspection of the full subfloor\n was not possible. There might\n be few structural or timber\n pest issues which went unnoticed.\n\n'),
            value:
                "Subfloor was on slope, A thorough inspection of the full subfloor was not possible. There might be few structural or timber pest issues which went unnoticed.",
          ),
          DropdownMenuItem(
            child: Text(
                'A thorough inspection was not possible\n due to obstructions from heat/cooling\n pipes. There might be few structural\n or timber pest issues which\n went unnoticed.\n\n'),
            value:
                "A thorough inspection was not possible due to obstructions from heat/cooling pipes. There might be few structural or timber pest issues which went unnoticed.",
          ),
          DropdownMenuItem(
            child: Text(
                'A thorough inspection was not\n possible due to wet conditions under\n the subfloor. There might be few\n structural or timber pest issues\n which went unnoticed.\n\n'),
            value:
                "A thorough inspection was not possible due to wet conditions under the subfloor. There might be few structural or timber pest issues which went unnoticed.",
          ),
        ],
        onChanged: (limitationsis) {
          setState(() {
            this.limitationsis = limitationsis!;
            //print(personsinattendance);
          });
        },
      );
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
                'Areas Inspected and Restrictions to the Inspection',
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
            //The Actual Areas Inspected were
            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('The Actual Areas Inspected were'),
                ),
                value: actualareasinspected,
                items: [
                  DropdownMenuItem(
                    child: Text('-Select-'),
                    value: "NA",
                  ),
                  DropdownMenuItem(
                    child: Text('The Building Interior'),
                    value: "The Building Interior",
                  ),
                  DropdownMenuItem(
                    child: Text('The Building Exterior'),
                    value: "The Building Exterior",
                  ),
                  DropdownMenuItem(
                    child: Text('The Roof Space'),
                    value: "The Roof Space",
                  ),
                  DropdownMenuItem(
                    child: Text('The Roof Exterior'),
                    value: "The Roof Exterior",
                  ),
                  DropdownMenuItem(
                    child: Text('The Subfloor'),
                    value: "The Subfloor",
                  ),
                  DropdownMenuItem(
                    child: Text('The Site'),
                    value: "The Site",
                  ),
                ],
                onChanged: (actualareasinspected) {
                  setState(() {
                    this.actualareasinspected = actualareasinspected!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),

            //Other Areas Inspected were:
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: otherAreasInspectedController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Other Areas Inspected were:'),
                ),
              ),
            ),
            //	Restrictions

            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Restrictions',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            //Areas NOT Inspected Including Reason(s) were
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: areasNotInspectedInspectedController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Areas NOT Inspected Including Reasons were'),
                ),
              ),
            ),
            //Areas NOT Fully Inspected Including Reason(s) were
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: areasNotFullyInspectedInspectedController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label:
                      Text('Areas NOT Fully Inspected Including Reasons were'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Recommendations to Gain Access and Reinspect',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            //The Area(s) and/or Section(s) to which Access should be gained or fully gained are
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: gainedAccessController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                      'The Area(s) and/or Section(s) to which Access should be gained or fully gained are'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Factors that Influenced the Inspection/Report Outcome',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Limitations to the Inspection, apart from “Access Issues” noted above, and how these limitations, have affected the Inspection and/or the preparation of the report:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
            //The Actual Areas Inspected were
            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  //label: Text(''),
                ),
                value: limitationsyesno,
                items: [
                  DropdownMenuItem(
                    child: Text('The limitations were'),
                    value: "The limitations were",
                  ),
                  DropdownMenuItem(
                    child: Text('No Limitations at Time of Inspection'),
                    value: "No Limitations at Time of Inspection",
                  ),
                ],
                onChanged: (limitationsyesno) {
                  setState(() {
                    this.limitationsyesno = limitationsyesno!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: conditionCheck(),
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
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          captureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          getImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),
            //Details of Apparent concealment of possible defects:
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: apparentDefectsController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                      'Details of Apparent concealment of possible defects'),
                ),
              ),
            ),
            //Information provided to the Inspector that has a bearing on the Inspection and/or Report and from whom and when that information was provided:
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: informationProvidedInspectorController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                      'Information provided to the Inspector that has a bearing on the Inspection and/or Report and from whom and when that information was provided:'),
                ),
              ),
            ),
            //Details of Other Factors influencing the inspection:
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: influencingTheInspectionController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                      'Details of Other Factors influencing the inspection: '),
                ),
              ),
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
                          updateAreasGainFactorsDetails(widget.reportId);
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
