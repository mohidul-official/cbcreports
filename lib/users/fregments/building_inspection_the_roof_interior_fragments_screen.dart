import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../api_connection/api_connection.dart';

import 'package:http/http.dart' as http;

import 'building_inspection_the_roof_exterior_fragments_screen.dart';

class BuildingInspectionTheRoofInteriorFragments extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  BuildingInspectionTheRoofInteriorFragments(
      {Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildingInspectionTheRoofInteriorFragments> createState() =>
      _BuildingInspectionTheRoofInteriorFragmentsState();
}

class _BuildingInspectionTheRoofInteriorFragmentsState
    extends State<BuildingInspectionTheRoofInteriorFragments> {
  TextEditingController roofCoveringUndersideController =
      TextEditingController();
  TextEditingController roofFlashingsUndersideController =
      TextEditingController();
  TextEditingController roofFramingController = TextEditingController();
  TextEditingController insulationController = TextEditingController();

  TextEditingController sarkingController = TextEditingController();

  TextEditingController otherIfApplicableController = TextEditingController();

  Future<void> updateTheRoofInteriorDetails(String id) async {
    try {
      var res = await http
          .post(Uri.parse(API.prepurchasetheroofinteriordetails), body: {
        "id": id,
        "roofinteriorcovering": roofCoveringUndersideController.text.trim(),
        "roofinteriorflashings": roofFlashingsUndersideController.text.trim(),
        "roofinteriorframing": roofFramingController.text.trim(),
        "roofinteriorinsulation": insulationController.text.trim(),
        "roofinteriorsarking": sarkingController.text.trim(),
        "roofinteriorother": otherIfApplicableController.text.trim(),
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        //print("Record Inserted");

        Fluttertoast.showToast(msg: "Record Inserted");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingInspectionTheRoofExteriorFragments(reportId: id)));
        /*roofCoveringUndersideController.clear();
        roofFlashingsUndersideController.clear();
        roofFramingController.clear();
        insulationController.clear();
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
                'THE ROOF INTERIOR',
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
            //Roof Covering Underside:
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: roofCoveringUndersideController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Roof Covering Underside:'),
                ),
              ),
            ),
            //Roof Flashings Underside:
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: roofFlashingsUndersideController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Roof Flashings Underside:'),
                ),
              ),
            ),
            //Roof Framing
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: roofFramingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Roof Framing'),
                ),
              ),
            ),
            //Insulation
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: insulationController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Insulation'),
                ),
              ),
            ),
            //Sarking
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: sarkingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Sarking'),
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
                          updateTheRoofInteriorDetails(widget.reportId);
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
