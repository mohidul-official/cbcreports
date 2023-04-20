import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../api_connection/api_connection.dart';
import 'package:http/http.dart' as http;

import 'building_inspection_the_roof_interior_fragments_screen.dart';

class BuildingInspectionTheInteriorStepThreeFragments extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  BuildingInspectionTheInteriorStepThreeFragments(
      {Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildingInspectionTheInteriorStepThreeFragments> createState() =>
      _BuildingInspectionTheInteriorStepThreeFragmentsState();
}

class _BuildingInspectionTheInteriorStepThreeFragmentsState
    extends State<BuildingInspectionTheInteriorStepThreeFragments> {
  var interiordefectsbathroom = "NA";
  var interiordefectsbathroomvalue = "NA";

  var interiordefectsensuite = "NA";
  var interiordefectsensuitevalue = "NA";

  var interiordefectsbedroomone = "NA";

  var interiordefectsbedroomtwo = "NA";

  var interiordefectsbedroomthree = "NA";

  var interiordefectsbedroomfour = "NA";

  var interiordefectsother = "NA";
  var interiordefectsothervalue = "NA";

  var interiordefectsgarage = "NA";
  var interiordefectsgaragevalue = "NA";

  var interiordefectsbathroomimagePath = "NA";
  var interiordefectsbathroomimageName = "NA";
  var interiordefectsbathroomimageData = "NA";

  var interiordefectsensuiteimagePath = "NA";
  var interiordefectsensuiteimageName = "NA";
  var interiordefectsensuiteimageData = "NA";

  var imagePath = "NA";
  var imageName = "NA";
  var imageData = "NA";

  var interiordefectsbedroomtwoimagePath = "NA";
  var interiordefectsbedroomtwoimageName = "NA";
  var interiordefectsbedroomtwoimageData = "NA";

  var interiordefectsbedroomthreeimagePath = "NA";
  var interiordefectsbedroomthreeimageName = "NA";
  var interiordefectsbedroomthreeimageData = "NA";

  var interiordefectsbedroomfourimagePath = "NA";
  var interiordefectsbedroomfourimageName = "NA";
  var interiordefectsbedroomfourimageData = "NA";

  var interiordefectsotherimagePath = "NA";
  var interiordefectsotherimageName = "NA";
  var interiordefectsotherimageData = "NA";

  var interiordefectsgarageimagePath = "NA";
  var interiordefectsgarageimageName = "NA";
  var interiordefectsgarageimageData = "NA";

  ImagePicker imagePicker = ImagePicker();

  Future<void> interiordefectsbathroomgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File interiordefectsbathroomimagePath = File(getimage.path);

        interiordefectsbathroomimageName = getimage.path.split('/').last;
        interiordefectsbathroomimageData =
            base64Encode(interiordefectsbathroomimagePath.readAsBytesSync());

        print(interiordefectsbathroomimagePath);
        print(interiordefectsbathroomimageName);
        print(interiordefectsbathroomimageData);
      }
    });
  }

  Future<void> interiordefectsbathroomcaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File interiordefectsbathroomimagePath = File(getimage.path);

        interiordefectsbathroomimageName = getimage.path.split('/').last;
        interiordefectsbathroomimageData =
            base64Encode(interiordefectsbathroomimagePath.readAsBytesSync());

        print(interiordefectsbathroomimagePath);
        print(interiordefectsbathroomimageName);
        print(interiordefectsbathroomimageData);
      }
    });
  }

  Future<void> interiordefectsensuitegetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File interiordefectsensuiteimagePath = File(getimage.path);

        interiordefectsensuiteimageName = getimage.path.split('/').last;
        interiordefectsensuiteimageData =
            base64Encode(interiordefectsensuiteimagePath.readAsBytesSync());

        print(interiordefectsensuiteimagePath);
        print(interiordefectsensuiteimageName);
        print(interiordefectsensuiteimageData);
      }
    });
  }

  Future<void> interiordefectsensuitecaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File interiordefectsensuiteimagePath = File(getimage.path);

        interiordefectsensuiteimageName = getimage.path.split('/').last;
        interiordefectsensuiteimageData =
            base64Encode(interiordefectsensuiteimagePath.readAsBytesSync());

        print(interiordefectsensuiteimagePath);
        print(interiordefectsensuiteimageName);
        print(interiordefectsensuiteimageData);
      }
    });
  }

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

  Future<void> interiordefectsbedroomtwogetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File interiordefectsbedroomtwoimagePath = File(getimage.path);

        interiordefectsbedroomtwoimageName = getimage.path.split('/').last;
        interiordefectsbedroomtwoimageData =
            base64Encode(interiordefectsbedroomtwoimagePath.readAsBytesSync());

        print(interiordefectsbedroomtwoimagePath);
        print(interiordefectsbedroomtwoimageName);
        print(interiordefectsbedroomtwoimageData);
      }
    });
  }

  Future<void> interiordefectsbedroomtwocaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File interiordefectsbedroomtwoimagePath = File(getimage.path);

        interiordefectsbedroomtwoimageName = getimage.path.split('/').last;
        interiordefectsbedroomtwoimageData =
            base64Encode(interiordefectsbedroomtwoimagePath.readAsBytesSync());

        print(interiordefectsbedroomtwoimagePath);
        print(interiordefectsbedroomtwoimageName);
        print(interiordefectsbedroomtwoimageData);
      }
    });
  }

  Future<void> interiordefectsbedroomthreegetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File interiordefectsbedroomthreeimagePath = File(getimage.path);

        interiordefectsbedroomthreeimageName = getimage.path.split('/').last;
        interiordefectsbedroomthreeimageData = base64Encode(
            interiordefectsbedroomthreeimagePath.readAsBytesSync());

        print(interiordefectsbedroomthreeimagePath);
        print(interiordefectsbedroomthreeimageName);
        print(interiordefectsbedroomthreeimageData);
      }
    });
  }

  Future<void> interiordefectsbedroomthreecaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File interiordefectsbedroomthreeimagePath = File(getimage.path);
        interiordefectsbedroomthreeimageName = getimage.path.split('/').last;
        interiordefectsbedroomthreeimageData = base64Encode(
            interiordefectsbedroomthreeimagePath.readAsBytesSync());

        print(interiordefectsbedroomthreeimagePath);
        print(interiordefectsbedroomthreeimageName);
        print(interiordefectsbedroomthreeimageData);
      }
    });
  }

  Future<void> interiordefectsbedroomfourgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File interiordefectsbedroomfourimagePath = File(getimage.path);

        interiordefectsbedroomfourimageName = getimage.path.split('/').last;
        interiordefectsbedroomfourimageData =
            base64Encode(interiordefectsbedroomfourimagePath.readAsBytesSync());

        print(interiordefectsbedroomfourimagePath);
        print(interiordefectsbedroomfourimageName);
        print(interiordefectsbedroomfourimageData);
      }
    });
  }

  Future<void> interiordefectsbedroomfourcaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File interiordefectsbedroomfourimagePath = File(getimage.path);

        interiordefectsbedroomfourimageName = getimage.path.split('/').last;
        interiordefectsbedroomfourimageData =
            base64Encode(interiordefectsbedroomfourimagePath.readAsBytesSync());

        print(interiordefectsbedroomfourimagePath);
        print(interiordefectsbedroomfourimageName);
        print(interiordefectsbedroomfourimageData);
      }
    });
  }

  Future<void> interiordefectsothergetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File interiordefectsotherimagePath = File(getimage.path);

        interiordefectsotherimageName = getimage.path.split('/').last;
        interiordefectsotherimageData =
            base64Encode(interiordefectsotherimagePath.readAsBytesSync());

        print(interiordefectsotherimagePath);
        print(interiordefectsotherimageName);
        print(interiordefectsotherimageData);
      }
    });
  }

  Future<void> interiordefectsothercaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File interiordefectsotherimagePath = File(getimage.path);

        interiordefectsotherimageName = getimage.path.split('/').last;
        interiordefectsotherimageData =
            base64Encode(interiordefectsotherimagePath.readAsBytesSync());

        print(interiordefectsotherimagePath);
        print(interiordefectsotherimageName);
        print(interiordefectsotherimageData);
      }
    });
  }

  Future<void> interiordefectsgaragegetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File interiordefectsgarageimagePath = File(getimage.path);

        interiordefectsgarageimageName = getimage.path.split('/').last;
        interiordefectsgarageimageData =
            base64Encode(interiordefectsgarageimagePath.readAsBytesSync());

        print(interiordefectsgarageimagePath);
        print(interiordefectsgarageimageName);
        print(interiordefectsgarageimageData);
      }
    });
  }

  Future<void> interiordefectsgaragecaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File interiordefectsgarageimagePath = File(getimage.path);

        interiordefectsgarageimageName = getimage.path.split('/').last;
        interiordefectsgarageimageData =
            base64Encode(interiordefectsgarageimagePath.readAsBytesSync());

        print(interiordefectsgarageimagePath);
        print(interiordefectsgarageimageName);
        print(interiordefectsgarageimageData);
      }
    });
  }

  interiordefectsbathroomCheck() {
    if (interiordefectsbathroom == "Defects/Safety Hazards found were") {
      return DropdownButtonFormField(
        isExpanded: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text('Defects/Safety Hazards found were'),
        ),
        value: interiordefectsbathroomvalue,
        items: [
          DropdownMenuItem(
            child: Text('-Select-'),
            value: "NA",
          ),
          DropdownMenuItem(
            child: Text(
                'Damage to grout was found. Visual signs of moisture can be seen, and it is confirmed on moisture meter as well. It is recommended to contact a certified tiler and plumber for further advice.\n'),
            value:
                "Damage to grout was found. Visual signs of moisture can be seen, and it is confirmed on moisture meter as well. It is recommended to contact a certified tiler and plumber for further advice.",
          ),
          DropdownMenuItem(
            child: Text(
                'Damage to grout was found. But there were no signs of moisture, and nothing came up on moisture meter.\n'),
            value:
                "Damage to grout was found. But there were no signs of moisture, and nothing came up on moisture meter.",
          ),
          DropdownMenuItem(
            child: Text(
                'Damage to grout was found. But there were no signs of moisture, and nothing came up on moisture meter. It must be remembered that dwelling was unoccupied at the time of inspection. If any moisture conditions develop in future, A licensed plumber must be contacted.'),
            value:
                "Damage to grout was found. But there were no signs of moisture, and nothing came up on moisture meter. It must be remembered that dwelling was unoccupied at the time of inspection. If any moisture conditions develop in future, A licensed plumber must be contacted.",
          ),
        ],
        onChanged: (interiordefectsbathroomvalue) {
          setState(() {
            this.interiordefectsbathroomvalue = interiordefectsbathroomvalue!;
            //print(personsinattendance);
          });
        },
      );
    }
  }

  interiordefectsensuiteCheck() {
    if (interiordefectsensuite == "Defects/Safety Hazards found were") {
      return DropdownButtonFormField(
        isExpanded: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text('Defects/Safety Hazards found were'),
        ),
        value: interiordefectsensuitevalue,
        items: [
          DropdownMenuItem(
            child: Text('-Select-'),
            value: "NA",
          ),
          DropdownMenuItem(
            child: Text(
                'Damage to grout was found. Visual signs of moisture can be seen, and it is confirmed on moisture meter as well. It is recommended to contact a certified tiler and plumber for further advice.\n'),
            value:
                "Damage to grout was found. Visual signs of moisture can be seen, and it is confirmed on moisture meter as well. It is recommended to contact a certified tiler and plumber for further advice.",
          ),
          DropdownMenuItem(
            child: Text(
                'Damage to grout was found. But there were no signs of moisture, and nothing came up on moisture meter.\n'),
            value:
                "Damage to grout was found. But there were no signs of moisture, and nothing came up on moisture meter.",
          ),
          DropdownMenuItem(
            child: Text(
                'Damage to grout was found. But there were no signs of moisture, and nothing came up on moisture meter. It must be remembered that dwelling was unoccupied at the time of inspection. If any moisture conditions develop in future, A licensed plumber must be contacted.'),
            value:
                "Damage to grout was found. But there were no signs of moisture, and nothing came up on moisture meter. It must be remembered that dwelling was unoccupied at the time of inspection. If any moisture conditions develop in future, A licensed plumber must be contacted.",
          ),
        ],
        onChanged: (interiordefectsensuitevalue) {
          setState(() {
            this.interiordefectsensuitevalue = interiordefectsensuitevalue!;
            //print(personsinattendance);
          });
        },
      );
    }
  }

  interiordefectsotherCheck() {
    if (interiordefectsother == "Defects/Safety Hazards found were") {
      return DropdownButtonFormField(
        isExpanded: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text('Defects/Safety Hazards found were'),
        ),
        value: interiordefectsothervalue,
        items: [
          DropdownMenuItem(
            child: Text('-Select-'),
            value: "NA",
          ),
          DropdownMenuItem(
            child: Text(
                'Cracking to plaster can be seen throughout the dwelling.\n'),
            value: "Cracking to plaster can be seen throughout the dwelling.",
          ),
          DropdownMenuItem(
            child:
                Text('Cracking to tiles can be seen throughout the dwelling.'),
            value: "Cracking to tiles can be seen throughout the dwelling.",
          ),
        ],
        onChanged: (interiordefectsothervalue) {
          setState(() {
            this.interiordefectsothervalue = interiordefectsothervalue!;
            //print(personsinattendance);
          });
        },
      );
    }
  }

  interiordefectsgarageCheck() {
    if (interiordefectsgarage == "Defects/Safety Hazards found were") {
      setState(() {
        interiordefectsgaragevalue =
            "Garage was full of storage; A thorough inspection was not possible. There might be few issues which went unnoticed.";
      });

      return Text(
          'Garage was full of storage; A thorough inspection was not possible. There might be few issues which went unnoticed.');
    } else {
      setState(() {
        interiordefectsgaragevalue = " ";
      });
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
          .post(Uri.parse(API.prepurchasetheinteriorstepthreedetails), body: {
        "id": id,

        //"interiordefectsbathroom": bathroomController.text.trim(),
        "interiordefectsbathroom": interiordefectsbathroom,
        "interiordefectsbathroomvalue": interiordefectsbathroomvalue,
        //"interiordefectsensuite": enSuiteController.text.trim(),
        "interiordefectsensuite": interiordefectsensuite,
        "interiordefectsensuitevalue": interiordefectsensuitevalue,
        //"interiordefectsbedroomone": bedroomOneController.text.trim(),
        "interiordefectsbedroomone": interiordefectsbedroomone,
        //"interiordefectsbedroomtwo": bedroomTwoController.text.trim(),
        "interiordefectsbedroomtwo": interiordefectsbedroomtwo,
        //"interiordefectsbedroomthree": bedroomThreeController.text.trim(),
        "interiordefectsbedroomthree": interiordefectsbedroomthree,
        //"interiordefectsbedroomfour": bedroomFourController.text.trim(),
        "interiordefectsbedroomfour": interiordefectsbedroomfour,
        //"interiordefectsother": otherIfApplicableController.text.trim(),
        "interiordefectsother": interiordefectsother,
        "interiordefectsothervalue": interiordefectsothervalue,
        "interiordefectsgarage": interiordefectsgarage,
        "interiordefectsgaragevalue": interiordefectsgaragevalue,
        "interiordefectsbathroomimagedata": interiordefectsbathroomimageData,
        "interiordefectsbathroomimagename": interiordefectsbathroomimageName,
        "interiordefectsensuiteimagedata": interiordefectsensuiteimageData,
        "interiordefectsensuiteimagename": interiordefectsensuiteimageName,
        "data": imageData,
        "name": imageName,
        "interiordefectsbedroomtwoimagedata":
            interiordefectsbedroomtwoimageData,
        "interiordefectsbedroomtwoimagename":
            interiordefectsbedroomtwoimageName,
        "interiordefectsbedroomthreeimagedata":
            interiordefectsbedroomthreeimageData,
        "interiordefectsbedroomthreeimagename":
            interiordefectsbedroomthreeimageName,
        "interiordefectsbedroomfourimagedata":
            interiordefectsbedroomfourimageData,
        "interiordefectsbedroomfourimagename":
            interiordefectsbedroomfourimageName,
        "interiordefectsotherimagedata": interiordefectsotherimageData,
        "interiordefectsotherimagename": interiordefectsotherimageName,
        "interiordefectsgarageimagedata": interiordefectsgarageimageData,
        "interiordefectsgarageimagename": interiordefectsgarageimageName,
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        Navigator.of(context).pop();
        //print("Record Inserted");

        Fluttertoast.showToast(msg: "Record Inserted");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingInspectionTheRoofInteriorFragments(reportId: id)));
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
                'INTERIOR OF THE BUILDING (STEP 3)',
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

            //Study//Stairs//Laundry//Toilet//Bathroom

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Bathroom'),
                ),
                value: interiordefectsbathroom,
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
                onChanged: (interiordefectsbathroom) {
                  setState(() {
                    this.interiordefectsbathroom = interiordefectsbathroom!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: interiordefectsbathroomCheck(),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: interiordefectsbathroomimageData != "NA"
                  ? Image.memory(base64Decode(interiordefectsbathroomimageData))
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
                          interiordefectsbathroomcaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          interiordefectsbathroomgetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),
            //En-suite

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('En-suite'),
                ),
                value: interiordefectsensuite,
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
                onChanged: (interiordefectsensuite) {
                  setState(() {
                    this.interiordefectsensuite = interiordefectsensuite!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: interiordefectsensuiteCheck(),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: interiordefectsensuiteimageData != "NA"
                  ? Image.memory(base64Decode(interiordefectsensuiteimageData))
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
                          interiordefectsensuitecaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          interiordefectsensuitegetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),
            //Bedroom  1

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Bedroom 1'),
                ),
                value: interiordefectsbedroomone,
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
                onChanged: (interiordefectsbedroomone) {
                  setState(() {
                    this.interiordefectsbedroomone = interiordefectsbedroomone!;
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

            //Bedroom  2

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Bedroom 2'),
                ),
                value: interiordefectsbedroomtwo,
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
                onChanged: (interiordefectsbedroomtwo) {
                  setState(() {
                    this.interiordefectsbedroomtwo = interiordefectsbedroomtwo!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),

            Container(
              margin: EdgeInsets.all(10),
              child: interiordefectsbedroomtwoimageData != "NA"
                  ? Image.memory(
                      base64Decode(interiordefectsbedroomtwoimageData))
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
                          interiordefectsbedroomtwocaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          interiordefectsbedroomtwogetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),

            //Bedroom 3

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Bedroom 3'),
                ),
                value: interiordefectsbedroomthree,
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
                onChanged: (interiordefectsbedroomthree) {
                  setState(() {
                    this.interiordefectsbedroomthree =
                        interiordefectsbedroomthree!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),

            Container(
              margin: EdgeInsets.all(10),
              child: interiordefectsbedroomthreeimageData != "NA"
                  ? Image.memory(
                      base64Decode(interiordefectsbedroomthreeimageData))
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
                          interiordefectsbedroomthreecaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          interiordefectsbedroomthreegetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),

            //Bedroom 4

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Bedroom 4'),
                ),
                value: interiordefectsbedroomfour,
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
                onChanged: (interiordefectsbedroomfour) {
                  setState(() {
                    this.interiordefectsbedroomfour =
                        interiordefectsbedroomfour!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),

            Container(
              margin: EdgeInsets.all(10),
              child: interiordefectsbedroomfourimageData != "NA"
                  ? Image.memory(
                      base64Decode(interiordefectsbedroomfourimageData))
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
                          interiordefectsbedroomfourcaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          interiordefectsbedroomfourgetImage();
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
                value: interiordefectsother,
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
                onChanged: (interiordefectsother) {
                  setState(() {
                    this.interiordefectsother = interiordefectsother!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: interiordefectsotherCheck(),
            ),

            Container(
              margin: EdgeInsets.all(10),
              child: interiordefectsotherimageData != "NA"
                  ? Image.memory(base64Decode(interiordefectsotherimageData))
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
                          interiordefectsothercaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          interiordefectsothergetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),

            //Garage

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Garage'),
                ),
                value: interiordefectsgarage,
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
                onChanged: (interiordefectsgarage) {
                  setState(() {
                    this.interiordefectsgarage = interiordefectsgarage!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: interiordefectsgarageCheck(),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: interiordefectsgarageimageData != "NA"
                  ? Image.memory(base64Decode(interiordefectsgarageimageData))
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
                          interiordefectsgaragecaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          interiordefectsgaragegetImage();
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
