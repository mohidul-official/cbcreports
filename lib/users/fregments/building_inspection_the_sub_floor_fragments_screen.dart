import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../api_connection/api_connection.dart';
import 'package:http/http.dart' as http;

import 'building_inspection_cracking_building_members_fragments_screen.dart';

class BuildingInspectionTheSubFloorFragments extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  BuildingInspectionTheSubFloorFragments({Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildingInspectionTheSubFloorFragments> createState() =>
      _BuildingInspectionTheSubFloorFragmentsState();
}

class _BuildingInspectionTheSubFloorFragmentsState
    extends State<BuildingInspectionTheSubFloorFragments> {
  TextEditingController floorFramingTimbersController = TextEditingController();
  TextEditingController undersideFlooringSystemController =
      TextEditingController();
  TextEditingController piersPostsSupportsController = TextEditingController();
  TextEditingController termiteShieldingController = TextEditingController();

  TextEditingController subFloorVentilationController = TextEditingController();

  TextEditingController otherIfApplicableController = TextEditingController();

  Future<void> updateTheSubFloorDetails(String id) async {
    try {
      var res =
          await http.post(Uri.parse(API.prepurchasethesubfloordetails), body: {
        "id": id,
        "subfloortimbers": floorFramingTimbersController.text.trim(),
        "subfloorsystem": undersideFlooringSystemController.text.trim(),
        "subfloorsupports": piersPostsSupportsController.text.trim(),
        "subfloorshielding": termiteShieldingController.text.trim(),
        "subfloorventilation": subFloorVentilationController.text.trim(),
        "subfloorother": otherIfApplicableController.text.trim(),
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        //print("Record Inserted");

        Fluttertoast.showToast(msg: "Record Inserted");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingInspectionCrackingBuildingMemberFragments(
                    reportId: id)));
        /*undersideFlooringSystemController.clear();
        undersideFlooringSystemController.clear();
        piersPostsSupportsController.clear();
        termiteShieldingController.clear();
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
                'THE SUB FLOOR',
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
            //Floor Framing Timbers
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: floorFramingTimbersController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Floor Framing Timbers'),
                ),
              ),
            ),
            //Underside of the Flooring System:
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: undersideFlooringSystemController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Underside of the Flooring System'),
                ),
              ),
            ),
            //Piers/Posts/Supports
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: piersPostsSupportsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Piers/Posts/Supports'),
                ),
              ),
            ),
            //Termite Shielding
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: termiteShieldingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Termite Shielding'),
                ),
              ),
            ),
            //Sub-floor ventilation
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: subFloorVentilationController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Sub-floor ventilation'),
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
                          updateTheSubFloorDetails(widget.reportId);
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
