import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../api_connection/api_connection.dart';
import 'package:http/http.dart' as http;

import 'building_inspection_the_exterior_step_two_fragments_screen.dart';

class BuildingInspectorTheExteriorFragments extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  BuildingInspectorTheExteriorFragments({Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildingInspectorTheExteriorFragments> createState() =>
      _BuildingInspectorTheExteriorFragmentsState();
}

class _BuildingInspectorTheExteriorFragmentsState
    extends State<BuildingInspectorTheExteriorFragments> {
  /*TextEditingController wallsController = TextEditingController();
  TextEditingController externalCladdingController = TextEditingController();
  TextEditingController lintelsController = TextEditingController();
  TextEditingController doorsController = TextEditingController();

  TextEditingController windowsController = TextEditingController();*/

  var wallsimagePath = "NA";
  var wallsimageName = "NA";
  var wallsimageData = "NA";

  var claddingimagePath = "NA";
  var claddingimageName = "NA";
  var claddingimageData = "NA";

  var lintelsimagePath = "NA";
  var lintelsimageName = "NA";
  var lintelsimageData = "NA";

  var doorsimagePath = "NA";
  var doorsimageName = "NA";
  var doorsimageData = "NA";

  var windowsimagePath = "NA";
  var windowsimageName = "NA";
  var windowsimageData = "NA";

  /*File? wallsimagePath;
  String? wallsimageName;
  String? wallsimageData;

  File? claddingimagePath;
  String? claddingimageName;
  String? claddingimageData;

  File? lintelsimagePath;
  String? lintelsimageName;
  String? lintelsimageData;

  File? doorsimagePath;
  String? doorsimageName;
  String? doorsimageData;

  File? windowsimagePath;
  String? windowsimageName;
  String? windowsimageData;*/

  var exteriordefectswalls = "NA";
  var exteriordefectswallsvalue = "NA";

  var exteriordefectscladding = "NA";
  var exteriordefectscladdingvalue = "NA";

  var exteriordefectslintels = "NA";

  var exteriordefectsdoors = "NA";
  var exteriordefectsdoorsvalue = "NA";

  var exteriordefectswindows = "NA";
  var exteriordefectswindowsvalue = "NA";

  ImagePicker imagePicker = ImagePicker();

  Future<void> wallsgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File wallsimagePath = File(getimage.path);
        wallsimageName = getimage.path.split('/').last;
        wallsimageData = base64Encode(wallsimagePath.readAsBytesSync());
        print(wallsimagePath);
        print(wallsimageName);
        print(wallsimageData);
      }
    });
  }

  Future<void> wallscaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File wallsimagePath = File(getimage.path);
        wallsimageName = getimage.path.split('/').last;
        wallsimageData = base64Encode(wallsimagePath.readAsBytesSync());
        print(wallsimagePath);
        print(wallsimageName);
        print(wallsimageData);
      }
    });
  }

  Future<void> claddinggetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File claddingimagePath = File(getimage.path);
        claddingimageName = getimage.path.split('/').last;
        claddingimageData = base64Encode(claddingimagePath.readAsBytesSync());
        print(claddingimagePath);
        print(claddingimageName);
        print(claddingimageData);
      }
    });
  }

  Future<void> claddingcaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File claddingimagePath = File(getimage.path);
        claddingimageName = getimage.path.split('/').last;
        claddingimageData = base64Encode(claddingimagePath.readAsBytesSync());
        print(claddingimagePath);
        print(claddingimageName);
        print(claddingimageData);
      }
    });
  }

  Future<void> lintelsgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File lintelsimagePath = File(getimage.path);
        lintelsimageName = getimage.path.split('/').last;
        lintelsimageData = base64Encode(lintelsimagePath.readAsBytesSync());
        print(lintelsimagePath);
        print(lintelsimageName);
        print(lintelsimageData);
      }
    });
  }

  Future<void> lintelscaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File lintelsimagePath = File(getimage.path);
        lintelsimageName = getimage.path.split('/').last;
        lintelsimageData = base64Encode(lintelsimagePath.readAsBytesSync());
        print(lintelsimagePath);
        print(lintelsimageName);
        print(lintelsimageData);
      }
    });
  }

  Future<void> doorsgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File doorsimagePath = File(getimage.path);
        doorsimageName = getimage.path.split('/').last;
        doorsimageData = base64Encode(doorsimagePath.readAsBytesSync());
        print(doorsimagePath);
        print(doorsimageName);
        print(doorsimageData);
      }
    });
  }

  Future<void> doorscaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File doorsimagePath = File(getimage.path);
        doorsimageName = getimage.path.split('/').last;
        doorsimageData = base64Encode(doorsimagePath.readAsBytesSync());
        print(doorsimagePath);
        print(doorsimageName);
        print(doorsimageData);
      }
    });
  }

  Future<void> windowsgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File windowsimagePath = File(getimage.path);
        windowsimageName = getimage.path.split('/').last;
        windowsimageData = base64Encode(windowsimagePath.readAsBytesSync());
        print(windowsimagePath);
        print(windowsimageName);
        print(windowsimageData);
      }
    });
  }

  Future<void> windowscaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File windowsimagePath = File(getimage.path);
        windowsimageName = getimage.path.split('/').last;
        windowsimageData = base64Encode(windowsimagePath.readAsBytesSync());
        print(windowsimagePath);
        print(windowsimageName);
        print(windowsimageData);
      }
    });
  }

  exteriordefectswallsCheck() {
    if (exteriordefectswalls == "Defects/Safety Hazards found were") {
      return DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text('Defects/Safety Hazards found were'),
        ),
        value: exteriordefectswallsvalue,
        items: [
          DropdownMenuItem(
            child: Text('-Select-'),
            value: "NA",
          ),
          DropdownMenuItem(
            child: Text('General movement cracking was found.'),
            value: "General movement cracking was found.",
          ),
          DropdownMenuItem(
            child: Text(
                'General movement cracking was found.\nRegardless of the appearance of the cracks\na Pre-Purchase Building Inspector carrying\nout a Pre-Purchase Inspection within the\nscope of a visual inspection is unable to\ndetermine the expected consequences of\nthe cracks.\n '),
            value:
                "General movement cracking was found. Regardless of the appearance of the cracks a Pre-Purchase Building Inspector carrying out a Pre-Purchase Inspection within the scope of a visual inspection is unable to determine the expected consequences of the cracks. ",
          ),
          DropdownMenuItem(
            child: Text(
                'Cracking was found to the external cladding.\nRegardless of the appearance of the\ncracks a Pre-Purchase Building Inspector\ncarrying out a Pre-Purchase Inspection within\nthe scope of a visual inspection is unable to\ndetermine the expected consequences of the\ncracks. A Structural Engineer is required to\ndetermine the significance of the cracking\nprior to a decision to purchase.'),
            value:
                "Cracking was found to the external cladding. Regardless of the appearance of the cracks a Pre-Purchase Building Inspector carrying out a Pre-Purchase Inspection within the scope of a visual inspection is unable to determine the expected consequences of the cracks. A Structural Engineer is required to determine the significance of the cracking prior to a decision to purchase.",
          ),
        ],
        onChanged: (exteriordefectswallsvalue) {
          setState(() {
            this.exteriordefectswallsvalue = exteriordefectswallsvalue!;
            //print(personsinattendance);
          });
        },
      );
    }
  }

  exteriordefectscladdingCheck() {
    if (exteriordefectscladding == "Defects/Safety Hazards found were") {
      return DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text('Defects/Safety Hazards found were'),
        ),
        value: exteriordefectscladdingvalue,
        items: [
          DropdownMenuItem(
            child: Text('-Select-'),
            value: "NA",
          ),
          DropdownMenuItem(
            child: Text('General movement cracking was found.'),
            value: "General movement cracking was found.",
          ),
          DropdownMenuItem(
            child: Text(
                'General movement cracking was found.\nRegardless of the appearance of the cracks\na Pre-Purchase Building Inspector carrying\nout a Pre-Purchase Inspection within the\nscope of a visual inspection is unable to\ndetermine the expected consequences of\nthe cracks.\n '),
            value:
                "General movement cracking was found. Regardless of the appearance of the cracks a Pre-Purchase Building Inspector carrying out a Pre-Purchase Inspection within the scope of a visual inspection is unable to determine the expected consequences of the cracks. ",
          ),
          DropdownMenuItem(
            child: Text(
                'Cracking was found to the external cladding.\nRegardless of the appearance of the\ncracks a Pre-Purchase Building Inspector\ncarrying out a Pre-Purchase Inspection within\nthe scope of a visual inspection is unable to\ndetermine the expected consequences of the\ncracks. A Structural Engineer is required to\ndetermine the significance of the cracking\nprior to a decision to purchase.'),
            value:
                "Cracking was found to the external cladding. Regardless of the appearance of the cracks a Pre-Purchase Building Inspector carrying out a Pre-Purchase Inspection within the scope of a visual inspection is unable to determine the expected consequences of the cracks. A Structural Engineer is required to determine the significance of the cracking prior to a decision to purchase.",
          ),
        ],
        onChanged: (exteriordefectscladdingvalue) {
          setState(() {
            this.exteriordefectscladdingvalue = exteriordefectscladdingvalue!;
            //print(personsinattendance);
          });
        },
      );
    }
  }

  exteriordefectsdoorsCheck() {
    if (exteriordefectsdoors == "Defects/Safety Hazards found were") {
      return DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text('Defects/Safety Hazards found were'),
        ),
        value: exteriordefectsdoorsvalue,
        items: [
          DropdownMenuItem(
            child: Text('-Select-'),
            value: "NA",
          ),
          DropdownMenuItem(
            child: Text('Door is damaged.'),
            value: "Door is damaged.",
          ),
          DropdownMenuItem(
            child: Text('Door is jammed.'),
            value: "Door is jammed.",
          ),
          DropdownMenuItem(
            child: Text(
                'It is recommended to contact a certified\ncarpenter to fix it.'),
            value:
                "It is recommended to contact a certified carpenter to fix it.",
          ),
        ],
        onChanged: (exteriordefectsdoorsvalue) {
          setState(() {
            this.exteriordefectsdoorsvalue = exteriordefectsdoorsvalue!;
            //print(personsinattendance);
          });
        },
      );
    }
  }

  exteriordefectswindowsCheck() {
    if (exteriordefectswindows == "Defects/Safety Hazards found were") {
      return DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text('Defects/Safety Hazards found were'),
        ),
        value: exteriordefectswindowsvalue,
        items: [
          DropdownMenuItem(
            child: Text('-Select-'),
            value: "NA",
          ),
          DropdownMenuItem(
            child:
                Text('Gaps around windows and brick\nwork needs to be sealed.'),
            value: "Gaps around windows and brick work needs to be sealed.",
          ),
          DropdownMenuItem(
            child: Text('Window is damaged.'),
            value: "Window is damaged.",
          ),
          DropdownMenuItem(
            child: Text('External window frame is damaged.'),
            value: "External window frame is damaged.",
          ),
          DropdownMenuItem(
            child: Text('Internal windowsill is damaged due\nto moisture.'),
            value: "Internal windowsill is damaged due to moisture.",
          ),
        ],
        onChanged: (exteriordefectswindowsvalue) {
          setState(() {
            this.exteriordefectswindowsvalue = exteriordefectswindowsvalue!;
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
      var res =
          await http.post(Uri.parse(API.prepurchasetheexteriordetails), body: {
        "id": id,
        //"exteriordefectswalls": wallsController.text.trim(),
        "exteriordefectswalls": exteriordefectswalls,
        "exteriordefectswallsvalue": exteriordefectswallsvalue,
        //"exteriordefectscladding": externalCladdingController.text.trim(),
        "exteriordefectscladding": exteriordefectscladding,
        "exteriordefectscladdingvalue": exteriordefectscladdingvalue,
        //"exteriordefectslintels": lintelsController.text.trim(),
        "exteriordefectslintels": exteriordefectslintels,
        //"exteriordefectsdoors": doorsController.text.trim(),
        "exteriordefectsdoors": exteriordefectsdoors,
        "exteriordefectsdoorsvalue": exteriordefectsdoorsvalue,
        //"exteriordefectswindows": windowsController.text.trim(),
        "exteriordefectswindows": exteriordefectswindows,
        "exteriordefectswindowsvalue": exteriordefectswindowsvalue,
        "wallsimagedata": wallsimageData,
        "wallsimagename": wallsimageName,
        "claddingimagedata": claddingimageData,
        "claddingimagename": claddingimageName,
        "lintelsimagedata": lintelsimageData,
        "lintelsimagename": lintelsimageName,
        "doorsimagedata": doorsimageData,
        "doorsimagename": doorsimageName,
        "windowsimagedata": windowsimageData,
        "windowsimagename": windowsimageName,
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        Navigator.of(context).pop();
        //print("Record Inserted");

        Fluttertoast.showToast(msg: "Record Inserted");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingInspectorTheExteriorStepTwoFragments(reportId: id)));
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
                'EXTERIOR OF THE BUILDING (STEP 1)',
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
            //Walls

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Walls'),
                ),
                value: exteriordefectswalls,
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
                onChanged: (exteriordefectswalls) {
                  setState(() {
                    this.exteriordefectswalls = exteriordefectswalls!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: exteriordefectswallsCheck(),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: wallsimagePath != "NA"
                  ? Image.memory(base64Decode(wallsimagePath))
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
                          wallscaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          wallsgetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),
            //External Cladding

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('External Cladding'),
                ),
                value: exteriordefectscladding,
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
                onChanged: (exteriordefectscladding) {
                  setState(() {
                    this.exteriordefectscladding = exteriordefectscladding!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: exteriordefectscladdingCheck(),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: claddingimagePath != "NA"
                  ? Image.memory(base64Decode(claddingimagePath))
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
                          claddingcaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          claddinggetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),
            //Lintels

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Lintels'),
                ),
                value: exteriordefectslintels,
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
                onChanged: (exteriordefectslintels) {
                  setState(() {
                    this.exteriordefectslintels = exteriordefectslintels!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: lintelsimagePath != "NA"
                  ? Image.memory(base64Decode(lintelsimagePath))
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
                          lintelscaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          lintelsgetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),
            //Doors

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Doors'),
                ),
                value: exteriordefectsdoors,
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
                onChanged: (exteriordefectsdoors) {
                  setState(() {
                    this.exteriordefectsdoors = exteriordefectsdoors!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: exteriordefectsdoorsCheck(),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: doorsimagePath != "NA"
                  ? Image.memory(base64Decode(doorsimagePath))
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
                          doorscaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          doorsgetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),
            //Windows

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Windows'),
                ),
                value: exteriordefectswindows,
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
                onChanged: (exteriordefectswindows) {
                  setState(() {
                    this.exteriordefectswindows = exteriordefectswindows!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: exteriordefectswindowsCheck(),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: windowsimagePath != "NA"
                  ? Image.memory(base64Decode(windowsimagePath))
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
                          windowscaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          windowsgetImage();
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
