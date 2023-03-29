import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../api_connection/api_connection.dart';
import 'package:http/http.dart' as http;

import 'building_inspection_the_exterior_fragments_screen.dart';

class BuildingInspectionTheSiteStepTwoFragments extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  BuildingInspectionTheSiteStepTwoFragments(
      {Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildingInspectionTheSiteStepTwoFragments> createState() =>
      _BuildingInspectionTheSiteStepTwoFragmentsState();
}

class _BuildingInspectionTheSiteStepTwoFragmentsState
    extends State<BuildingInspectionTheSiteStepTwoFragments> {
  TextEditingController drivewaysController = TextEditingController();
  TextEditingController pathsController = TextEditingController();
  TextEditingController stepsController = TextEditingController();
  TextEditingController retainingWallsController = TextEditingController();

  TextEditingController surfaceWaterDrainageController =
      TextEditingController();

  TextEditingController carAccommodationController = TextEditingController();

  TextEditingController detachedBuildingsController = TextEditingController();

  TextEditingController gardenShedsFencesController = TextEditingController();

  TextEditingController otherIfApplicableController = TextEditingController();

  File? imagePath;
  String? imageName;
  String? imageData;

  File? gardenimagePath;
  String? gardenimageName;
  String? gardenimageData;

  File? otherimagePath;
  String? otherimageName;
  String? otherimageData;

  ImagePicker imagePicker = ImagePicker();

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

  Future<void> gardengetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        gardenimagePath = File(getimage.path);
        gardenimageName = getimage.path.split('/').last;
        gardenimageData = base64Encode(gardenimagePath!.readAsBytesSync());
        print(gardenimagePath);
        print(gardenimageName);
        print(gardenimageData);
      }
    });
  }

  Future<void> gardencaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        gardenimagePath = File(getimage.path);
        gardenimageName = getimage.path.split('/').last;
        gardenimageData = base64Encode(gardenimagePath!.readAsBytesSync());
        print(gardenimagePath);
        print(gardenimageName);
        print(gardenimageData);
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
        otherimagePath = File(getimage.path);
        otherimageName = getimage.path.split('/').last;
        otherimageData = base64Encode(otherimagePath!.readAsBytesSync());
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
        otherimagePath = File(getimage.path);
        otherimageName = getimage.path.split('/').last;
        otherimageData = base64Encode(otherimagePath!.readAsBytesSync());
        print(otherimagePath);
        print(otherimageName);
        print(otherimageData);
      }
    });
  }

  Future<void> updateTheSiteDetails(String id) async {
    try {
      var res = await http
          .post(Uri.parse(API.prepurchasethesitesteptwodetails), body: {
        "id": id,
        "safetyhazardsbuildings": detachedBuildingsController.text.trim(),
        "safetyhazardsgarden": gardenShedsFencesController.text.trim(),
        "safetyhazardsother": otherIfApplicableController.text.trim(),
        "data": imageData,
        "name": imageName,
        "gardendata": gardenimageData,
        "gardenname": gardenimageName,
        "otherdata": otherimageData,
        "othername": otherimageName,
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        //print("Record Inserted");

        Fluttertoast.showToast(msg: "Record Inserted");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingInspectorTheExteriorFragments(reportId: id)));
        /*drivewaysController.clear();
        pathsController.clear();
        stepsController.clear();
        retainingWallsController.clear();
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
                'THE SITE (STEP 2)',
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
            //Detached Buildings
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: detachedBuildingsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Detached Buildings'),
                ),
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
            //Garden Sheds and Fences
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: gardenShedsFencesController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Garden Sheds and Fences'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: gardenimagePath != null
                  ? Image.file(gardenimagePath!)
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
                          gardencaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          gardengetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),
            //Other if Applicable
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: otherIfApplicableController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Other if Applicable'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: otherimagePath != null
                  ? Image.file(otherimagePath!)
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
                          updateTheSiteDetails(widget.reportId);
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
