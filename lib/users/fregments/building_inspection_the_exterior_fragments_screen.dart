import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../api_connection/api_connection.dart';
import 'package:http/http.dart' as http;

class BuildingInspectorTheExteriorFragments extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  BuildingInspectorTheExteriorFragments({Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildingInspectorTheExteriorFragments> createState() =>
      _BuildingInspectorTheExteriorFragmentsState();
}

class _BuildingInspectorTheExteriorFragmentsState
    extends State<BuildingInspectorTheExteriorFragments> {
  TextEditingController wallsController = TextEditingController();
  TextEditingController externalCladdingController = TextEditingController();
  TextEditingController lintelsController = TextEditingController();
  TextEditingController doorsController = TextEditingController();

  TextEditingController windowsController = TextEditingController();

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

  Future<void> updateTheExteriorDetails(String id) async {
    try {
      var res =
          await http.post(Uri.parse(API.prepurchasetheexteriordetails), body: {
        "id": id,
        "exteriordefectswalls": wallsController.text.trim(),
        "exteriordefectscladding": externalCladdingController.text.trim(),
        "exteriordefectslintels": lintelsController.text.trim(),
        "exteriordefectsdoors": doorsController.text.trim(),
        "exteriordefectswindows": windowsController.text.trim(),
        "exteriordefectstimber": timberSteelStructuresController.text.trim(),
        "exteriordefectsstairs": stairsController.text.trim(),
        "exteriordefectsbalustrades": balustradesController.text.trim(),
        "exteriordefectsbalconies": balconiesController.text.trim(),
        "exteriordefectsverandas": verandasController.text.trim(),
        "exteriordefectspatios": patiosController.text.trim(),
        "exteriordefectsdecks": decksController.text.trim(),
        "exteriordefectschimneys": chimneysController.text.trim(),
        "exteriordefectsother": otherIfApplicableController.text.trim(),
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        //print("Record Inserted");

        Fluttertoast.showToast(msg: "Record Inserted");
        /*Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingInspetionDescriptionIdentificationPropertyFragments(reportId: id)));*/
        /*wallsController.clear();
        externalCladdingController.clear();
        lintelsController.clear();
        doorsController.clear();
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
            //Walls
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: wallsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Walls'),
                ),
              ),
            ),
            //External Cladding
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: externalCladdingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('External Cladding'),
                ),
              ),
            ),
            //Lintels
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: lintelsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Lintels'),
                ),
              ),
            ),
            //Doors
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: doorsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Doors'),
                ),
              ),
            ),
            //Windows
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: windowsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Windows'),
                ),
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
