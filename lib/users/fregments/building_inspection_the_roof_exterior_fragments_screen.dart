import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../api_connection/api_connection.dart';
import 'package:http/http.dart' as http;

import 'building_inspection_the_roof_exterior_step_two_fragments_screen.dart';
import 'building_inspection_the_sub_floor_fragments_screen.dart';

class BuildingInspectionTheRoofExteriorFragments extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  BuildingInspectionTheRoofExteriorFragments(
      {Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildingInspectionTheRoofExteriorFragments> createState() =>
      _BuildingInspectionTheRoofExteriorFragmentsState();
}

class _BuildingInspectionTheRoofExteriorFragmentsState
    extends State<BuildingInspectionTheRoofExteriorFragments> {
  var roofexteriorflashings = "NA";
  var roofexteriorflashingsvalue = "NA";

  var roofexteriorgutters = "NA";
  var roofexteriorguttersvalue = "NA";

  var roofexteriorvalleys = "NA";

  var roofexteriorskylights = "NA";

  var roofexteriorvents = "NA";

  var roofexteriorflashingsimagePath = "NA";
  var roofexteriorflashingsimageName = "NA";
  var roofexteriorflashingsimageData = "NA";

  var roofexteriorguttersimagePath = "NA";
  var roofexteriorguttersimageName = "NA";
  var roofexteriorguttersimageData = "NA";

  var roofexteriorvalleysimagePath = "NA";
  var roofexteriorvalleysimageName = "NA";
  var roofexteriorvalleysimageData = "NA";

  var roofexteriorskylightsimagePath = "NA";
  var roofexteriorskylightsimageName = "NA";
  var roofexteriorskylightsimageData = "NA";

  ImagePicker imagePicker = ImagePicker();

  Future<void> roofexteriorflashingsgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File roofexteriorflashingsimagePath = File(getimage.path);

        roofexteriorflashingsimageName = getimage.path.split('/').last;
        roofexteriorflashingsimageData =
            base64Encode(roofexteriorflashingsimagePath.readAsBytesSync());

        print(roofexteriorflashingsimagePath);
        print(roofexteriorflashingsimageName);
        print(roofexteriorflashingsimageData);
      }
    });
  }

  Future<void> roofexteriorflashingscaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File roofexteriorflashingsimagePath = File(getimage.path);

        roofexteriorflashingsimageName = getimage.path.split('/').last;
        roofexteriorflashingsimageData =
            base64Encode(roofexteriorflashingsimagePath.readAsBytesSync());

        print(roofexteriorflashingsimagePath);
        print(roofexteriorflashingsimageName);
        print(roofexteriorflashingsimageData);
      }
    });
  }

  Future<void> roofexteriorguttersgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File roofexteriorguttersimagePath = File(getimage.path);

        roofexteriorguttersimageName = getimage.path.split('/').last;
        roofexteriorguttersimageData =
            base64Encode(roofexteriorguttersimagePath.readAsBytesSync());

        print(roofexteriorguttersimagePath);
        print(roofexteriorguttersimageName);
        print(roofexteriorguttersimageData);
      }
    });
  }

  Future<void> roofexteriorgutterscaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File roofexteriorguttersimagePath = File(getimage.path);

        roofexteriorguttersimageName = getimage.path.split('/').last;
        roofexteriorguttersimageData =
            base64Encode(roofexteriorguttersimagePath.readAsBytesSync());

        print(roofexteriorguttersimagePath);
        print(roofexteriorguttersimageName);
        print(roofexteriorguttersimageData);
      }
    });
  }

  Future<void> roofexteriorvalleysgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File roofexteriorvalleysimagePath = File(getimage.path);

        roofexteriorvalleysimageName = getimage.path.split('/').last;
        roofexteriorvalleysimageData =
            base64Encode(roofexteriorvalleysimagePath.readAsBytesSync());

        print(roofexteriorvalleysimagePath);
        print(roofexteriorvalleysimageName);
        print(roofexteriorvalleysimageData);
      }
    });
  }

  Future<void> roofexteriorvalleyscaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File roofexteriorvalleysimagePath = File(getimage.path);

        roofexteriorvalleysimageName = getimage.path.split('/').last;
        roofexteriorvalleysimageData =
            base64Encode(roofexteriorvalleysimagePath.readAsBytesSync());

        print(roofexteriorvalleysimagePath);
        print(roofexteriorvalleysimageName);
        print(roofexteriorvalleysimageData);
      }
    });
  }

  Future<void> roofexteriorskylightsgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File roofexteriorskylightsimagePath = File(getimage.path);

        roofexteriorskylightsimageName = getimage.path.split('/').last;
        roofexteriorskylightsimageData =
            base64Encode(roofexteriorskylightsimagePath.readAsBytesSync());

        print(roofexteriorskylightsimagePath);
        print(roofexteriorskylightsimageName);
        print(roofexteriorskylightsimageData);
      }
    });
  }

  Future<void> roofexteriorskylightscaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File roofexteriorskylightsimagePath = File(getimage.path);

        roofexteriorskylightsimageName = getimage.path.split('/').last;
        roofexteriorskylightsimageData =
            base64Encode(roofexteriorskylightsimagePath.readAsBytesSync());

        print(roofexteriorskylightsimagePath);
        print(roofexteriorskylightsimageName);
        print(roofexteriorskylightsimageData);
      }
    });
  }

  roofexteriorflashingsCheck() {
    if (roofexteriorflashings == "Partially Inspected due to") {
      return DropdownButtonFormField(
        isExpanded: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text('Partially Inspected due to'),
        ),
        value: roofexteriorflashingsvalue,
        items: [
          DropdownMenuItem(
            child: Text('-Select-'),
            value: "NA",
          ),
          DropdownMenuItem(
            child: Text('and Defects/Safety Hazards were found to'),
            value: "and Defects/Safety Hazards were found to",
          ),
          DropdownMenuItem(
            child: Text('and no Defects/Safety Hazards were found there'),
            value: "and no Defects/Safety Hazards were found there",
          ),
        ],
        onChanged: (roofexteriorflashingsvalue) {
          setState(() {
            this.roofexteriorflashingsvalue = roofexteriorflashingsvalue!;
            //print(personsinattendance);
          });
        },
      );
    }
  }

  roofexteriorguttersCheck() {
    if (roofexteriorgutters == "Partially Inspected due to") {
      return DropdownButtonFormField(
        isExpanded: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text('Partially Inspected due to'),
        ),
        value: roofexteriorguttersvalue,
        items: [
          DropdownMenuItem(
            child: Text('-Select-'),
            value: "NA",
          ),
          DropdownMenuItem(
            child: Text('and Defects/Safety Hazards were found to'),
            value: "and Defects/Safety Hazards were found to",
          ),
          DropdownMenuItem(
            child: Text('and no Defects/Safety Hazards were found there'),
            value: "and no Defects/Safety Hazards were found there",
          ),
        ],
        onChanged: (roofexteriorguttersvalue) {
          setState(() {
            this.roofexteriorguttersvalue = roofexteriorguttersvalue!;
            //print(personsinattendance);
          });
        },
      );
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
          .post(Uri.parse(API.prepurchasetheroofexteriordetails), body: {
        "id": id,
        "roofexteriorflashings": roofexteriorflashings,
        "roofexteriorflashingsvalue": roofexteriorflashingsvalue,
        "roofexteriorgutters": roofexteriorgutters,
        "roofexteriorguttersvalue": roofexteriorguttersvalue,
        "roofexteriorvalleys": roofexteriorvalleys,
        "roofexteriorskylights": roofexteriorskylights,
        "roofexteriorvents": roofexteriorvents,
        "roofexteriorflashingsimagedata": roofexteriorflashingsimageData,
        "roofexteriorflashingsimagename": roofexteriorflashingsimageName,
        "roofexteriorguttersimagedata": roofexteriorguttersimageData,
        "roofexteriorguttersimagename": roofexteriorguttersimageName,
        "roofexteriorvalleysimagedata": roofexteriorvalleysimageData,
        "roofexteriorvalleysimagename": roofexteriorvalleysimageName,
        "roofexteriorskylightsimagedata": roofexteriorskylightsimageData,
        "roofexteriorskylightsimagename": roofexteriorskylightsimageName,
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        Navigator.of(context).pop();
        //print("Record Inserted");

        Fluttertoast.showToast(msg: "Record Inserted");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingInspectionTheRoofExteriorStepTwoFragments(
                    reportId: id)));
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
                'THE ROOF EXTERIOR (STEP 1)',
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
            //Roof Flashings

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Roof Flashings'),
                ),
                value: roofexteriorflashings,
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
                    child: Text('Partially Inspected due to'),
                    value: "Partially Inspected due to",
                  ),
                  DropdownMenuItem(
                    child: Text('Part of common area'),
                    value: "Part of common area",
                  ),
                ],
                onChanged: (roofexteriorflashings) {
                  setState(() {
                    this.roofexteriorflashings = roofexteriorflashings!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: roofexteriorflashingsCheck(),
            ),

            Container(
              margin: EdgeInsets.all(10),
              child: roofexteriorflashingsimageData != "NA"
                  ? Image.memory(base64Decode(roofexteriorflashingsimageData))
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
                          roofexteriorflashingscaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          roofexteriorflashingsgetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),

            //Gutters/Downpipes:

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Gutters/Downpipes'),
                ),
                value: roofexteriorgutters,
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
                    child: Text('Partially Inspected due to'),
                    value: "Partially Inspected due to",
                  ),
                  DropdownMenuItem(
                    child: Text('Part of common area'),
                    value: "Part of common area",
                  ),
                ],
                onChanged: (roofexteriorgutters) {
                  setState(() {
                    this.roofexteriorgutters = roofexteriorgutters!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: roofexteriorguttersCheck(),
            ),

            Container(
              margin: EdgeInsets.all(10),
              child: roofexteriorguttersimageData != "NA"
                  ? Image.memory(base64Decode(roofexteriorguttersimageData))
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
                          roofexteriorgutterscaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          roofexteriorguttersgetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),

            //Valleys

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Valleys'),
                ),
                value: roofexteriorvalleys,
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
                onChanged: (roofexteriorvalleys) {
                  setState(() {
                    this.roofexteriorvalleys = roofexteriorvalleys!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),

            Container(
              margin: EdgeInsets.all(10),
              child: roofexteriorvalleysimageData != "NA"
                  ? Image.memory(base64Decode(roofexteriorvalleysimageData))
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
                          roofexteriorvalleyscaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          roofexteriorvalleysgetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),

            //Skylights

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Skylights'),
                ),
                value: roofexteriorskylights,
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
                onChanged: (roofexteriorskylights) {
                  setState(() {
                    this.roofexteriorskylights = roofexteriorskylights!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),

            Container(
              margin: EdgeInsets.all(10),
              child: roofexteriorskylightsimageData != "NA"
                  ? Image.memory(base64Decode(roofexteriorskylightsimageData))
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
                          roofexteriorskylightscaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          roofexteriorskylightsgetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),

            //Vents

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Vents'),
                ),
                value: roofexteriorvents,
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
                onChanged: (roofexteriorvents) {
                  setState(() {
                    this.roofexteriorvents = roofexteriorvents!;
                    //print(personsinattendance);
                  });
                },
              ),
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
