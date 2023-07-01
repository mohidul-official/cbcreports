import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../api_connection/api_connection.dart';
import 'package:http/http.dart' as http;

import 'building_inspection_cracking_building_members_fragments_screen.dart';

class BuildingInspectionTheSubFloorFragments extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  BuildingInspectionTheSubFloorFragments({Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildingInspectionTheSubFloorFragments> createState() =>
      _BuildingInspectionTheSubFloorFragmentsState();
}

class _BuildingInspectionTheSubFloorFragmentsState
    extends State<BuildingInspectionTheSubFloorFragments> {
  var structurehavesubfloor = "NA";

  var subfloortimbers = "NA";

  var subfloorsystem = "NA";

  var subfloorsupports = "NA";

  var subfloorshielding = "NA";
  var subfloorshieldingvalue = "NA";

  var subfloorventilation = "NA";

  var subfloorother = "NA";

  var subfloortimbersimagePath = "NA";
  var subfloortimbersimageName = "NA";
  var subfloortimbersimageData = "NA";

  var subfloorsystemimagePath = "NA";
  var subfloorsystemimageName = "NA";
  var subfloorsystemimageData = "NA";

  var subfloorsupportsimagePath = "NA";
  var subfloorsupportsimageName = "NA";
  var subfloorsupportsimageData = "NA";

  var subfloorshieldingimagePath = "NA";
  var subfloorshieldingimageName = "NA";
  var subfloorshieldingimageData = "NA";

  var subfloorventilationimagePath = "NA";
  var subfloorventilationimageName = "NA";
  var subfloorventilationimageData = "NA";

  var subfloorotherimagePath = "NA";
  var subfloorotherimageName = "NA";
  var subfloorotherimageData = "NA";

  ImagePicker imagePicker = ImagePicker();

  Future<void> subfloortimbersgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File subfloortimbersimagePath = File(getimage.path);

        subfloortimbersimageName = getimage.path.split('/').last;
        subfloortimbersimageData =
            base64Encode(subfloortimbersimagePath.readAsBytesSync());

        print(subfloortimbersimagePath);
        print(subfloortimbersimageName);
        print(subfloortimbersimageData);
      }
    });
  }

  Future<void> subfloortimberscaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File subfloortimbersimagePath = File(getimage.path);

        subfloortimbersimageName = getimage.path.split('/').last;
        subfloortimbersimageData =
            base64Encode(subfloortimbersimagePath.readAsBytesSync());

        print(subfloortimbersimagePath);
        print(subfloortimbersimageName);
        print(subfloortimbersimageData);
      }
    });
  }

  Future<void> subfloorsystemgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File subfloorsystemimagePath = File(getimage.path);

        subfloorsystemimageName = getimage.path.split('/').last;
        subfloorsystemimageData =
            base64Encode(subfloorsystemimagePath.readAsBytesSync());

        print(subfloorsystemimagePath);
        print(subfloorsystemimageName);
        print(subfloorsystemimageData);
      }
    });
  }

  Future<void> subfloorsystemcaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File subfloorsystemimagePath = File(getimage.path);

        subfloorsystemimageName = getimage.path.split('/').last;
        subfloorsystemimageData =
            base64Encode(subfloorsystemimagePath.readAsBytesSync());

        print(subfloorsystemimagePath);
        print(subfloorsystemimageName);
        print(subfloorsystemimageData);
      }
    });
  }

  Future<void> subfloorsupportsgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File subfloorsupportsimagePath = File(getimage.path);

        subfloorsupportsimageName = getimage.path.split('/').last;
        subfloorsupportsimageData =
            base64Encode(subfloorsupportsimagePath.readAsBytesSync());

        print(subfloorsupportsimagePath);
        print(subfloorsupportsimageName);
        print(subfloorsupportsimageData);
      }
    });
  }

  Future<void> subfloorsupportscaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File subfloorsupportsimagePath = File(getimage.path);

        subfloorsupportsimageName = getimage.path.split('/').last;
        subfloorsupportsimageData =
            base64Encode(subfloorsupportsimagePath.readAsBytesSync());

        print(subfloorsupportsimagePath);
        print(subfloorsupportsimageName);
        print(subfloorsupportsimageData);
      }
    });
  }

  Future<void> subfloorshieldinggetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File subfloorshieldingimagePath = File(getimage.path);

        subfloorshieldingimageName = getimage.path.split('/').last;
        subfloorshieldingimageData =
            base64Encode(subfloorshieldingimagePath.readAsBytesSync());

        print(subfloorshieldingimagePath);
        print(subfloorshieldingimageName);
        print(subfloorshieldingimageData);
      }
    });
  }

  Future<void> subfloorshieldingcaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File subfloorshieldingimagePath = File(getimage.path);

        subfloorshieldingimageName = getimage.path.split('/').last;
        subfloorshieldingimageData =
            base64Encode(subfloorshieldingimagePath.readAsBytesSync());

        print(subfloorshieldingimagePath);
        print(subfloorshieldingimageName);
        print(subfloorshieldingimageData);
      }
    });
  }

  Future<void> subfloorventilationgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File subfloorventilationimagePath = File(getimage.path);

        subfloorventilationimageName = getimage.path.split('/').last;
        subfloorventilationimageData =
            base64Encode(subfloorventilationimagePath.readAsBytesSync());

        print(subfloorventilationimagePath);
        print(subfloorventilationimageName);
        print(subfloorventilationimageData);
      }
    });
  }

  Future<void> subfloorventilationcaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File subfloorventilationimagePath = File(getimage.path);

        subfloorventilationimageName = getimage.path.split('/').last;
        subfloorventilationimageData =
            base64Encode(subfloorventilationimagePath.readAsBytesSync());

        print(subfloorventilationimagePath);
        print(subfloorventilationimageName);
        print(subfloorventilationimageData);
      }
    });
  }

  Future<void> subfloorothergetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File subfloorotherimagePath = File(getimage.path);

        subfloorotherimageName = getimage.path.split('/').last;
        subfloorotherimageData =
            base64Encode(subfloorotherimagePath.readAsBytesSync());

        print(subfloorotherimagePath);
        print(subfloorotherimageName);
        print(subfloorotherimageData);
      }
    });
  }

  Future<void> subfloorothercaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File subfloorotherimagePath = File(getimage.path);

        subfloorotherimageName = getimage.path.split('/').last;
        subfloorotherimageData =
            base64Encode(subfloorotherimagePath.readAsBytesSync());

        print(subfloorotherimagePath);
        print(subfloorotherimageName);
        print(subfloorotherimageData);
      }
    });
  }

  subfloorshieldingCheck() {
    if (subfloorshielding == "Defects/Safety Hazards found were") {
      setState(() {
        subfloorshieldingvalue =
            "Ant caps were missing. It is recommended to contact a certified timber pest contonter.";
      });

      return Text(
          'Ant caps were missing. It is recommended to contact a certified timber pest contonter.');
    } else {
      setState(() {
        subfloorshieldingvalue = " ";
      });
    }
  }

  structurehavesubfloorCheck() {
    if (structurehavesubfloor == "Yes") {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              '7.1	Description of the Defects/Safety Hazard, Location and the Inspector’s Recommendations',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          //Floor Framing Timbers

          Container(
            margin: EdgeInsets.all(10),
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Floor Framing Timbers'),
              ),
              value: subfloortimbers,
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
              onChanged: (subfloortimbers) {
                setState(() {
                  this.subfloortimbers = subfloortimbers!;
                  //print(personsinattendance);
                });
              },
            ),
          ),

          Container(
            margin: EdgeInsets.all(10),
            child: subfloortimbersimageData != "NA"
                ? Image.memory(base64Decode(subfloortimbersimageData))
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
                        subfloortimberscaptureImage();
                      },
                      child: Text('Capture Image')),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                      onPressed: () {
                        subfloortimbersgetImage();
                      },
                      child: Text('Choose Image')),
                ),
              ],
            ),
          ),

          //Underside of the Flooring System:

          Container(
            margin: EdgeInsets.all(10),
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Underside of the Flooring System:'),
              ),
              value: subfloorsystem,
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
              onChanged: (subfloorsystem) {
                setState(() {
                  this.subfloorsystem = subfloorsystem!;
                  //print(personsinattendance);
                });
              },
            ),
          ),

          Container(
            margin: EdgeInsets.all(10),
            child: subfloorsystemimageData != "NA"
                ? Image.memory(base64Decode(subfloorsystemimageData))
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
                        subfloorsystemcaptureImage();
                      },
                      child: Text('Capture Image')),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                      onPressed: () {
                        subfloorsystemgetImage();
                      },
                      child: Text('Choose Image')),
                ),
              ],
            ),
          ),

          //Piers/Posts/Supports

          Container(
            margin: EdgeInsets.all(10),
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Piers/Posts/Supports'),
              ),
              value: subfloorsupports,
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
              onChanged: (subfloorsupports) {
                setState(() {
                  this.subfloorsupports = subfloorsupports!;
                  //print(personsinattendance);
                });
              },
            ),
          ),

          Container(
            margin: EdgeInsets.all(10),
            child: subfloorsupportsimageData != "NA"
                ? Image.memory(base64Decode(subfloorsupportsimageData))
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
                        subfloorsupportscaptureImage();
                      },
                      child: Text('Capture Image')),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                      onPressed: () {
                        subfloorsupportsgetImage();
                      },
                      child: Text('Choose Image')),
                ),
              ],
            ),
          ),

          //Termite Shielding

          Container(
            margin: EdgeInsets.all(10),
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Termite Shielding'),
              ),
              value: subfloorshielding,
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
              onChanged: (subfloorshielding) {
                setState(() {
                  this.subfloorshielding = subfloorshielding!;
                  //print(personsinattendance);
                });
              },
            ),
          ),

          //The limitations were:
          Container(
            margin: EdgeInsets.all(10),
            child: subfloorshieldingCheck(),
          ),

          Container(
            margin: EdgeInsets.all(10),
            child: subfloorshieldingimageData != "NA"
                ? Image.memory(base64Decode(subfloorshieldingimageData))
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
                        subfloorshieldingcaptureImage();
                      },
                      child: Text('Capture Image')),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                      onPressed: () {
                        subfloorshieldinggetImage();
                      },
                      child: Text('Choose Image')),
                ),
              ],
            ),
          ),

          //Sub-floor ventilation

          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              'Sub-floor ventilation',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.all(10),
            child: Text(
                'Ventilation is important in minimising infestations by timber pests and helps prevent damp problems. The Inspector considers that the ventilation in this property is: '),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: DropdownButtonFormField(
              isExpanded: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                //label: Text('Sub-floor ventilation'),
              ),
              value: subfloorventilation,
              items: [
                DropdownMenuItem(
                  child: Text('-Select-'),
                  value: "NA",
                ),
                DropdownMenuItem(
                  child: Text('Not Applicable as slab on ground construction.'),
                  value: "Not Applicable as slab on ground construction.",
                ),
                DropdownMenuItem(
                  child: Text('Adequate because'),
                  value: "Adequate because",
                ),
                DropdownMenuItem(
                  child: Text('Inadequate because'),
                  value: "Not present",
                ),
                DropdownMenuItem(
                  child: Text('Unable to assess because'),
                  value: "Unable to assess because",
                ),
              ],
              onChanged: (subfloorventilation) {
                setState(() {
                  this.subfloorventilation = subfloorventilation!;
                  //print(personsinattendance);
                });
              },
            ),
          ),

          Container(
            margin: EdgeInsets.all(10),
            child: subfloorventilationimageData != "NA"
                ? Image.memory(base64Decode(subfloorventilationimageData))
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
                        subfloorventilationcaptureImage();
                      },
                      child: Text('Capture Image')),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                      onPressed: () {
                        subfloorventilationgetImage();
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
              value: subfloorother,
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
              onChanged: (subfloorother) {
                setState(() {
                  this.subfloorother = subfloorother!;
                  //print(personsinattendance);
                });
              },
            ),
          ),

          Container(
            margin: EdgeInsets.all(10),
            child: subfloorotherimageData != "NA"
                ? Image.memory(base64Decode(subfloorotherimageData))
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
                        subfloorothercaptureImage();
                      },
                      child: Text('Capture Image')),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                      onPressed: () {
                        subfloorothergetImage();
                      },
                      child: Text('Choose Image')),
                ),
              ],
            ),
          ),
        ],
      );
    }
  }

  Future<void> updateTheSubFloorDetails(String id) async {
    try {
      var res =
          await http.post(Uri.parse(API.prepurchasethesubfloordetails), body: {
        "id": id,
        "structurehavesubfloor": structurehavesubfloor,
        "subfloortimbers": subfloortimbers,
        //"subfloortimbers": floorFramingTimbersController.text.trim(),
        "subfloorsystem": subfloorsystem,
        //"subfloorsystem": undersideFlooringSystemController.text.trim(),
        "subfloorsupports": subfloorsupports,
        //"subfloorsupports": piersPostsSupportsController.text.trim(),
        "subfloorshielding": subfloorshielding,
        "subfloorshieldingvalue": subfloorshieldingvalue,
        //"subfloorshielding": termiteShieldingController.text.trim(),
        "subfloorventilation": subfloorventilation,
        //"subfloorventilation": subFloorVentilationController.text.trim(),
        "subfloorother": subfloorother,
        //"subfloorother": otherIfApplicableController.text.trim(),
        "subfloortimbersimagedata": subfloortimbersimageData,
        "subfloortimbersimagename": subfloortimbersimageName,
        "subfloorsystemimagedata": subfloorsystemimageData,
        "subfloorsystemimagename": subfloorsystemimageName,
        "subfloorsupportsimagedata": subfloorsupportsimageData,
        "subfloorsupportsimagename": subfloorsupportsimageName,
        "subfloorshieldingimagedata": subfloorshieldingimageData,
        "subfloorshieldingimagename": subfloorshieldingimageName,
        "subfloorventilationimagedata": subfloorventilationimageData,
        "subfloorventilationimagename": subfloorventilationimageName,
        "subfloorotherimagedata": subfloorotherimageData,
        "subfloorotherimagename": subfloorotherimageName,
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        //print("Record Inserted");

        Fluttertoast.showToast(msg: "Record Inserted");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingInspectionCrackingBuildingMemberFragments(
                    reportId: id)));
      } else {
        print("Some Issue.");
        Fluttertoast.showToast(msg: "Some Issue.");
      }
    } catch (e) {
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
                'THE SUB FLOOR',
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
            //Did the structure(s) have a subfloor(s)?

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Did the structure(s) have a subfloor(s)?'),
                ),
                value: structurehavesubfloor,
                items: [
                  DropdownMenuItem(
                    child: Text('-Select-'),
                    value: "NA",
                  ),
                  DropdownMenuItem(
                    child: Text('Yes'),
                    value: "Yes",
                  ),
                  DropdownMenuItem(
                    child: Text('No'),
                    value: "No",
                  ),
                ],
                onChanged: (structurehavesubfloor) {
                  setState(() {
                    this.structurehavesubfloor = structurehavesubfloor!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),

            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Where the answer is Yes elements in section 7.1 below were inspected:\nWhere the answer is NO the following Subfloor Description (section 7.1) is NOT Applicable.',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),

            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: structurehavesubfloorCheck(),
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
                          updateTheSubFloorDetails(widget.reportId);
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
