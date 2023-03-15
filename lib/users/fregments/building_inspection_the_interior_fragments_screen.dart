import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  Future<void> updateTheInteriorDetails(String id) async {
    try {
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
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        //print("Record Inserted");

        Fluttertoast.showToast(msg: "Record Inserted");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingInspectionTheRoofInteriorFragments(reportId: id)));
        /*entryController.clear();
        hallController.clear();
        linenCupboardController.clear();
        loungeRoomController.clear();
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
