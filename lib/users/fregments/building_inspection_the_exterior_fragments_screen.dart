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
  TextEditingController wallsController = TextEditingController();
  TextEditingController externalCladdingController = TextEditingController();
  TextEditingController lintelsController = TextEditingController();
  TextEditingController doorsController = TextEditingController();

  TextEditingController windowsController = TextEditingController();

  File? wallsimagePath;
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
  String? windowsimageData;

  ImagePicker imagePicker = ImagePicker();

  Future<void> wallsgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        wallsimagePath = File(getimage.path);
        wallsimageName = getimage.path.split('/').last;
        wallsimageData = base64Encode(wallsimagePath!.readAsBytesSync());
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
        wallsimagePath = File(getimage.path);
        wallsimageName = getimage.path.split('/').last;
        wallsimageData = base64Encode(wallsimagePath!.readAsBytesSync());
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
        claddingimagePath = File(getimage.path);
        claddingimageName = getimage.path.split('/').last;
        claddingimageData = base64Encode(claddingimagePath!.readAsBytesSync());
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
        claddingimagePath = File(getimage.path);
        claddingimageName = getimage.path.split('/').last;
        claddingimageData = base64Encode(claddingimagePath!.readAsBytesSync());
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
        lintelsimagePath = File(getimage.path);
        lintelsimageName = getimage.path.split('/').last;
        lintelsimageData = base64Encode(lintelsimagePath!.readAsBytesSync());
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
        lintelsimagePath = File(getimage.path);
        lintelsimageName = getimage.path.split('/').last;
        lintelsimageData = base64Encode(lintelsimagePath!.readAsBytesSync());
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
        doorsimagePath = File(getimage.path);
        doorsimageName = getimage.path.split('/').last;
        doorsimageData = base64Encode(doorsimagePath!.readAsBytesSync());
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
        doorsimagePath = File(getimage.path);
        doorsimageName = getimage.path.split('/').last;
        doorsimageData = base64Encode(doorsimagePath!.readAsBytesSync());
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
        windowsimagePath = File(getimage.path);
        windowsimageName = getimage.path.split('/').last;
        windowsimageData = base64Encode(windowsimagePath!.readAsBytesSync());
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
        windowsimagePath = File(getimage.path);
        windowsimageName = getimage.path.split('/').last;
        windowsimageData = base64Encode(windowsimagePath!.readAsBytesSync());
        print(windowsimagePath);
        print(windowsimageName);
        print(windowsimageData);
      }
    });
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
        "exteriordefectswalls": wallsController.text.trim(),
        "exteriordefectscladding": externalCladdingController.text.trim(),
        "exteriordefectslintels": lintelsController.text.trim(),
        "exteriordefectsdoors": doorsController.text.trim(),
        "exteriordefectswindows": windowsController.text.trim(),
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
        /*wallsController.clear();
        externalCladdingController.clear();
        lintelsController.clear();
        doorsController.clear();
        piersCommentsController.clear();
        flooringCommentsController.clear();*/
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
              child: TextFormField(
                controller: wallsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Walls'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: wallsimagePath != null
                  ? Image.file(wallsimagePath!)
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
              child: TextFormField(
                controller: externalCladdingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('External Cladding'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: claddingimagePath != null
                  ? Image.file(claddingimagePath!)
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
              child: TextFormField(
                controller: lintelsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Lintels'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: lintelsimagePath != null
                  ? Image.file(lintelsimagePath!)
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
              child: TextFormField(
                controller: doorsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Doors'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: doorsimagePath != null
                  ? Image.file(doorsimagePath!)
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
              child: TextFormField(
                controller: windowsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Windows'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: windowsimagePath != null
                  ? Image.file(windowsimagePath!)
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
