import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../api_connection/api_connection.dart';
import 'package:http/http.dart' as http;

import 'building_inspection_other_inspections_reports_fragments_screen.dart';

class BuildingInspetionDescriptionIdentificationPropertyFragments
    extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  BuildingInspetionDescriptionIdentificationPropertyFragments(
      {Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildingInspetionDescriptionIdentificationPropertyFragments>
      createState() =>
          _BuildingInspetionDescriptionIdentificationPropertyFragmentsState();
}

class _BuildingInspetionDescriptionIdentificationPropertyFragmentsState
    extends State<BuildingInspetionDescriptionIdentificationPropertyFragments> {
  TextEditingController typeInspectedController = TextEditingController();
  TextEditingController styleInspectedController = TextEditingController();
  TextEditingController constructionTypeInspectedInspectedController =
      TextEditingController();
  TextEditingController interiorController = TextEditingController();
  TextEditingController piersCommentsController = TextEditingController();
  TextEditingController flooringCommentsController = TextEditingController();
  TextEditingController verandahsController = TextEditingController();
  TextEditingController patioController = TextEditingController();
  TextEditingController otherController = TextEditingController();
  TextEditingController roofingController = TextEditingController();
  TextEditingController roofCoveringController = TextEditingController();
  TextEditingController outStructuresController = TextEditingController();
  Future<void> updateDescriptionIdentificationPropertyDetails(String id) async {
    try {
      var res = await http
          .post(Uri.parse(API.prepurchasedescriptionpropertydetails), body: {
        "id": id,
        "propertyinspectedtype": typeInspectedController.text.trim(),
        "propertyinspectedstyle": styleInspectedController.text.trim(),
        "constructiontype":
            constructionTypeInspectedInspectedController.text.trim(),
        "interior": interiorController.text.trim(),
        "piers": piersCommentsController.text.trim(),
        "flooring": flooringCommentsController.text.trim(),
        "verandahs": verandahsController.text.trim(),
        "patio": patioController.text.trim(),
        "patioother": otherController.text.trim(),
        "roofing": roofingController.text.trim(),
        "roofcovering": roofCoveringController.text.trim(),
        "outstructures": outStructuresController.text.trim(),
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        //print("Record Inserted");

        Fluttertoast.showToast(msg: "Record Inserted");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingInspectionOtherInspectionsReportFragments(
                    reportId: id)));
        /*typeInspectedController.clear();
        styleInspectedController.clear();
        constructionTypeInspectedInspectedController.clear();
        interiorController.clear();
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
                'Description and Identification of the Property Inspected',
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
            //Type
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: typeInspectedController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Type'),
                ),
              ),
            ),
            //Style
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: styleInspectedController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Style'),
                ),
              ),
            ),
            //Construction Type
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: constructionTypeInspectedInspectedController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Construction Type'),
                ),
              ),
            ),
            //Interior
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: interiorController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Interior'),
                ),
              ),
            ),
            //Piers
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: piersCommentsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Piers'),
                ),
              ),
            ),
            //Flooring
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: flooringCommentsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Flooring'),
                ),
              ),
            ),
            //Verandahs
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: verandahsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Verandahs'),
                ),
              ),
            ),
            //Patio
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: patioController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Patio'),
                ),
              ),
            ),
            //Roofing
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: roofingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Roofing'),
                ),
              ),
            ),
            //Other
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: otherController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Other'),
                ),
              ),
            ),
            //Roof covering
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: roofCoveringController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Roof covering'),
                ),
              ),
            ),
            //Out Structures
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: outStructuresController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Out Structures'),
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
                          updateDescriptionIdentificationPropertyDetails(
                              widget.reportId);
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
