import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../api_connection/api_connection.dart';
import 'building_inspection_description_identification_property_fragments_screen.dart';

class BuildingIspectionAreasGrainFactorsFragments extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  BuildingIspectionAreasGrainFactorsFragments({Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildingIspectionAreasGrainFactorsFragments> createState() => _BuildingIspectionAreasGrainFactorsFragmentsState();
}

class _BuildingIspectionAreasGrainFactorsFragmentsState extends State<BuildingIspectionAreasGrainFactorsFragments> {
  TextEditingController actualAreasInspectedController = TextEditingController();
  TextEditingController areasNotInspectedInspectedController = TextEditingController();
  TextEditingController areasNotFullyInspectedInspectedController = TextEditingController();
  TextEditingController gainedAccessController = TextEditingController();
  TextEditingController apparentDefectsController = TextEditingController();
  TextEditingController informationProvidedInspectorController = TextEditingController();
  TextEditingController influencingTheInspectionController = TextEditingController();
  Future<void> updateAreasGainFactorsDetails(String id) async {
    try {
      var res =
          await http.post(Uri.parse(API.prepurchaseareasgainfactorsdetails), body: {
        "id": id,
        "actualareasinspected": actualAreasInspectedController.text.trim(),
        "notinspected": areasNotInspectedInspectedController.text.trim(),
        "notfullyinspected": areasNotFullyInspectedInspectedController.text.trim(),
        "gainaccessandreinspect": gainedAccessController.text.trim(),
        "possibledefects": apparentDefectsController.text.trim(),
        "informationprovidedinspector": informationProvidedInspectorController.text.trim(),
        "otherfactorsinfluencing": influencingTheInspectionController.text.trim(),
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        //print("Record Inserted");

        Fluttertoast.showToast(msg: "Record Inserted");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingInspetionDescriptionIdentificationPropertyFragments(reportId: id)));
        /*actualAreasInspectedController.clear();
        areasNotInspectedInspectedController.clear();
        areasNotFullyInspectedInspectedController.clear();
        gainedAccessController.clear();
        apparentDefectsController.clear();
        informationProvidedInspectorController.clear();*/
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
                'Areas Inspected and Restrictions to the Inspection',
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
            //The Actual Areas Inspected were
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: actualAreasInspectedController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('The Actual Areas Inspected were'),
                ),
              ),
            ),
            //	Restrictions

            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Restrictions',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            //Areas NOT Inspected Including Reason(s) were
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: areasNotInspectedInspectedController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Areas NOT Inspected Including Reasons were'),
                ),
              ),
            ),
            //Areas NOT Fully Inspected Including Reason(s) were
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: areasNotFullyInspectedInspectedController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Areas NOT Fully Inspected Including Reasons were'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Recommendations to Gain Access and Reinspect',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            //The Area(s) and/or Section(s) to which Access should be gained or fully gained are
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: gainedAccessController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('The Area(s) and/or Section(s) to which Access should be gained or fully gained are'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Factors that Influenced the Inspection/Report Outcome',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            //Details of Apparent concealment of possible defects:
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: apparentDefectsController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Details of Apparent concealment of possible defects'),
                ),
              ),
            ),
            //Information provided to the Inspector that has a bearing on the Inspection and/or Report and from whom and when that information was provided:
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: informationProvidedInspectorController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Information provided to the Inspector that has a bearing on the Inspection and/or Report and from whom and when that information was provided:'),
                ),
              ),
            ),
            //Details of Other Factors influencing the inspection: 
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: influencingTheInspectionController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Details of Other Factors influencing the inspection: '),
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
                          updateAreasGainFactorsDetails(widget.reportId);
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