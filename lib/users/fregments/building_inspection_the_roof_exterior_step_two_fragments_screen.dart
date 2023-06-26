import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../api_connection/api_connection.dart';
import 'package:http/http.dart' as http;

import 'building_inspection_the_sub_floor_fragments_screen.dart';

class BuildingInspectionTheRoofExteriorStepTwoFragments extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  BuildingInspectionTheRoofExteriorStepTwoFragments(
      {Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildingInspectionTheRoofExteriorStepTwoFragments> createState() =>
      _BuildingInspectionTheRoofExteriorStepTwoFragmentsState();
}

class _BuildingInspectionTheRoofExteriorStepTwoFragmentsState
    extends State<BuildingInspectionTheRoofExteriorStepTwoFragments> {
  var roofexteriorflues = "NA";

  var roofexterioreaves = "NA";
  var roofexterioreavesvalue = "NA";

  var roofexteriorbarges = "NA";
  var roofexteriorbargesvalue = "NA";

  var roofexteriorother = "NA";

  var roofexterioreavesimagePath = "NA";
  var roofexterioreavesimageName = "NA";
  var roofexterioreavesimageData = "NA";

  var roofexteriorbargesimagePath = "NA";
  var roofexteriorbargesimageName = "NA";
  var roofexteriorbargesimageData = "NA";

  var roofexteriorotherimagePath = "NA";
  var roofexteriorotherimageName = "NA";
  var roofexteriorotherimageData = "NA";

  ImagePicker imagePicker = ImagePicker();

  Future<void> roofexterioreavesgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File roofexterioreavesimagePath = File(getimage.path);

        roofexterioreavesimageName = getimage.path.split('/').last;
        roofexterioreavesimageData =
            base64Encode(roofexterioreavesimagePath.readAsBytesSync());

        print(roofexterioreavesimagePath);
        print(roofexterioreavesimageName);
        print(roofexterioreavesimageData);
      }
    });
  }

  Future<void> roofexterioreavescaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File roofexterioreavesimagePath = File(getimage.path);

        roofexterioreavesimageName = getimage.path.split('/').last;
        roofexterioreavesimageData =
            base64Encode(roofexterioreavesimagePath.readAsBytesSync());

        print(roofexterioreavesimagePath);
        print(roofexterioreavesimageName);
        print(roofexterioreavesimageData);
      }
    });
  }

  Future<void> roofexteriorbargesgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File roofexteriorbargesimagePath = File(getimage.path);

        roofexteriorbargesimageName = getimage.path.split('/').last;
        roofexteriorbargesimageData =
            base64Encode(roofexteriorbargesimagePath.readAsBytesSync());

        print(roofexteriorbargesimagePath);
        print(roofexteriorbargesimageName);
        print(roofexteriorbargesimageData);
      }
    });
  }

  Future<void> roofexteriorbargescaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File roofexteriorbargesimagePath = File(getimage.path);

        roofexteriorbargesimageName = getimage.path.split('/').last;
        roofexteriorbargesimageData =
            base64Encode(roofexteriorbargesimagePath.readAsBytesSync());

        print(roofexteriorbargesimagePath);
        print(roofexteriorbargesimageName);
        print(roofexteriorbargesimageData);
      }
    });
  }

  Future<void> roofexteriorothergetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File roofexteriorotherimagePath = File(getimage.path);

        roofexteriorotherimageName = getimage.path.split('/').last;
        roofexteriorotherimageData =
            base64Encode(roofexteriorotherimagePath.readAsBytesSync());

        print(roofexteriorotherimagePath);
        print(roofexteriorotherimageName);
        print(roofexteriorotherimageData);
      }
    });
  }

  Future<void> roofexteriorothercaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File roofexteriorotherimagePath = File(getimage.path);

        roofexteriorotherimageName = getimage.path.split('/').last;
        roofexteriorotherimageData =
            base64Encode(roofexteriorotherimagePath.readAsBytesSync());

        print(roofexteriorotherimagePath);
        print(roofexteriorotherimageName);
        print(roofexteriorotherimageData);
      }
    });
  }

  roofexterioreavesCheck() {
    if (roofexterioreaves == "Defects/Safety Hazards found were") {
      setState(() {
        roofexterioreavesvalue = "Signs of water damage can be seen.";
      });

      return Text('Signs of water damage can be seen.');
    } else {
      setState(() {
        roofexterioreavesvalue = " ";
      });
    }
  }

  roofexteriorbargesCheck() {
    if (roofexteriorbarges == "Defects/Safety Hazards found were") {
      setState(() {
        roofexteriorbargesvalue = "Signs of water damage can be seen.";
      });

      return Text('Signs of water damage can be seen.');
    } else {
      setState(() {
        roofexteriorbargesvalue = " ";
      });
    }
  }

  Future<void> updateTheRoofExteriorDetails(String id) async {
    try {
      showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        },
      );
      var res = await http
          .post(Uri.parse(API.prepurchasetheroofexteriorsteptwodetails), body: {
        "id": id,
        "roofexteriorflues": roofexteriorflues,
        "roofexterioreaves": roofexterioreaves,
        "roofexterioreavesvalue": roofexterioreavesvalue,
        "roofexteriorbarges": roofexteriorbarges,
        "roofexteriorbargesvalue": roofexteriorbargesvalue,
        "roofexteriorother": roofexteriorother,
        "roofexterioreavesimagedata": roofexterioreavesimageData,
        "roofexterioreavesimagename": roofexterioreavesimageName,
        "roofexteriorbargesimagedata": roofexteriorbargesimageData,
        "roofexteriorbargesimagename": roofexteriorbargesimageName,
        "roofexteriorotherimagedata": roofexteriorotherimageData,
        "roofexteriorotherimagename": roofexteriorotherimageName,
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        Navigator.of(context).pop();
        //print("Record Inserted");

        Fluttertoast.showToast(msg: "Record Inserted");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingInspectionTheSubFloorFragments(reportId: id)));
      } else {
        Navigator.of(context).pop();
        print("Some Issue.");
        Fluttertoast.showToast(msg: "Some Issue.");
      }
    } catch (e) {
      Navigator.of(context).pop();
      print(e);

      Fluttertoast.showToast(msg: e.toString());
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
                'THE ROOF EXTERIOR (STEP 2)',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Description of the Defects/Safety Hazards, Location and the Inspector’s Recommendations',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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

            //Flues

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Flues'),
                ),
                value: roofexteriorflues,
                items: [
                  DropdownMenuItem(
                    child: Text('-Select-'),
                    value: "NA",
                  ),
                  DropdownMenuItem(
                    child: Text('Defects/Safety Hazards found were'),
                    value: "Defects/Safety Hazards found were",
                  ),
                  DropdownMenuItem(
                    child: Text('No Defects/Safety Hazards found.'),
                    value: "No Defects/Safety Hazards found",
                  ),
                  DropdownMenuItem(
                    child: Text('Not present'),
                    value: "Not present",
                  ),
                  DropdownMenuItem(
                    child: Text('Part of common area'),
                    value: "Part of common area",
                  ),
                ],
                onChanged: (roofexteriorflues) {
                  setState(() {
                    this.roofexteriorflues = roofexteriorflues!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),

            //Eaves

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Eaves'),
                ),
                value: roofexterioreaves,
                items: [
                  DropdownMenuItem(
                    child: Text('-Select-'),
                    value: "NA",
                  ),
                  DropdownMenuItem(
                    child: Text('Defects/Safety Hazards found were'),
                    value: "Defects/Safety Hazards found were",
                  ),
                  DropdownMenuItem(
                    child: Text('No Defects/Safety Hazards found.'),
                    value: "No Defects/Safety Hazards found",
                  ),
                  DropdownMenuItem(
                    child: Text('Not present'),
                    value: "Not present",
                  ),
                  DropdownMenuItem(
                    child: Text('Part of common area'),
                    value: "Part of common area",
                  ),
                ],
                onChanged: (roofexterioreaves) {
                  setState(() {
                    this.roofexterioreaves = roofexterioreaves!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: roofexterioreavesCheck(),
            ),

            Container(
              margin: EdgeInsets.all(10),
              child: roofexterioreavesimageData != "NA"
                  ? Image.memory(base64Decode(roofexterioreavesimageData))
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
                          roofexterioreavescaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          roofexterioreavesgetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),
            //Facia and Barges:

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Facia and Barges'),
                ),
                value: roofexteriorbarges,
                items: [
                  DropdownMenuItem(
                    child: Text('-Select-'),
                    value: "NA",
                  ),
                  DropdownMenuItem(
                    child: Text('Defects/Safety Hazards found were'),
                    value: "Defects/Safety Hazards found were",
                  ),
                  DropdownMenuItem(
                    child: Text('No Defects/Safety Hazards found.'),
                    value: "No Defects/Safety Hazards found",
                  ),
                  DropdownMenuItem(
                    child: Text('Not present'),
                    value: "Not present",
                  ),
                  DropdownMenuItem(
                    child: Text('Part of common area'),
                    value: "Part of common area",
                  ),
                ],
                onChanged: (roofexteriorbarges) {
                  setState(() {
                    this.roofexteriorbarges = roofexteriorbarges!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: roofexteriorbargesCheck(),
            ),

            Container(
              margin: EdgeInsets.all(10),
              child: roofexteriorbargesimageData != "NA"
                  ? Image.memory(base64Decode(roofexteriorbargesimageData))
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
                          roofexteriorbargescaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          roofexteriorbargesgetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),

            //Other if Applicable

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Other if Applicable'),
                ),
                value: roofexteriorother,
                items: [
                  DropdownMenuItem(
                    child: Text('-Select-'),
                    value: "NA",
                  ),
                  DropdownMenuItem(
                    child: Text('Defects/Safety Hazards found were'),
                    value: "Defects/Safety Hazards found were",
                  ),
                  DropdownMenuItem(
                    child: Text('No Defects/Safety Hazards found.'),
                    value: "No Defects/Safety Hazards found",
                  ),
                  DropdownMenuItem(
                    child: Text('Not present'),
                    value: "Not present",
                  ),
                  DropdownMenuItem(
                    child: Text('Part of common area'),
                    value: "Part of common area",
                  ),
                ],
                onChanged: (roofexteriorother) {
                  setState(() {
                    this.roofexteriorother = roofexteriorother!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),

            Container(
              margin: EdgeInsets.all(10),
              child: roofexteriorotherimageData != "NA"
                  ? Image.memory(base64Decode(roofexteriorotherimageData))
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
                          roofexteriorothercaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          roofexteriorothergetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
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
                          updateTheRoofExteriorDetails(widget.reportId);
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
