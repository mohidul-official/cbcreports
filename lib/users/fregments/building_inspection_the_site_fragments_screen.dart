import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../api_connection/api_connection.dart';
import 'package:http/http.dart' as http;

//import 'building_inspection_the_exterior_fragments_screen.dart';
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

  var safetyhazardsdrivewaysimagepath = "NA";
  var safetyhazardsdrivewaysimagename = "NA";
  var safetyhazardsdrivewaysimagedata = "NA";

  /*File? safetyhazardsdrivewaysimagepath;
  String? safetyhazardsdrivewaysimagename;
  String? safetyhazardsdrivewaysimagedata;*/

  var safetyhazardspathsimagepath = "NA";
  var safetyhazardspathsimagename = "NA";
  var safetyhazardspathsimagedata = "NA";

  var safetyhazardsstepsimagepath = "NA";
  var safetyhazardsstepsimagename = "NA";
  var safetyhazardsstepsimagedata = "NA";

  var safetyhazardsretainingwallsimagepath = "NA";
  var safetyhazardsretainingwallsimagename = "NA";
  var safetyhazardsretainingwallsimagedata = "NA";

  var safetyhazardscaraccommodationimagepath = "NA";
  var safetyhazardscaraccommodationimagename = "NA";
  var safetyhazardscaraccommodationimagedata = "NA";

  var safetyhazardsdetachedbuildingsimagepath = "NA";
  var safetyhazardsdetachedbuildingsimagename = "NA";
  var safetyhazardsdetachedbuildingsimagedata = "NA";

  /*File? safetyhazardspathsimagepath;
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
  String? safetyhazardsdetachedbuildingsimagedata;*/

  var safetyhazardsdriveways = "NA";
  var safetyhazardsdrivewaysvalue = "NA";

  var safetyhazardspaths = "NA";
  var safetyhazardspathsvalue = "NA";

  var safetyhazardssteps = "NA";
  var safetyhazardsstepsvalue = "NA";

  var safetyhazardswalls = "NA";
  var safetyhazardswallsvalue = "NA";

  var safetyhazardswaterdrainage = "NA";
  var safetyhazardswaterdrainagevalue = "NA";

  var safetyhazardscar = "NA";

  ImagePicker imagePicker = ImagePicker();

  Future<void> getImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File safetyhazardsdrivewaysimagepath = File(getimage.path);
        safetyhazardsdrivewaysimagename = getimage.path.split('/').last;
        safetyhazardsdrivewaysimagedata =
            base64Encode(safetyhazardsdrivewaysimagepath.readAsBytesSync());
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
        File safetyhazardsdrivewaysimagepath = File(getimage.path);
        safetyhazardsdrivewaysimagename = getimage.path.split('/').last;
        safetyhazardsdrivewaysimagedata =
            base64Encode(safetyhazardsdrivewaysimagepath.readAsBytesSync());
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
        File safetyhazardspathsimagepath = File(getimage.path);
        safetyhazardspathsimagename = getimage.path.split('/').last;
        safetyhazardspathsimagedata =
            base64Encode(safetyhazardspathsimagepath.readAsBytesSync());
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
        File safetyhazardspathsimagepath = File(getimage.path);
        safetyhazardspathsimagename = getimage.path.split('/').last;
        safetyhazardspathsimagedata =
            base64Encode(safetyhazardspathsimagepath.readAsBytesSync());
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
        File safetyhazardsstepsimagepath = File(getimage.path);
        safetyhazardsstepsimagename = getimage.path.split('/').last;
        safetyhazardsstepsimagedata =
            base64Encode(safetyhazardsstepsimagepath.readAsBytesSync());
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
        File safetyhazardsstepsimagepath = File(getimage.path);
        safetyhazardsstepsimagename = getimage.path.split('/').last;
        safetyhazardsstepsimagedata =
            base64Encode(safetyhazardsstepsimagepath.readAsBytesSync());
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
        File safetyhazardsretainingwallsimagepath = File(getimage.path);
        safetyhazardsretainingwallsimagename = getimage.path.split('/').last;
        safetyhazardsretainingwallsimagedata = base64Encode(
            safetyhazardsretainingwallsimagepath.readAsBytesSync());
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
        File safetyhazardsretainingwallsimagepath = File(getimage.path);
        safetyhazardsretainingwallsimagename = getimage.path.split('/').last;
        safetyhazardsretainingwallsimagedata = base64Encode(
            safetyhazardsretainingwallsimagepath.readAsBytesSync());
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
        File safetyhazardscaraccommodationimagepath = File(getimage.path);
        safetyhazardscaraccommodationimagename = getimage.path.split('/').last;
        safetyhazardscaraccommodationimagedata = base64Encode(
            safetyhazardscaraccommodationimagepath.readAsBytesSync());
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
        File safetyhazardscaraccommodationimagepath = File(getimage.path);
        safetyhazardscaraccommodationimagename = getimage.path.split('/').last;
        safetyhazardscaraccommodationimagedata = base64Encode(
            safetyhazardscaraccommodationimagepath.readAsBytesSync());
        print(safetyhazardscaraccommodationimagepath);
        print(safetyhazardscaraccommodationimagename);
        print(safetyhazardscaraccommodationimagedata);
      }
    });
  }

  safetyhazardsdrivewaysCheck() {
    if (safetyhazardsdriveways == "Defects/Safety Hazards found were") {
      setState(() {
        safetyhazardsdrivewaysvalue =
            "Movement Cracking to driveway was observed. This does not have any impact on the building.";
      });

      return Text(
          'Movement Cracking to driveway was observed. This does not have any impact on the building.');
    } else {
      setState(() {
        safetyhazardsdrivewaysvalue = " ";
      });
    }
  }

  safetyhazardspathsCheck() {
    if (safetyhazardspaths == "Defects/Safety Hazards found were") {
      setState(() {
        safetyhazardspathsvalue =
            "Gaps were found between brickwork and concreting due to lose soil under the concrete. It is recommended to contact a certified concreter for further advise.";
      });

      return Text(
          'Gaps were found between brickwork and concreting due to lose soil under the concrete. It is recommended to contact a certified concreter for further advise.');
    } else {
      setState(() {
        safetyhazardspathsvalue = " ";
      });
    }
  }

  safetyhazardsstepsCheck() {
    if (safetyhazardssteps == "Defects/Safety Hazards found were") {
      setState(() {
        safetyhazardsstepsvalue =
            "Cracking to steps found due to General movement.";
      });

      return Text('Cracking to steps found due to General movement.');
    } else {
      setState(() {
        safetyhazardsstepsvalue = " ";
      });
    }
  }

  safetyhazardswallsCheck() {
    if (safetyhazardswalls == "Defects/Safety Hazards found were") {
      setState(() {
        safetyhazardswallsvalue =
            "Retaining wall was weathered. It is recommended to contact a certified carpenter for further advise.";
      });

      return Text(
          'Retaining wall was weathered. It is recommended to contact a certified carpenter for further advise.');
    } else {
      setState(() {
        safetyhazardswallsvalue = " ";
      });
    }
  }

  safetyhazardswaterdrainageCheck() {
    if (safetyhazardswaterdrainage == "Defects/Safety Hazards found were") {
      return DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text('Defects/Safety Hazards found were'),
        ),
        value: safetyhazardswaterdrainagevalue,
        items: [
          DropdownMenuItem(
            child: Text('-Select-'),
            value: "NA",
          ),
          DropdownMenuItem(
            child: Text(
                'Natural slope of the ground is towards \nthe dwelling. It is recommended to contact\n a licensed plumber to install adequate\n drainage.\n'),
            value:
                "Natural slope of the ground is towards the dwelling. It is recommended to contact a licensed plumber to install adequate drainage.",
          ),
          DropdownMenuItem(
            child: Text(
                'Natural slope of the ground is towards \nthe dwelling. It is recommended to make\n sure that slope must be going away \nfrom the dwelling.'),
            value:
                "Natural slope of the ground is towards the dwelling. It is recommended to make sure that slope must be going away from the dwelling.",
          ),
        ],
        onChanged: (safetyhazardswaterdrainagevalue) {
          setState(() {
            this.safetyhazardswaterdrainagevalue =
                safetyhazardswaterdrainagevalue!;
            //print(personsinattendance);
          });
        },
      );
    }
  }

  Future<void> updateTheSiteDetails(String id) async {
    try {
      showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        },
      );
      var res =
          await http.post(Uri.parse(API.prepurchasethesitedetails), body: {
        "id": id,
        //"safetyhazardsdriveways": drivewaysController.text.trim(),
        "safetyhazardsdriveways": safetyhazardsdriveways,
        "safetyhazardsdrivewaysvalue": safetyhazardsdrivewaysvalue,
        //"safetyhazardspaths": pathsController.text.trim(),
        "safetyhazardspaths": safetyhazardspaths,
        "safetyhazardspathsvalue": safetyhazardspathsvalue,
        //"safetyhazardssteps": stepsController.text.trim(),
        "safetyhazardssteps": safetyhazardssteps,
        "safetyhazardsstepsvalue": safetyhazardsstepsvalue,
        //"safetyhazardswalls": retainingWallsController.text.trim(),
        "safetyhazardswalls": safetyhazardswalls,
        "safetyhazardswallsvalue": safetyhazardswallsvalue,
        /*"safetyhazardswaterdrainage":
            surfaceWaterDrainageController.text.trim(),*/
        "safetyhazardswaterdrainage": safetyhazardswaterdrainage,
        "safetyhazardswaterdrainagevalue": safetyhazardswaterdrainagevalue,
        //"safetyhazardscar": carAccommodationController.text.trim(),
        "safetyhazardscar": safetyhazardscar,
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
        Navigator.of(context).pop();
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
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Driveways'),
                ),
                value: safetyhazardsdriveways,
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
                onChanged: (safetyhazardsdriveways) {
                  setState(() {
                    this.safetyhazardsdriveways = safetyhazardsdriveways!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: safetyhazardsdrivewaysCheck(),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: safetyhazardsdrivewaysimagepath != "NA"
                  ? Image.memory(base64Decode(safetyhazardsdrivewaysimagedata))
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
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Paths'),
                ),
                value: safetyhazardspaths,
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
                onChanged: (safetyhazardspaths) {
                  setState(() {
                    this.safetyhazardspaths = safetyhazardspaths!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: safetyhazardspathsCheck(),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: safetyhazardspathsimagepath != "NA"
                  ? Image.memory(base64Decode(safetyhazardspathsimagepath))
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
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Steps'),
                ),
                value: safetyhazardssteps,
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
                onChanged: (safetyhazardssteps) {
                  setState(() {
                    this.safetyhazardssteps = safetyhazardssteps!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: safetyhazardsstepsCheck(),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: safetyhazardsstepsimagepath != "NA"
                  ? Image.memory(base64Decode(safetyhazardsstepsimagepath))
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
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Retaining Walls'),
                ),
                value: safetyhazardswalls,
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
                onChanged: (safetyhazardswalls) {
                  setState(() {
                    this.safetyhazardswalls = safetyhazardswalls!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: safetyhazardswallsCheck(),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: safetyhazardsretainingwallsimagepath != "NA"
                  ? Image.memory(
                      base64Decode(safetyhazardsretainingwallsimagepath))
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
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Surface Water Drainage'),
                ),
                value: safetyhazardswaterdrainage,
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
                onChanged: (safetyhazardswaterdrainage) {
                  setState(() {
                    this.safetyhazardswaterdrainage =
                        safetyhazardswaterdrainage!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: safetyhazardswaterdrainageCheck(),
            ),
            //Car Accommodation

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Car Accommodation'),
                ),
                value: safetyhazardscar,
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
                onChanged: (safetyhazardscar) {
                  setState(() {
                    this.safetyhazardscar = safetyhazardscar!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: safetyhazardscaraccommodationimagepath != "NA"
                  ? Image.memory(
                      base64Decode(safetyhazardscaraccommodationimagepath))
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
