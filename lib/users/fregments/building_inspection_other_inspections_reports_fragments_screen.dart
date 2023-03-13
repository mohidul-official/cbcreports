import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../api_connection/api_connection.dart';
import 'package:http/http.dart' as http;

import 'building_inspection_the_site_fragments_screen.dart';

class BuildingInspectionOtherInspectionsReportFragments extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  BuildingInspectionOtherInspectionsReportFragments(
      {Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildingInspectionOtherInspectionsReportFragments> createState() =>
      _BuildingInspectionOtherInspectionsReportFragmentsState();
}

class _BuildingInspectionOtherInspectionsReportFragmentsState
    extends State<BuildingInspectionOtherInspectionsReportFragments> {
  TextEditingController councilPlanInspectionController =
      TextEditingController();
  TextEditingController electricalInspectionController =
      TextEditingController();
  TextEditingController plumbingInspectionController = TextEditingController();
  TextEditingController otherController = TextEditingController();

  Future<void> updateOtherInspectionReportsDetails(String id) async {
    try {
      var res = await http
          .post(Uri.parse(API.prepurchaseotherinspectionreportsdetails), body: {
        "id": id,
        "councilplaninspection": councilPlanInspectionController.text.trim(),
        "electricalinspection": electricalInspectionController.text.trim(),
        "plumbinginspection": plumbingInspectionController.text.trim(),
        "otherinspectionsreports": otherController.text.trim(),
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        //print("Record Inserted");

        Fluttertoast.showToast(msg: "Record Inserted");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingInspectionTheSiteFragments(reportId: id)));
        /*councilPlanInspectionController.clear();
        electricalInspectionController.clear();
        plumbingInspectionController.clear();
        otherController.clear();
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
                'Other Inspections and Reports Required',
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
            //Council Plan Inspection
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: councilPlanInspectionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Council Plan Inspection '),
                ),
              ),
            ),
            //Electrical Inspection
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: electricalInspectionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Electrical Inspection'),
                ),
              ),
            ),
            //Plumbing Inspection
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: plumbingInspectionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Plumbing Inspection'),
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
                          updateOtherInspectionReportsDetails(widget.reportId);
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
