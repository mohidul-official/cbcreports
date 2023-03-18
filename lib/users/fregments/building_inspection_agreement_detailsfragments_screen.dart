import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../api_connection/api_connection.dart';
import 'building_inspection_contact_the_inspector_fragments_screen.dart';
import 'building_inspection_inspection_details_fragments_screen.dart';

class BuildingInspectionAgreementFragments extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  BuildingInspectionAgreementFragments({Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildingInspectionAgreementFragments> createState() =>
      _BuildingInspectionAgreementFragmentsState();
}

class _BuildingInspectionAgreementFragmentsState
    extends State<BuildingInspectionAgreementFragments> {
  TextEditingController agreementNoController = TextEditingController();
  TextEditingController dateOfAgreementController = TextEditingController();
  TextEditingController timeOfAgreementController = TextEditingController();
  TextEditingController specificRequirementsController =
      TextEditingController();
  TextEditingController changedAgreementDateController =
      TextEditingController();
  TextEditingController changedAgreementTimeController =
      TextEditingController();
  Future<void> updateAgreementDetails(String id) async {
    try {
      var res =
          await http.post(Uri.parse(API.prepurchaseagreementdetails), body: {
        "id": id,
        "agreementno": agreementNoController.text.trim(),
        "dateofagreement": dateOfAgreementController.text.trim(),
        "timeagreement": timeOfAgreementController.text.trim(),
        "specificrequirements": specificRequirementsController.text.trim(),
        "changedagreementdate": changedAgreementDateController.text.trim(),
        "changedagreementtime": changedAgreementTimeController.text.trim(),
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        //print("Record Inserted");

        Fluttertoast.showToast(msg: "Record Inserted");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingIspectionIspectionFragments(reportId: id)));
        /*Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingInspectionContactTheIspectorFragments(reportId: id)));*/
        /*agreementNoController.clear();
        dateOfAgreementController.clear();
        timeOfAgreementController.clear();
        specificRequirementsController.clear();
        changedAgreementDateController.clear();
        changedAgreementTimeController.clear();*/
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
        title: Text("Pre Purchase Inspection"),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Agreement Details',
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
            //Agreement No
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: agreementNoController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Agreement No'),
                ),
              ),
            ),
            //Date of Agreement
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: dateOfAgreementController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Date of Agreement'),
                ),
              ),
            ),
            //Time of Agreement
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: timeOfAgreementController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Time of Agreement'),
                ),
              ),
            ),
            //Specific Requirements
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: specificRequirementsController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                      'Specific Requirements/Conditions Required by You were'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Changes to the Inspection Agreement requested',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Date and Time the Changed Agreement was accepted: ',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
            //Date
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: changedAgreementDateController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Date'),
                ),
              ),
            ),
            //Time
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: changedAgreementTimeController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Time'),
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
                          updateAgreementDetails(widget.reportId);
                        },
                        child: Text('Save & Next')),
                  ),
                ],
              ),
            ),
            /*
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    insertRecord();
                  },
                  child: Text('Save & Next')),
            ),*/
          ],
        ),
      ),
    );
  }
}
