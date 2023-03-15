import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../api_connection/api_connection.dart';
import 'package:http/http.dart' as http;

import 'building_inspection_the_sub_floor_fragments_screen.dart';

class BuildingInspectionTheRoofExteriorFragments extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  BuildingInspectionTheRoofExteriorFragments(
      {Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildingInspectionTheRoofExteriorFragments> createState() =>
      _BuildingInspectionTheRoofExteriorFragmentsState();
}

class _BuildingInspectionTheRoofExteriorFragmentsState
    extends State<BuildingInspectionTheRoofExteriorFragments> {
  TextEditingController roofFlashingsUndersideController =
      TextEditingController();
  TextEditingController guttersDownpipesController = TextEditingController();
  TextEditingController valleysController = TextEditingController();
  TextEditingController skylightsController = TextEditingController();

  TextEditingController ventsController = TextEditingController();

  TextEditingController fluesController = TextEditingController();

  TextEditingController eavesController = TextEditingController();

  TextEditingController faciaAndBargesController = TextEditingController();

  TextEditingController otherIfApplicableController = TextEditingController();

  Future<void> updateTheRoofExteriorDetails(String id) async {
    try {
      var res = await http
          .post(Uri.parse(API.prepurchasetheroofexteriordetails), body: {
        "id": id,
        "roofexteriorflashings": roofFlashingsUndersideController.text.trim(),
        "roofexteriorgutters": guttersDownpipesController.text.trim(),
        "roofexteriorvalleys": valleysController.text.trim(),
        "roofexteriorskylights": skylightsController.text.trim(),
        "roofexteriorvents": ventsController.text.trim(),
        "roofexteriorflues": fluesController.text.trim(),
        "roofexterioreaves": eavesController.text.trim(),
        "roofexteriorbarges": faciaAndBargesController.text.trim(),
        "roofexteriorother": otherIfApplicableController.text.trim(),
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        //print("Record Inserted");

        Fluttertoast.showToast(msg: "Record Inserted");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingInspectionTheSubFloorFragments(reportId: id)));
        /*guttersDownpipesController.clear();
        guttersDownpipesController.clear();
        valleysController.clear();
        skylightsController.clear();
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
                'THE ROOF EXTERIOR',
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
            //Roof Flashings
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: roofFlashingsUndersideController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Roof Flashings'),
                ),
              ),
            ),
            //Gutters/Downpipes:
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: guttersDownpipesController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Gutters/Downpipes'),
                ),
              ),
            ),
            //Valleys
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: valleysController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Valleys'),
                ),
              ),
            ),
            //Skylights
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: skylightsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Skylights'),
                ),
              ),
            ),
            //Vents
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: ventsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Vents'),
                ),
              ),
            ),
            //Flues
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: fluesController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Flues'),
                ),
              ),
            ),
            //Eaves
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: eavesController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Eaves'),
                ),
              ),
            ),
            //Facia and Barges:
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: faciaAndBargesController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Facia and Barges:'),
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
                          updateTheRoofExteriorDetails(widget.reportId);
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
