import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../api_connection/api_connection.dart';
import 'package:http/http.dart' as http;

import 'building_inspection_the_interior_fragments_screen.dart';
import 'building_inspection_the_roof_exterior_fragments_screen.dart';

class BuildingInspectorTheExteriorStepTwoFragments extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  BuildingInspectorTheExteriorStepTwoFragments(
      {Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildingInspectorTheExteriorStepTwoFragments> createState() =>
      _BuildingInspectorTheExteriorStepTwoFragmentsState();
}

class _BuildingInspectorTheExteriorStepTwoFragmentsState
    extends State<BuildingInspectorTheExteriorStepTwoFragments> {
  TextEditingController timberSteelStructuresController =
      TextEditingController();

  TextEditingController stairsController = TextEditingController();

  TextEditingController balustradesController = TextEditingController();

  TextEditingController balconiesController = TextEditingController();

  TextEditingController verandasController = TextEditingController();

  TextEditingController patiosController = TextEditingController();

  TextEditingController decksController = TextEditingController();

  TextEditingController chimneysController = TextEditingController();

  TextEditingController otherIfApplicableController = TextEditingController();

  File? timberimagePath;
  String? timberimageName;
  String? timberimageData;

  File? stairsimagePath;
  String? stairsimageName;
  String? stairsimageData;

  File? balustradesimagePath;
  String? balustradesimageName;
  String? balustradesimageData;

  File? balconiesimagePath;
  String? balconiesimageName;
  String? balconiesimageData;

  File? verandasimagePath;
  String? verandasimageName;
  String? verandasimageData;

  ImagePicker imagePicker = ImagePicker();

  Future<void> timbergetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        timberimagePath = File(getimage.path);
        timberimageName = getimage.path.split('/').last;
        timberimageData = base64Encode(timberimagePath!.readAsBytesSync());
        print(timberimagePath);
        print(timberimageName);
        print(timberimageData);
      }
    });
  }

  Future<void> timbercaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        timberimagePath = File(getimage.path);
        timberimageName = getimage.path.split('/').last;
        timberimageData = base64Encode(timberimagePath!.readAsBytesSync());
        print(timberimagePath);
        print(timberimageName);
        print(timberimageData);
      }
    });
  }

  Future<void> stairsgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        stairsimagePath = File(getimage.path);
        stairsimageName = getimage.path.split('/').last;
        stairsimageData = base64Encode(stairsimagePath!.readAsBytesSync());
        print(stairsimagePath);
        print(stairsimageName);
        print(stairsimageData);
      }
    });
  }

  Future<void> stairscaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        stairsimagePath = File(getimage.path);
        stairsimageName = getimage.path.split('/').last;
        stairsimageData = base64Encode(stairsimagePath!.readAsBytesSync());
        print(stairsimagePath);
        print(stairsimageName);
        print(stairsimageData);
      }
    });
  }

  Future<void> balustradesgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        balustradesimagePath = File(getimage.path);
        balustradesimageName = getimage.path.split('/').last;
        balustradesimageData =
            base64Encode(balustradesimagePath!.readAsBytesSync());
        print(balustradesimagePath);
        print(balustradesimageName);
        print(balustradesimageData);
      }
    });
  }

  Future<void> balustradescaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        balustradesimagePath = File(getimage.path);
        balustradesimageName = getimage.path.split('/').last;
        balustradesimageData =
            base64Encode(balustradesimagePath!.readAsBytesSync());
        print(balustradesimagePath);
        print(balustradesimageName);
        print(balustradesimageData);
      }
    });
  }

  Future<void> balconiesgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        balconiesimagePath = File(getimage.path);
        balconiesimageName = getimage.path.split('/').last;
        balconiesimageData =
            base64Encode(balconiesimagePath!.readAsBytesSync());
        print(balconiesimagePath);
        print(balconiesimageName);
        print(balconiesimageData);
      }
    });
  }

  Future<void> balconiescaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        balconiesimagePath = File(getimage.path);
        balconiesimageName = getimage.path.split('/').last;
        balconiesimageData =
            base64Encode(balconiesimagePath!.readAsBytesSync());
        print(balconiesimagePath);
        print(balconiesimageName);
        print(balconiesimageData);
      }
    });
  }

  Future<void> verandasgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        verandasimagePath = File(getimage.path);
        verandasimageName = getimage.path.split('/').last;
        verandasimageData = base64Encode(verandasimagePath!.readAsBytesSync());
        print(verandasimagePath);
        print(verandasimageName);
        print(verandasimageData);
      }
    });
  }

  Future<void> verandascaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        verandasimagePath = File(getimage.path);
        verandasimageName = getimage.path.split('/').last;
        verandasimageData = base64Encode(verandasimagePath!.readAsBytesSync());
        print(verandasimagePath);
        print(verandasimageName);
        print(verandasimageData);
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
      var res = await http
          .post(Uri.parse(API.prepurchasetheexteriorsteptwodetails), body: {
        "id": id,
        "exteriordefectstimber": timberSteelStructuresController.text.trim(),
        "exteriordefectsstairs": stairsController.text.trim(),
        "exteriordefectsbalustrades": balustradesController.text.trim(),
        "exteriordefectsbalconies": balconiesController.text.trim(),
        "exteriordefectsverandas": verandasController.text.trim(),
        "exteriordefectspatios": patiosController.text.trim(),
        "exteriordefectsdecks": decksController.text.trim(),
        "exteriordefectschimneys": chimneysController.text.trim(),
        "exteriordefectsother": otherIfApplicableController.text.trim(),
        "timberimagedata": timberimageData,
        "timberimagename": timberimageName,
        "stairsimagedata": stairsimageData,
        "stairsimagename": stairsimageName,
        "balustradesimagedata": balustradesimageData,
        "balustradesimagename": balustradesimageName,
        "balconiesimagedata": balconiesimageData,
        "balconiesimagename": balconiesimageName,
        "verandasimagedata": verandasimageData,
        "verandasimagename": verandasimageName,
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
                'EXTERIOR OF THE BUILDING (STEP 2)',
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
            //Timber and Steel Structures
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: timberSteelStructuresController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Timber and Steel Structures'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: timberimagePath != null
                  ? Image.file(timberimagePath!)
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
                          timbercaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          timbergetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
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
            Container(
              margin: EdgeInsets.all(10),
              child: stairsimagePath != null
                  ? Image.file(stairsimagePath!)
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
                          stairscaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          stairsgetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),
            //Balustrades
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: balustradesController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Balustrades'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: balustradesimagePath != null
                  ? Image.file(balustradesimagePath!)
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
                          balustradescaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          balustradesgetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),
            //Balconies
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: balconiesController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Balconies'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: balconiesimagePath != null
                  ? Image.file(balconiesimagePath!)
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
                          balconiescaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          balconiesgetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),
            //Verandas
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: verandasController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Verandas'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: verandasimagePath != null
                  ? Image.file(verandasimagePath!)
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
                          verandascaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          verandasgetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),
            //Patios
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: patiosController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Patios'),
                ),
              ),
            ),
            //Decks
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: decksController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Decks'),
                ),
              ),
            ),
            //Chimneys
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: chimneysController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Chimneys'),
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
