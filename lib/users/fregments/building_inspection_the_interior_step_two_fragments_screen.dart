import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../api_connection/api_connection.dart';
import 'package:http/http.dart' as http;

import 'building_inspection_the_interior_step_three_fragments_screen.dart';
import 'building_inspection_the_roof_interior_fragments_screen.dart';

class BuildingInspectionTheInteriorStepTwoFragments extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  BuildingInspectionTheInteriorStepTwoFragments(
      {Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildingInspectionTheInteriorStepTwoFragments> createState() =>
      _BuildingInspectionTheInteriorStepTwoFragmentsState();
}

class _BuildingInspectionTheInteriorStepTwoFragmentsState
    extends State<BuildingInspectionTheInteriorStepTwoFragments> {
  TextEditingController familyRoomController = TextEditingController();

  TextEditingController studyController = TextEditingController();

  TextEditingController stairsController = TextEditingController();

  TextEditingController laundryController = TextEditingController();

  TextEditingController toiletController = TextEditingController();

  TextEditingController bathroomController = TextEditingController();

  TextEditingController enSuiteController = TextEditingController();

  TextEditingController bedroomOneController = TextEditingController();

  TextEditingController bedroomTwoController = TextEditingController();

  TextEditingController bedroomThreeController = TextEditingController();

  TextEditingController bedroomFourController = TextEditingController();

  TextEditingController otherIfApplicableController = TextEditingController();

  var interiordefectsfamily = "NA";

  var interiordefectsstudy = "NA";

  var interiordefectsstairs = "NA";

  var interiordefectslaundry = "NA";
  var interiordefectslaundryvalue = "NA";

  var interiordefectstoilet = "NA";

  var imagePath = "NA";
  var imageName = "NA";
  var imageData = "NA";

  var interiordefectsstudyimagePath = "NA";
  var interiordefectsstudyimageName = "NA";
  var interiordefectsstudyimageData = "NA";

  var interiordefectsstairsimagePath = "NA";
  var interiordefectsstairsimageName = "NA";
  var interiordefectsstairsimageData = "NA";

  var interiordefectslaundryimagePath = "NA";
  var interiordefectslaundryimageName = "NA";
  var interiordefectslaundryimageData = "NA";

  var interiordefectstoiletimagePath = "NA";
  var interiordefectstoiletimageName = "NA";
  var interiordefectstoiletimageData = "NA";

  ImagePicker imagePicker = ImagePicker();

  Future<void> getImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File imagePath = File(getimage.path);

        imageName = getimage.path.split('/').last;
        imageData = base64Encode(imagePath.readAsBytesSync());

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
        File imagePath = File(getimage.path);
        imageName = getimage.path.split('/').last;
        imageData = base64Encode(imagePath.readAsBytesSync());

        print(imagePath);
        print(imageName);
        print(imageData);
      }
    });
  }

  Future<void> interiordefectsstudygetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File interiordefectsstudyimagePath = File(getimage.path);

        interiordefectsstudyimageName = getimage.path.split('/').last;
        interiordefectsstudyimageData =
            base64Encode(interiordefectsstudyimagePath.readAsBytesSync());

        print(interiordefectsstudyimagePath);
        print(interiordefectsstudyimageName);
        print(interiordefectsstudyimageData);
      }
    });
  }

  Future<void> interiordefectsstudycaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File interiordefectsstudyimagePath = File(getimage.path);

        interiordefectsstudyimageName = getimage.path.split('/').last;
        interiordefectsstudyimageData =
            base64Encode(interiordefectsstudyimagePath.readAsBytesSync());

        print(interiordefectsstudyimagePath);
        print(interiordefectsstudyimageName);
        print(interiordefectsstudyimageData);
      }
    });
  }

  Future<void> interiordefectsstairsgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File interiordefectsstairsimagePath = File(getimage.path);

        interiordefectsstairsimageName = getimage.path.split('/').last;
        interiordefectsstairsimageData =
            base64Encode(interiordefectsstairsimagePath.readAsBytesSync());

        print(interiordefectsstairsimagePath);
        print(interiordefectsstairsimageName);
        print(interiordefectsstairsimageData);
      }
    });
  }

  Future<void> interiordefectsstairscaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File interiordefectsstairsimagePath = File(getimage.path);
        interiordefectsstairsimageName = getimage.path.split('/').last;
        interiordefectsstairsimageData =
            base64Encode(interiordefectsstairsimagePath.readAsBytesSync());

        print(interiordefectsstairsimagePath);
        print(interiordefectsstairsimageName);
        print(interiordefectsstairsimageData);
      }
    });
  }

  Future<void> interiordefectslaundrygetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File interiordefectslaundryimagePath = File(getimage.path);

        interiordefectslaundryimageName = getimage.path.split('/').last;
        interiordefectslaundryimageData =
            base64Encode(interiordefectslaundryimagePath.readAsBytesSync());

        print(interiordefectslaundryimagePath);
        print(interiordefectslaundryimageName);
        print(interiordefectslaundryimageData);
      }
    });
  }

  Future<void> interiordefectslaundrycaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File interiordefectslaundryimagePath = File(getimage.path);

        interiordefectslaundryimageName = getimage.path.split('/').last;
        interiordefectslaundryimageData =
            base64Encode(interiordefectslaundryimagePath.readAsBytesSync());

        print(interiordefectslaundryimagePath);
        print(interiordefectslaundryimageName);
        print(interiordefectslaundryimageData);
      }
    });
  }

  Future<void> interiordefectstoiletgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File interiordefectstoiletimagePath = File(getimage.path);

        interiordefectstoiletimageName = getimage.path.split('/').last;
        interiordefectstoiletimageData =
            base64Encode(interiordefectstoiletimagePath.readAsBytesSync());

        print(interiordefectstoiletimagePath);
        print(interiordefectstoiletimageName);
        print(interiordefectstoiletimageData);
      }
    });
  }

  Future<void> interiordefectstoiletcaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File interiordefectstoiletimagePath = File(getimage.path);

        interiordefectstoiletimageName = getimage.path.split('/').last;
        interiordefectstoiletimageData =
            base64Encode(interiordefectstoiletimagePath.readAsBytesSync());

        print(interiordefectstoiletimagePath);
        print(interiordefectstoiletimageName);
        print(interiordefectstoiletimageData);
      }
    });
  }

  interiordefectslaundryCheck() {
    if (interiordefectslaundry == "Defects/Safety Hazards found were") {
      return DropdownButtonFormField(
        isExpanded: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text('Defects/Safety Hazards found were'),
        ),
        value: interiordefectslaundryvalue,
        items: [
          DropdownMenuItem(
            child: Text('-Select-'),
            value: "NA",
          ),
          DropdownMenuItem(
            child: Text('Signs of previous moisture damage were found.'),
            value: "Signs of previous moisture damage were found.",
          ),
          DropdownMenuItem(
            child: Text('Damage to grouting was found.'),
            value: "Damage to grouting was found.",
          ),
          DropdownMenuItem(
            child: Text(
                'Signs of previous moisture damage were found. But there were no signs of any moisture on moisture meter at the time of inspection.'),
            value:
                "Signs of previous moisture damage were found. But there were no signs of any moisture on moisture meter at the time of inspection.",
          ),
        ],
        onChanged: (interiordefectslaundryvalue) {
          setState(() {
            this.interiordefectslaundryvalue = interiordefectslaundryvalue!;
            //print(personsinattendance);
          });
        },
      );
    }
  }

  Future<void> updateTheInteriorDetails(String id) async {
    try {
      showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        },
      );
      var res = await http
          .post(Uri.parse(API.prepurchasetheinteriorsteptwodetails), body: {
        "id": id,

        "interiordefectsfamily": interiordefectsfamily,
        //"interiordefectsstudy": studyController.text.trim(),
        "interiordefectsstudy": interiordefectsstudy,
        //"interiordefectsstairs": stairsController.text.trim(),
        "interiordefectsstairs": interiordefectsstairs,
        //"interiordefectslaundry": laundryController.text.trim(),
        "interiordefectslaundry": interiordefectslaundry,
        "interiordefectslaundryvalue": interiordefectslaundryvalue,
        //"interiordefectstoilet": toiletController.text.trim(),
        "interiordefectstoilet": interiordefectstoilet,
        "data": imageData,
        "name": imageName,
        "interiordefectsstudyimagedata": interiordefectsstudyimageData,
        "interiordefectsstudyimagename": interiordefectsstudyimageName,
        "interiordefectsstairsimagedata": interiordefectsstairsimageData,
        "interiordefectsstairsimagename": interiordefectsstairsimageName,
        "interiordefectslaundryimagedata": interiordefectslaundryimageData,
        "interiordefectslaundryimagename": interiordefectslaundryimageName,
        "interiordefectstoiletimagedata": interiordefectstoiletimageData,
        "interiordefectstoiletimagename": interiordefectstoiletimageName,
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        Navigator.of(context).pop();
        //print("Record Inserted");

        Fluttertoast.showToast(msg: "Record Inserted");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingInspectionTheInteriorStepThreeFragments(reportId: id)));
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
                'INTERIOR OF THE BUILDING (STEP 2)',
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

            //Family Room

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Family Room'),
                ),
                value: interiordefectsfamily,
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
                onChanged: (interiordefectsfamily) {
                  setState(() {
                    this.interiordefectsfamily = interiordefectsfamily!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: imageData != "NA"
                  ? Image.memory(base64Decode(imageData))
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
            //Study

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Study'),
                ),
                value: interiordefectsstudy,
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
                onChanged: (interiordefectsstudy) {
                  setState(() {
                    this.interiordefectsstudy = interiordefectsstudy!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: interiordefectsstudyimageData != "NA"
                  ? Image.memory(base64Decode(interiordefectsstudyimageData))
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
                          interiordefectsstudycaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          interiordefectsstudygetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),
            //Stairs

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Stairs'),
                ),
                value: interiordefectsstairs,
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
                onChanged: (interiordefectsstairs) {
                  setState(() {
                    this.interiordefectsstairs = interiordefectsstairs!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: interiordefectsstairsimageData != "NA"
                  ? Image.memory(base64Decode(interiordefectsstairsimageData))
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
                          interiordefectsstairscaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          interiordefectsstairsgetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),
            //Laundry

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Laundry'),
                ),
                value: interiordefectslaundry,
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
                onChanged: (interiordefectslaundry) {
                  setState(() {
                    this.interiordefectslaundry = interiordefectslaundry!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: interiordefectslaundryCheck(),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: interiordefectslaundryimageData != "NA"
                  ? Image.memory(base64Decode(interiordefectslaundryimageData))
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
                          interiordefectslaundrycaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          interiordefectslaundrygetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),
            //Toilet

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Toilet'),
                ),
                value: interiordefectstoilet,
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
                onChanged: (interiordefectstoilet) {
                  setState(() {
                    this.interiordefectstoilet = interiordefectstoilet!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: interiordefectstoiletimageData != "NA"
                  ? Image.memory(base64Decode(interiordefectstoiletimageData))
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
                          interiordefectstoiletcaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          interiordefectstoiletgetImage();
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
                          updateTheInteriorDetails(widget.reportId);
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
