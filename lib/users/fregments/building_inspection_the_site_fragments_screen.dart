import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../api_connection/api_connection.dart';
import 'package:http/http.dart' as http;

import 'building_inspection_the_exterior_fragments_screen.dart';

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
        "safetyhazardsbuildings": detachedBuildingsController.text.trim(),
        "safetyhazardsgarden": gardenShedsFencesController.text.trim(),
        "safetyhazardsother": otherIfApplicableController.text.trim(),
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
                'Description of the Defects/Safety Hazards, Location and the Inspector’s Recommendations',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
