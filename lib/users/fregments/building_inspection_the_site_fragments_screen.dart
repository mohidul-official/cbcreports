import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../api_connection/api_connection.dart';
import 'package:http/http.dart' as http;

import 'building_inspection_the_exterior_fragments_screen.dart';
import 'building_inspection_the_site_step_two_fragments_screen.dart';

class BuildingInspectionTheSiteFragments extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  BuildingInspectionTheSiteFragments({Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildingInspectionTheSiteFragments> createState() =>
      _BuildingInspectionTheSiteFragmentsState();
}

class _BuildingInspectionTheSiteFragmentsState
    extends State<BuildingInspectionTheSiteFragments> {
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

  File? safetyhazardsdrivewaysimagepath;
  String? safetyhazardsdrivewaysimagename;
  String? safetyhazardsdrivewaysimagedata;

  File? safetyhazardspathsimagepath;
  String? safetyhazardspathsimagename;
  String? safetyhazardspathsimagedata;

  File? safetyhazardsstepsimagepath;
  String? safetyhazardsstepsimagename;
  String? safetyhazardsstepsimagedata;

  File? safetyhazardsretainingwallsimagepath;
  String? safetyhazardsretainingwallsimagename;
  String? safetyhazardsretainingwallsimagedata;

  File? safetyhazardscaraccommodationimagepath;
  String? safetyhazardscaraccommodationimagename;
  String? safetyhazardscaraccommodationimagedata;

  File? safetyhazardsdetachedbuildingsimagepath;
  String? safetyhazardsdetachedbuildingsimagename;
  String? safetyhazardsdetachedbuildingsimagedata;

  ImagePicker imagePicker = ImagePicker();

  Future<void> getImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        safetyhazardsdrivewaysimagepath = File(getimage.path);
        safetyhazardsdrivewaysimagename = getimage.path.split('/').last;
        safetyhazardsdrivewaysimagedata =
            base64Encode(safetyhazardsdrivewaysimagepath!.readAsBytesSync());
        print(safetyhazardsdrivewaysimagepath);
        print(safetyhazardsdrivewaysimagename);
        print(safetyhazardsdrivewaysimagedata);
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
        safetyhazardsdrivewaysimagepath = File(getimage.path);
        safetyhazardsdrivewaysimagename = getimage.path.split('/').last;
        safetyhazardsdrivewaysimagedata =
            base64Encode(safetyhazardsdrivewaysimagepath!.readAsBytesSync());
        print(safetyhazardsdrivewaysimagepath);
        print(safetyhazardsdrivewaysimagename);
        print(safetyhazardsdrivewaysimagedata);
      }
    });
  }

  Future<void> safetyhazardsPathsGetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        safetyhazardspathsimagepath = File(getimage.path);
        safetyhazardspathsimagename = getimage.path.split('/').last;
        safetyhazardspathsimagedata =
            base64Encode(safetyhazardspathsimagepath!.readAsBytesSync());
        print(safetyhazardspathsimagepath);
        print(safetyhazardspathsimagename);
        print(safetyhazardspathsimagedata);
      }
    });
  }

  Future<void> safetyhazardsPathsCaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        safetyhazardspathsimagepath = File(getimage.path);
        safetyhazardspathsimagename = getimage.path.split('/').last;
        safetyhazardspathsimagedata =
            base64Encode(safetyhazardspathsimagepath!.readAsBytesSync());
        print(safetyhazardspathsimagepath);
        print(safetyhazardspathsimagename);
        print(safetyhazardspathsimagedata);
      }
    });
  }

  Future<void> safetyhazardsStepsGetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        safetyhazardsstepsimagepath = File(getimage.path);
        safetyhazardsstepsimagename = getimage.path.split('/').last;
        safetyhazardsstepsimagedata =
            base64Encode(safetyhazardsstepsimagepath!.readAsBytesSync());
        print(safetyhazardsstepsimagepath);
        print(safetyhazardsstepsimagename);
        print(safetyhazardsstepsimagedata);
      }
    });
  }

  Future<void> safetyhazardsStepsCaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        safetyhazardsstepsimagepath = File(getimage.path);
        safetyhazardsstepsimagename = getimage.path.split('/').last;
        safetyhazardsstepsimagedata =
            base64Encode(safetyhazardsstepsimagepath!.readAsBytesSync());
        print(safetyhazardsstepsimagepath);
        print(safetyhazardsstepsimagename);
        print(safetyhazardsstepsimagedata);
      }
    });
  }

  Future<void> safetyhazardsretainingWallsGetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        safetyhazardsretainingwallsimagepath = File(getimage.path);
        safetyhazardsretainingwallsimagename = getimage.path.split('/').last;
        safetyhazardsretainingwallsimagedata = base64Encode(
            safetyhazardsretainingwallsimagepath!.readAsBytesSync());
        print(safetyhazardsretainingwallsimagepath);
        print(safetyhazardsretainingwallsimagename);
        print(safetyhazardsretainingwallsimagedata);
      }
    });
  }

  Future<void> safetyhazardsretainingWallsCaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        safetyhazardsretainingwallsimagepath = File(getimage.path);
        safetyhazardsretainingwallsimagename = getimage.path.split('/').last;
        safetyhazardsretainingwallsimagedata = base64Encode(
            safetyhazardsretainingwallsimagepath!.readAsBytesSync());
        print(safetyhazardsretainingwallsimagepath);
        print(safetyhazardsretainingwallsimagename);
        print(safetyhazardsretainingwallsimagedata);
      }
    });
  }

  Future<void> safetyhazardscarAccommodationGetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        safetyhazardscaraccommodationimagepath = File(getimage.path);
        safetyhazardscaraccommodationimagename = getimage.path.split('/').last;
        safetyhazardscaraccommodationimagedata = base64Encode(
            safetyhazardscaraccommodationimagepath!.readAsBytesSync());
        print(safetyhazardscaraccommodationimagepath);
        print(safetyhazardscaraccommodationimagename);
        print(safetyhazardscaraccommodationimagedata);
      }
    });
  }

  Future<void> safetyhazardscarAccommodationCaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        safetyhazardscaraccommodationimagepath = File(getimage.path);
        safetyhazardscaraccommodationimagename = getimage.path.split('/').last;
        safetyhazardscaraccommodationimagedata = base64Encode(
            safetyhazardscaraccommodationimagepath!.readAsBytesSync());
        print(safetyhazardscaraccommodationimagepath);
        print(safetyhazardscaraccommodationimagename);
        print(safetyhazardscaraccommodationimagedata);
      }
    });
  }

  Future<void> updateTheSiteDetails(String id) async {
    try {
      var res =
          await http.post(Uri.parse(API.prepurchasethesitedetails), body: {
        "id": id,
        "safetyhazardsdriveways": drivewaysController.text.trim(),
        "safetyhazardspaths": pathsController.text.trim(),
        "safetyhazardssteps": stepsController.text.trim(),
        "safetyhazardswalls": retainingWallsController.text.trim(),
        "safetyhazardswaterdrainage":
            surfaceWaterDrainageController.text.trim(),
        "safetyhazardscar": carAccommodationController.text.trim(),
        "safetyhazardsdrivewaysimagedata": safetyhazardsdrivewaysimagedata,
        "safetyhazardsdrivewaysimagename": safetyhazardsdrivewaysimagename,
        "safetyhazardspathsimagedata": safetyhazardspathsimagedata,
        "safetyhazardspathsimagename": safetyhazardspathsimagename,
        "safetyhazardsstepsimagedata": safetyhazardsstepsimagedata,
        "safetyhazardsstepsimagename": safetyhazardsstepsimagename,
        "safetyhazardsretainingwallsimagedata":
            safetyhazardsretainingwallsimagedata,
        "safetyhazardsretainingwallsimagename":
            safetyhazardsretainingwallsimagename,
        "safetyhazardscaraccommodationimagedata":
            safetyhazardscaraccommodationimagedata,
        "safetyhazardscaraccommodationimagename":
            safetyhazardscaraccommodationimagename,
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        //print("Record Inserted");

        Fluttertoast.showToast(msg: "Record Inserted");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingInspectionTheSiteStepTwoFragments(reportId: id)));
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
                'THE SITE (STEP 1)',
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
            //Driveways
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: drivewaysController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Driveways'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: safetyhazardsdrivewaysimagepath != null
                  ? Image.file(safetyhazardsdrivewaysimagepath!)
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
            //Paths
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: pathsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Paths'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: safetyhazardspathsimagepath != null
                  ? Image.file(safetyhazardspathsimagepath!)
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
                          safetyhazardsPathsCaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          safetyhazardsPathsGetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),
            //Steps
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: stepsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Steps'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: safetyhazardsstepsimagepath != null
                  ? Image.file(safetyhazardsstepsimagepath!)
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
                          safetyhazardsStepsCaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          safetyhazardsStepsGetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),
            //Retaining Walls
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: retainingWallsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Retaining Walls'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: safetyhazardsretainingwallsimagepath != null
                  ? Image.file(safetyhazardsretainingwallsimagepath!)
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
                          safetyhazardsretainingWallsCaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          safetyhazardsretainingWallsGetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),
            //Surface Water Drainage
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: surfaceWaterDrainageController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Surface Water Drainage'),
                ),
              ),
            ),
            //Car Accommodation
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: carAccommodationController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Car Accommodation'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: safetyhazardscaraccommodationimagepath != null
                  ? Image.file(safetyhazardscaraccommodationimagepath!)
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
                          safetyhazardscarAccommodationCaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          safetyhazardscarAccommodationGetImage();
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
