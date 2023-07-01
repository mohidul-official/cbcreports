import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:multiselect/multiselect.dart';

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
  List<String> councilPlanInspectionselected = [];
  var councilPlanInspection = "NA";
  List<String> electricalInspectionselected = [];
  var electricalInspection = "NA";
  List<String> plumbingInspectionselected = [];
  var plumbingInspection = "NA";

  Future<void> updateOtherInspectionReportsDetails(String id) async {
    try {
      var res = await http
          .post(Uri.parse(API.prepurchaseotherinspectionreportsdetails), body: {
        "id": id,
        //"councilplaninspection": councilPlanInspectionController.text.trim(),
        "councilplaninspection": councilPlanInspection,
        //"electricalinspection": electricalInspectionController.text.trim(),
        "electricalinspection": electricalInspection,
        //"plumbinginspection": plumbingInspectionController.text.trim(),
        "plumbinginspection": plumbingInspection,
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
              child: DropDownMultiSelect(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Council Plan Inspection'),
                ),
                options: [
                  'Timber Pest Inspection ',
                  'Swimming Pool Inspection',
                  'Mould Inspection',
                  'Airconditioning Inspection',
                  'Mechanical Services',
                  'Estimating Report'
                ],
                selectedValues: councilPlanInspectionselected,
                onChanged: (List<String> councilPlanInspectionx) {
                  setState(() {
                    councilPlanInspectionselected = councilPlanInspectionx;
                    councilPlanInspection =
                        councilPlanInspectionselected.join(", ");
                  });
                },
              ),
            ),
            //Electrical Inspection
            Container(
              margin: EdgeInsets.all(10),
              child: DropDownMultiSelect(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Electrical Inspection'),
                ),
                options: [
                  'Structural (Engineer)',
                  'Drainage Inspection',
                  'Gasfitting Inspection',
                  'Alarm/Intercom/Data Systems ',
                  'Hazards Inspection',
                  'Garage Door Mechanical '
                ],
                selectedValues: electricalInspectionselected,
                onChanged: (List<String> electricalInspectionx) {
                  setState(() {
                    electricalInspectionselected = electricalInspectionx;
                    electricalInspection =
                        electricalInspectionselected.join(", ");
                  });
                },
              ),
            ),
            //Plumbing Inspection
            Container(
              margin: EdgeInsets.all(10),
              child: DropDownMultiSelect(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Plumbing Inspection'),
                ),
                options: [
                  'Geotechnical Inspection',
                  'Asbestos Inspection',
                  'Appliances Inspection',
                  'Hydraulics Inspection',
                  'Fire/Chimney Inspection',
                  'Durability of Exposed Surfaces'
                ],
                selectedValues: plumbingInspectionselected,
                onChanged: (List<String> plumbingInspectionx) {
                  setState(() {
                    plumbingInspectionselected = plumbingInspectionx;
                    plumbingInspection = plumbingInspectionselected.join(", ");
                  });
                },
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
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Back')),
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
