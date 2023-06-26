import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../api_connection/api_connection.dart';
import 'package:http/http.dart' as http;

import 'building_inspection_the_interior_fragments_screen.dart';

class BuildingInspectorTheExteriorStepThreeFragments extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  BuildingInspectorTheExteriorStepThreeFragments(
      {Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildingInspectorTheExteriorStepThreeFragments> createState() =>
      _BuildingInspectorTheExteriorStepThreeFragmentsState();
}

class _BuildingInspectorTheExteriorStepThreeFragmentsState
    extends State<BuildingInspectorTheExteriorStepThreeFragments> {
  /*TextEditingController patiosController = TextEditingController();

  TextEditingController decksController = TextEditingController();

  TextEditingController chimneysController = TextEditingController();

  TextEditingController otherIfApplicableController = TextEditingController();*/

  var patiosimagePath = "NA";
  var patiosimageName = "NA";
  var patiosimageData = "NA";

  var decksimagePath = "NA";
  var decksimageName = "NA";
  var decksimageData = "NA";

  var chimneysimagePath = "NA";
  var chimneysimageName = "NA";
  var chimneysimageData = "NA";

  var otherimagePath = "NA";
  var otherimageName = "NA";
  var otherimageData = "NA";

  var exteriordefectspatios = "NA";

  var exteriordefectsdecks = "NA";
  var exteriordefectsdecksvalue = "NA";

  var exteriordefectschimneys = "NA";

  var exteriordefectsother = "NA";

  ImagePicker imagePicker = ImagePicker();

  Future<void> patiosgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File patiosimagePath = File(getimage.path);
        patiosimageName = getimage.path.split('/').last;
        patiosimageData = base64Encode(patiosimagePath.readAsBytesSync());
        print(patiosimagePath);
        print(patiosimageName);
        print(patiosimageData);
      }
    });
  }

  Future<void> patioscaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File patiosimagePath = File(getimage.path);
        patiosimageName = getimage.path.split('/').last;
        patiosimageData = base64Encode(patiosimagePath.readAsBytesSync());
        print(patiosimagePath);
        print(patiosimageName);
        print(patiosimageData);
      }
    });
  }

  Future<void> decksgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File decksimagePath = File(getimage.path);
        decksimageName = getimage.path.split('/').last;
        decksimageData = base64Encode(decksimagePath.readAsBytesSync());
        print(decksimagePath);
        print(decksimageName);
        print(decksimageData);
      }
    });
  }

  Future<void> deckscaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File decksimagePath = File(getimage.path);
        decksimageName = getimage.path.split('/').last;
        decksimageData = base64Encode(decksimagePath.readAsBytesSync());
        print(decksimagePath);
        print(decksimageName);
        print(decksimageData);
      }
    });
  }

  Future<void> chimneysgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File chimneysimagePath = File(getimage.path);
        chimneysimageName = getimage.path.split('/').last;
        chimneysimageData = base64Encode(chimneysimagePath.readAsBytesSync());
        print(chimneysimagePath);
        print(chimneysimageName);
        print(chimneysimageData);
      }
    });
  }

  Future<void> chimneyscaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File chimneysimagePath = File(getimage.path);
        chimneysimageName = getimage.path.split('/').last;
        chimneysimageData = base64Encode(chimneysimagePath.readAsBytesSync());
        print(chimneysimagePath);
        print(chimneysimageName);
        print(chimneysimageData);
      }
    });
  }

  Future<void> othergetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File otherimagePath = File(getimage.path);
        otherimageName = getimage.path.split('/').last;
        otherimageData = base64Encode(otherimagePath.readAsBytesSync());
        print(otherimagePath);
        print(otherimageName);
        print(otherimageData);
      }
    });
  }

  Future<void> othercaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File otherimagePath = File(getimage.path);
        otherimageName = getimage.path.split('/').last;
        otherimageData = base64Encode(otherimagePath.readAsBytesSync());
        print(otherimagePath);
        print(otherimageName);
        print(otherimageData);
      }
    });
  }

  exteriordefectsdecksCheck() {
    if (exteriordefectsdecks == "Defects/Safety Hazards found were") {
      return DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text('Defects/Safety Hazards found were'),
        ),
        value: exteriordefectsdecksvalue,
        items: [
          DropdownMenuItem(
            child: Text('-Select-'),
            value: "NA",
          ),
          DropdownMenuItem(
            child: Text(
                'Decking has spongy bounce. It is\nrecommended to contact a certified\ncarpenter to fix it.'),
            value:
                "Decking has spongy bounce. It is recommended to contact a certified carpenter to fix it.",
          ),
          DropdownMenuItem(
            child: Text('Decking requires an external paint/stain.'),
            value: "Decking requires an external paint/stain.",
          ),
        ],
        onChanged: (exteriordefectsdecksvalue) {
          setState(() {
            this.exteriordefectsdecksvalue = exteriordefectsdecksvalue!;
            //print(personsinattendance);
          });
        },
      );
    }
  }

  Future<void> updateTheExteriorDetails(String id) async {
    try {
      showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        },
      );
      var res = await http
          .post(Uri.parse(API.prepurchasetheexteriorstepthreedetails), body: {
        "id": id,
        //"exteriordefectspatios": patiosController.text.trim(),
        "exteriordefectspatios": exteriordefectspatios,
        //"exteriordefectsdecks": decksController.text.trim(),
        "exteriordefectsdecks": exteriordefectsdecks,
        "exteriordefectsdecksvalue": exteriordefectsdecksvalue,
        //"exteriordefectschimneys": chimneysController.text.trim(),
        "exteriordefectschimneys": exteriordefectschimneys,
        //"exteriordefectsother": otherIfApplicableController.text.trim(),
        "exteriordefectsother": exteriordefectsother,
        "patiosimagedata": patiosimageData,
        "patiosimagename": patiosimageName,
        "decksimagedata": decksimageData,
        "decksimagename": decksimageName,
        "chimneysimagedata": chimneysimageData,
        "chimneysimagename": chimneysimageName,
        "otherimagedata": otherimageData,
        "otherimagename": otherimageName,
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        Navigator.of(context).pop();
        //print("Record Inserted");

        Fluttertoast.showToast(msg: "Record Inserted");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingInspectionTheInteriorFragments(reportId: id)));
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
                'EXTERIOR OF THE BUILDING (STEP 3)',
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
            //Patios

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Patios'),
                ),
                value: exteriordefectspatios,
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
                onChanged: (exteriordefectspatios) {
                  setState(() {
                    this.exteriordefectspatios = exteriordefectspatios!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: patiosimagePath != "NA"
                  ? Image.memory(base64Decode(patiosimagePath))
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
                          patioscaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          patiosgetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),
            //Decks

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Decks'),
                ),
                value: exteriordefectsdecks,
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
                onChanged: (exteriordefectsdecks) {
                  setState(() {
                    this.exteriordefectsdecks = exteriordefectsdecks!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: exteriordefectsdecksCheck(),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: decksimagePath != "NA"
                  ? Image.memory(base64Decode(decksimagePath))
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
                          deckscaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          decksgetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),
            //Chimneys

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Chimneys'),
                ),
                value: exteriordefectschimneys,
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
                onChanged: (exteriordefectschimneys) {
                  setState(() {
                    this.exteriordefectschimneys = exteriordefectschimneys!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: chimneysimagePath != "NA"
                  ? Image.memory(base64Decode(chimneysimagePath))
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
                          chimneyscaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          chimneysgetImage();
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
                isExpanded: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Other if Applicable'),
                ),
                value: exteriordefectsother,
                items: [
                  DropdownMenuItem(
                    child: Text('-Select-'),
                    value: "NA",
                  ),
                  DropdownMenuItem(
                    child: Text('No further Defects/Safety Hazards found.'),
                    value: "No further Defects/Safety Hazards found",
                  ),
                  DropdownMenuItem(
                    child: Text('Other Defects/Safety Hazards found were.'),
                    value: "Other Defects/Safety Hazards found were",
                  ),
                  DropdownMenuItem(
                    child: Text('Not applicable'),
                    value: "Not applicable",
                  ),
                ],
                onChanged: (exteriordefectsother) {
                  setState(() {
                    this.exteriordefectsother = exteriordefectsother!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: otherimagePath != "NA"
                  ? Image.memory(base64Decode(otherimagePath))
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
                          othercaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          othergetImage();
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
                          updateTheExteriorDetails(widget.reportId);
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
