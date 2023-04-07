import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../api_connection/api_connection.dart';
import 'package:http/http.dart' as http;

import 'building_inspection_the_roof_interior_fragments_screen.dart';

class BuildingInspectionTheInteriorFragments extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  BuildingInspectionTheInteriorFragments({Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildingInspectionTheInteriorFragments> createState() =>
      _BuildingInspectionTheInteriorFragmentsState();
}

class _BuildingInspectionTheInteriorFragmentsState
    extends State<BuildingInspectionTheInteriorFragments> {
  TextEditingController entryController = TextEditingController();
  TextEditingController hallController = TextEditingController();
  TextEditingController linenCupboardController = TextEditingController();
  TextEditingController loungeRoomController = TextEditingController();

  TextEditingController diningRoomController = TextEditingController();

  TextEditingController kitchenController = TextEditingController();

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

  var imagePath = "NA";
  var imageName = "NA";
  var imageData = "NA";

  var hallimagePath = "NA";
  var hallimageName = "NA";
  var hallimageData = "NA";

  var linenimagePath = "NA";
  var linenimageName = "NA";
  var linenimageData = "NA";

  var interiordefectsloungeimagePath = "NA";
  var interiordefectsloungeimageName = "NA";
  var interiordefectsloungeimageData = "NA";

  var interiordefectsdiningimagePath = "NA";
  var interiordefectsdiningimageName = "NA";
  var interiordefectsdiningimageData = "NA";

  var interiordefectskitchenimagePath = "NA";
  var interiordefectskitchenimageName = "NA";
  var interiordefectskitchenimageData = "NA";

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

  Future<void> hallgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File hallimagePath = File(getimage.path);

        hallimageName = getimage.path.split('/').last;
        hallimageData = base64Encode(hallimagePath.readAsBytesSync());

        print(hallimagePath);
        print(hallimageName);
        print(hallimageData);
      }
    });
  }

  Future<void> hallcaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File hallimagePath = File(getimage.path);
        hallimageName = getimage.path.split('/').last;
        hallimageData = base64Encode(hallimagePath.readAsBytesSync());

        print(hallimagePath);
        print(hallimageName);
        print(hallimageData);
      }
    });
  }

  Future<void> linengetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File linenimagePath = File(getimage.path);

        linenimageName = getimage.path.split('/').last;
        linenimageData = base64Encode(linenimagePath.readAsBytesSync());

        print(linenimagePath);
        print(linenimageName);
        print(linenimageData);
      }
    });
  }

  Future<void> linencaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File linenimagePath = File(getimage.path);

        linenimageName = getimage.path.split('/').last;
        linenimageData = base64Encode(linenimagePath.readAsBytesSync());

        print(linenimagePath);
        print(linenimageName);
        print(linenimageData);
      }
    });
  }

  Future<void> interiordefectsloungegetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File interiordefectsloungeimagePath = File(getimage.path);

        interiordefectsloungeimageName = getimage.path.split('/').last;
        interiordefectsloungeimageData =
            base64Encode(interiordefectsloungeimagePath.readAsBytesSync());

        print(interiordefectsloungeimagePath);
        print(interiordefectsloungeimageName);
        print(interiordefectsloungeimageData);
      }
    });
  }

  Future<void> interiordefectsloungecaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File interiordefectsloungeimagePath = File(getimage.path);

        interiordefectsloungeimageName = getimage.path.split('/').last;
        interiordefectsloungeimageData =
            base64Encode(interiordefectsloungeimagePath.readAsBytesSync());

        print(interiordefectsloungeimagePath);
        print(interiordefectsloungeimageName);
        print(interiordefectsloungeimageData);
      }
    });
  }

  Future<void> interiordefectsdininggetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File interiordefectsdiningimagePath = File(getimage.path);

        interiordefectsdiningimageName = getimage.path.split('/').last;
        interiordefectsdiningimageData =
            base64Encode(interiordefectsdiningimagePath.readAsBytesSync());

        print(interiordefectsdiningimagePath);
        print(interiordefectsdiningimageName);
        print(interiordefectsdiningimageData);
      }
    });
  }

  Future<void> interiordefectsdiningcaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File interiordefectsdiningimagePath = File(getimage.path);

        interiordefectsdiningimageName = getimage.path.split('/').last;
        interiordefectsdiningimageData =
            base64Encode(interiordefectsdiningimagePath.readAsBytesSync());

        print(interiordefectsdiningimagePath);
        print(interiordefectsdiningimageName);
        print(interiordefectsdiningimageData);
      }
    });
  }

  Future<void> interiordefectskitchengetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File interiordefectskitchenimagePath = File(getimage.path);

        interiordefectskitchenimageName = getimage.path.split('/').last;
        interiordefectskitchenimageData =
            base64Encode(interiordefectskitchenimagePath.readAsBytesSync());

        print(interiordefectskitchenimagePath);
        print(interiordefectskitchenimageName);
        print(interiordefectskitchenimageData);
      }
    });
  }

  Future<void> interiordefectskitchencaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File interiordefectskitchenimagePath = File(getimage.path);

        interiordefectskitchenimageName = getimage.path.split('/').last;
        interiordefectskitchenimageData =
            base64Encode(interiordefectskitchenimagePath.readAsBytesSync());

        print(interiordefectskitchenimagePath);
        print(interiordefectskitchenimageName);
        print(interiordefectskitchenimageData);
      }
    });
  }

  Future<void> updateTheInteriorDetails(String id) async {
    try {
      showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        },
      );
      var res =
          await http.post(Uri.parse(API.prepurchasetheinteriordetails), body: {
        "id": id,
        "interiordefectsentry": entryController.text.trim(),
        "interiordefectshall": hallController.text.trim(),
        "interiordefectscupboard": linenCupboardController.text.trim(),
        "interiordefectslounge": loungeRoomController.text.trim(),
        "interiordefectsdining": diningRoomController.text.trim(),
        "interiordefectskitchen": kitchenController.text.trim(),
        "interiordefectsfamily": familyRoomController.text.trim(),
        "interiordefectsstudy": studyController.text.trim(),
        "interiordefectsstairs": stairsController.text.trim(),
        "interiordefectslaundry": laundryController.text.trim(),
        "interiordefectstoilet": toiletController.text.trim(),
        "interiordefectsbathroom": bathroomController.text.trim(),
        "interiordefectsensuite": enSuiteController.text.trim(),
        "interiordefectsbedroomone": bedroomOneController.text.trim(),
        "interiordefectsbedroomtwo": bedroomTwoController.text.trim(),
        "interiordefectsbedroomthree": bedroomThreeController.text.trim(),
        "interiordefectsbedroomfour": bedroomFourController.text.trim(),
        "interiordefectsother": otherIfApplicableController.text.trim(),
        "data": imageData,
        "name": imageName,
        "hallimagedata": hallimageData,
        "hallimagename": hallimageName,
        "interiordefectscupboardimagedata": linenimageData,
        "interiordefectscupboardimagename": linenimageName,
        "interiordefectsloungeimagedata": interiordefectsloungeimageData,
        "interiordefectsloungeimagename": interiordefectsloungeimageName,
        "interiordefectsdiningimagedata": interiordefectsdiningimageData,
        "interiordefectsdiningimagename": interiordefectsdiningimageName,
        "interiordefectskitchenimagedata": interiordefectskitchenimageData,
        "interiordefectskitchenimagename": interiordefectskitchenimageName,
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
                'INTERIOR OF THE BUILDING',
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
            //Entry
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: entryController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Entry'),
                ),
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
            //Hall
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: hallController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Hall'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: hallimageData != "NA"
                  ? Image.memory(base64Decode(hallimageData))
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
                          hallcaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          hallgetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),
            //Linen Cupboard
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: linenCupboardController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Linen Cupboard'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: linenimageData != "NA"
                  ? Image.memory(base64Decode(linenimageData))
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
                          linencaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          linengetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),
            //Lounge Room
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: loungeRoomController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Lounge Room'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: interiordefectsloungeimageData != "NA"
                  ? Image.memory(base64Decode(interiordefectsloungeimageData))
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
                          interiordefectsloungecaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          interiordefectsloungegetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),
            //Dining Room
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: diningRoomController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Dining Room'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: interiordefectsdiningimageData != "NA"
                  ? Image.memory(base64Decode(interiordefectsdiningimageData))
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
                          interiordefectsdiningcaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          interiordefectsdininggetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),
            //Kitchen
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: kitchenController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Kitchen'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: interiordefectskitchenimageData != "NA"
                  ? Image.memory(base64Decode(interiordefectskitchenimageData))
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
                          interiordefectskitchencaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          interiordefectskitchengetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),
            //Family Room
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: familyRoomController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Family Room'),
                ),
              ),
            ),
            //Study
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: studyController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Study'),
                ),
              ),
            ),
            //Stairs
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: stairsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Stairs'),
                ),
              ),
            ),
            //Laundry
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: laundryController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Laundry'),
                ),
              ),
            ),
            //Toilet
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: toiletController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Toilet'),
                ),
              ),
            ),
            //Bathroom
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: bathroomController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Bathroom'),
                ),
              ),
            ),
            //En-suite
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: enSuiteController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('En-suite'),
                ),
              ),
            ),
            //Bedroom  1
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: bedroomOneController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Bedroom  1'),
                ),
              ),
            ),
            //Bedroom  2
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: bedroomTwoController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Bedroom 2'),
                ),
              ),
            ),
            //Bedroom 3
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: bedroomThreeController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Bedroom 3'),
                ),
              ),
            ),
            //Bedroom 4
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: bedroomFourController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Bedroom 4'),
                ),
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
