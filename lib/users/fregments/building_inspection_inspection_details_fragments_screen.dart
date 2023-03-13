import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../api_connection/api_connection.dart';
import 'building_inspection_areas_gain_factors_fragments_screen.dart';

class BuildingIspectionIspectionFragments extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  BuildingIspectionIspectionFragments({Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildingIspectionIspectionFragments> createState() =>
      _BuildingIspectionIspectionFragmentsState();
}

class _BuildingIspectionIspectionFragmentsState
    extends State<BuildingIspectionIspectionFragments> {
  TextEditingController dateOfInspectionController = TextEditingController();
  TextEditingController timeOfInspectionController = TextEditingController();
  TextEditingController personsInAttendanceController = TextEditingController();
  TextEditingController weatherConditionsController = TextEditingController();
  TextEditingController recentConditionsController = TextEditingController();
  TextEditingController buildingFurnishedController = TextEditingController();
  TextEditingController buildingTenancyController = TextEditingController();
  Future<void> updateInspectionDetails(String id) async {
    try {
      var res =
          await http.post(Uri.parse(API.prepurchaseinspectiondetails), body: {
        "id": id,
        "dateofinspection": dateOfInspectionController.text.trim(),
        "timeofinspection": timeOfInspectionController.text.trim(),
        "personsinattendance": personsInAttendanceController.text.trim(),
        "weatherconditions": weatherConditionsController.text.trim(),
        "recentweather": recentConditionsController.text.trim(),
        "buildingfurnished": buildingFurnishedController.text.trim(),
        "buildingtenancy": buildingTenancyController.text.trim(),
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        //print("Record Inserted");

        Fluttertoast.showToast(msg: "Record Inserted");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingIspectionAreasGrainFactorsFragments(reportId: id)));
        /*dateOfInspectionController.clear();
        timeOfInspectionController.clear();
        personsInAttendanceController.clear();
        weatherConditionsController.clear();
        recentConditionsController.clear();
        buildingFurnishedController.clear();*/
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
                'Inspection Details',
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
            //Date of the Inspection
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: dateOfInspectionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Date of the Inspection'),
                ),
              ),
            ),
            //Time of Inspection
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: timeOfInspectionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Time of Inspection'),
                ),
              ),
            ),
            //Persons in Attendance
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: personsInAttendanceController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Persons in Attendance'),
                ),
              ),
            ),
            //Weather Conditions at the time of Inspection
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: weatherConditionsController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Weather Conditions at the time of Inspection'),
                ),
              ),
            ),
            //Recent Weather Conditions
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: recentConditionsController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Recent Weather Conditions'),
                ),
              ),
            ),
            //Building Furnished
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: buildingFurnishedController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Building Furnished'),
                ),
              ),
            ),
            //Building Tenancy
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: buildingTenancyController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Building Tenancy'),
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
                          updateInspectionDetails(widget.reportId);
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
