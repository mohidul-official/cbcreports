import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../api_connection/api_connection.dart';

import 'package:http/http.dart' as http;

import 'building_inspection_the_roof_exterior_fragments_screen.dart';

class BuildingInspectionTheRoofInteriorFragments extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  BuildingInspectionTheRoofInteriorFragments(
      {Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildingInspectionTheRoofInteriorFragments> createState() =>
      _BuildingInspectionTheRoofInteriorFragmentsState();
}

class _BuildingInspectionTheRoofInteriorFragmentsState
    extends State<BuildingInspectionTheRoofInteriorFragments> {
  var roofinteriorcovering = "NA";

  var roofinteriorflashings = "NA";

  var roofinteriorframing = "NA";

  var roofinteriorinsulation = "NA";
  var roofinteriorinsulationvalue = "NA";

  var roofinteriorsarking = "NA";

  var roofinteriorother = "NA";

  var roofinteriorcoveringimagePath = "NA";
  var roofinteriorcoveringimageName = "NA";
  var roofinteriorcoveringimageData = "NA";

  var roofinteriorflashingsimagePath = "NA";
  var roofinteriorflashingsimageName = "NA";
  var roofinteriorflashingsimageData = "NA";

  var roofinteriorframingimagePath = "NA";
  var roofinteriorframingimageName = "NA";
  var roofinteriorframingimageData = "NA";

  var roofinteriorinsulationimagePath = "NA";
  var roofinteriorinsulationimageName = "NA";
  var roofinteriorinsulationimageData = "NA";

  var roofinteriorsarkingimagePath = "NA";
  var roofinteriorsarkingimageName = "NA";
  var roofinteriorsarkingimageData = "NA";

  var roofinteriorotherimagePath = "NA";
  var roofinteriorotherimageName = "NA";
  var roofinteriorotherimageData = "NA";

  ImagePicker imagePicker = ImagePicker();

  Future<void> roofinteriorcoveringgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File roofinteriorcoveringimagePath = File(getimage.path);

        roofinteriorcoveringimageName = getimage.path.split('/').last;
        roofinteriorcoveringimageData =
            base64Encode(roofinteriorcoveringimagePath.readAsBytesSync());

        print(roofinteriorcoveringimagePath);
        print(roofinteriorcoveringimageName);
        print(roofinteriorcoveringimageData);
      }
    });
  }

  Future<void> roofinteriorcoveringcaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File roofinteriorcoveringimagePath = File(getimage.path);

        roofinteriorcoveringimageName = getimage.path.split('/').last;
        roofinteriorcoveringimageData =
            base64Encode(roofinteriorcoveringimagePath.readAsBytesSync());

        print(roofinteriorcoveringimagePath);
        print(roofinteriorcoveringimageName);
        print(roofinteriorcoveringimageData);
      }
    });
  }

  Future<void> roofinteriorflashingsgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File roofinteriorflashingsimagePath = File(getimage.path);

        roofinteriorflashingsimageName = getimage.path.split('/').last;
        roofinteriorflashingsimageData =
            base64Encode(roofinteriorflashingsimagePath.readAsBytesSync());

        print(roofinteriorflashingsimagePath);
        print(roofinteriorflashingsimageName);
        print(roofinteriorflashingsimageData);
      }
    });
  }

  Future<void> roofinteriorflashingscaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File roofinteriorflashingsimagePath = File(getimage.path);

        roofinteriorflashingsimageName = getimage.path.split('/').last;
        roofinteriorflashingsimageData =
            base64Encode(roofinteriorflashingsimagePath.readAsBytesSync());

        print(roofinteriorflashingsimagePath);
        print(roofinteriorflashingsimageName);
        print(roofinteriorflashingsimageData);
      }
    });
  }

  Future<void> roofinteriorframinggetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File roofinteriorframingimagePath = File(getimage.path);

        roofinteriorframingimageName = getimage.path.split('/').last;
        roofinteriorframingimageData =
            base64Encode(roofinteriorframingimagePath.readAsBytesSync());

        print(roofinteriorframingimagePath);
        print(roofinteriorframingimageName);
        print(roofinteriorframingimageData);
      }
    });
  }

  Future<void> roofinteriorframingcaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File roofinteriorframingimagePath = File(getimage.path);

        roofinteriorframingimageName = getimage.path.split('/').last;
        roofinteriorframingimageData =
            base64Encode(roofinteriorframingimagePath.readAsBytesSync());

        print(roofinteriorframingimagePath);
        print(roofinteriorframingimageName);
        print(roofinteriorframingimageData);
      }
    });
  }

  Future<void> roofinteriorinsulationgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File roofinteriorinsulationimagePath = File(getimage.path);

        roofinteriorinsulationimageName = getimage.path.split('/').last;
        roofinteriorinsulationimageData =
            base64Encode(roofinteriorinsulationimagePath.readAsBytesSync());

        print(roofinteriorinsulationimagePath);
        print(roofinteriorinsulationimageName);
        print(roofinteriorinsulationimageData);
      }
    });
  }

  Future<void> roofinteriorinsulationcaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File roofinteriorinsulationimagePath = File(getimage.path);

        roofinteriorinsulationimageName = getimage.path.split('/').last;
        roofinteriorinsulationimageData =
            base64Encode(roofinteriorinsulationimagePath.readAsBytesSync());

        print(roofinteriorinsulationimagePath);
        print(roofinteriorinsulationimageName);
        print(roofinteriorinsulationimageData);
      }
    });
  }

  Future<void> roofinteriorsarkinggetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File roofinteriorsarkingimagePath = File(getimage.path);

        roofinteriorsarkingimageName = getimage.path.split('/').last;
        roofinteriorsarkingimageData =
            base64Encode(roofinteriorsarkingimagePath.readAsBytesSync());

        print(roofinteriorsarkingimagePath);
        print(roofinteriorsarkingimageName);
        print(roofinteriorsarkingimageData);
      }
    });
  }

  Future<void> roofinteriorsarkingcaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File roofinteriorsarkingimagePath = File(getimage.path);

        roofinteriorsarkingimageName = getimage.path.split('/').last;
        roofinteriorsarkingimageData =
            base64Encode(roofinteriorsarkingimagePath.readAsBytesSync());

        print(roofinteriorsarkingimagePath);
        print(roofinteriorsarkingimageName);
        print(roofinteriorsarkingimageData);
      }
    });
  }

  Future<void> roofinteriorothergetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File roofinteriorotherimagePath = File(getimage.path);

        roofinteriorotherimageName = getimage.path.split('/').last;
        roofinteriorotherimageData =
            base64Encode(roofinteriorotherimagePath.readAsBytesSync());

        print(roofinteriorotherimagePath);
        print(roofinteriorotherimageName);
        print(roofinteriorotherimageData);
      }
    });
  }

  Future<void> roofinteriorothercaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File roofinteriorotherimagePath = File(getimage.path);

        roofinteriorotherimageName = getimage.path.split('/').last;
        roofinteriorotherimageData =
            base64Encode(roofinteriorotherimagePath.readAsBytesSync());

        print(roofinteriorotherimagePath);
        print(roofinteriorotherimageName);
        print(roofinteriorotherimageData);
      }
    });
  }

  roofinteriorinsulationCheck() {
    if (roofinteriorinsulation == "Defects/Safety Hazards found were") {
      setState(() {
        roofinteriorinsulationvalue =
            "Garage was full of storage; A thorough inspection was not possible. There might be few issues which went unnoticed.";
      });

      return Text(
          'Garage was full of storage; A thorough inspection was not possible. There might be few issues which went unnoticed.');
    } else {
      setState(() {
        roofinteriorinsulationvalue = " ";
      });
    }
  }

  Future<void> updateTheRoofInteriorDetails(String id) async {
    try {
      showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        },
      );
      var res = await http
          .post(Uri.parse(API.prepurchasetheroofinteriordetails), body: {
        "id": id,
        //"roofinteriorcovering": roofCoveringUndersideController.text.trim(),
        "roofinteriorcovering": roofinteriorcovering,
        //"roofinteriorflashings": roofFlashingsUndersideController.text.trim(),
        "roofinteriorflashings": roofinteriorflashings,
        //"roofinteriorframing": roofFramingController.text.trim(),
        "roofinteriorframing": roofinteriorframing,
        //"roofinteriorinsulation": insulationController.text.trim(),
        "roofinteriorinsulation": roofinteriorinsulation,
        "roofinteriorinsulationvalue": roofinteriorinsulationvalue,
        //"roofinteriorsarking": sarkingController.text.trim(),
        "roofinteriorsarking": roofinteriorsarking,
        //"roofinteriorother": otherIfApplicableController.text.trim(),
        "roofinteriorother": roofinteriorother,

        "roofinteriorcoveringimagedata": roofinteriorcoveringimageData,
        "roofinteriorcoveringimagename": roofinteriorcoveringimageName,
        "roofinteriorflashingsimagedata": roofinteriorflashingsimageData,
        "roofinteriorflashingsimagename": roofinteriorflashingsimageName,
        "roofinteriorframingimagedata": roofinteriorframingimageData,
        "roofinteriorframingimagename": roofinteriorframingimageName,
        "roofinteriorinsulationimagedata": roofinteriorinsulationimageData,
        "roofinteriorinsulationimagename": roofinteriorinsulationimageName,
        "roofinteriorsarkingimagedata": roofinteriorsarkingimageData,
        "roofinteriorsarkingimagename": roofinteriorsarkingimageName,
        "roofinteriorotherimagedata": roofinteriorotherimageData,
        "roofinteriorotherimagename": roofinteriorotherimageName,
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        Navigator.of(context).pop();
        //print("Record Inserted");

        Fluttertoast.showToast(msg: "Record Inserted");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingInspectionTheRoofExteriorFragments(reportId: id)));
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
                'THE ROOF INTERIOR',
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
            //Roof Covering Underside:

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Roof Covering Underside'),
                ),
                value: roofinteriorcovering,
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
                onChanged: (roofinteriorcovering) {
                  setState(() {
                    this.roofinteriorcovering = roofinteriorcovering!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: roofinteriorcoveringimageData != "NA"
                  ? Image.memory(base64Decode(roofinteriorcoveringimageData))
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
                          roofinteriorcoveringcaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          roofinteriorcoveringgetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),

            //Roof Flashings Underside:

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Roof Flashings Underside'),
                ),
                value: roofinteriorflashings,
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
                onChanged: (roofinteriorflashings) {
                  setState(() {
                    this.roofinteriorflashings = roofinteriorflashings!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: roofinteriorflashingsimageData != "NA"
                  ? Image.memory(base64Decode(roofinteriorflashingsimageData))
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
                          roofinteriorflashingscaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          roofinteriorflashingsgetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),

            //Roof Framing

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Roof Framing'),
                ),
                value: roofinteriorframing,
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
                onChanged: (roofinteriorframing) {
                  setState(() {
                    this.roofinteriorframing = roofinteriorframing!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: roofinteriorframingimageData != "NA"
                  ? Image.memory(base64Decode(roofinteriorframingimageData))
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
                          roofinteriorframingcaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          roofinteriorframinggetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),

            //Insulation

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Insulation'),
                ),
                value: roofinteriorinsulation,
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
                onChanged: (roofinteriorinsulation) {
                  setState(() {
                    this.roofinteriorinsulation = roofinteriorinsulation!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: roofinteriorinsulationCheck(),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: roofinteriorinsulationimageData != "NA"
                  ? Image.memory(base64Decode(roofinteriorinsulationimageData))
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
                          roofinteriorinsulationcaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          roofinteriorinsulationgetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),

            //Sarking

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Sarking'),
                ),
                value: roofinteriorsarking,
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
                onChanged: (roofinteriorsarking) {
                  setState(() {
                    this.roofinteriorsarking = roofinteriorsarking!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: roofinteriorsarkingimageData != "NA"
                  ? Image.memory(base64Decode(roofinteriorsarkingimageData))
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
                          roofinteriorsarkingcaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          roofinteriorsarkinggetImage();
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
                value: roofinteriorother,
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
                onChanged: (roofinteriorother) {
                  setState(() {
                    this.roofinteriorother = roofinteriorother!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: roofinteriorotherimageData != "NA"
                  ? Image.memory(base64Decode(roofinteriorotherimageData))
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
                          roofinteriorothercaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          roofinteriorothergetImage();
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
                          updateTheRoofInteriorDetails(widget.reportId);
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
