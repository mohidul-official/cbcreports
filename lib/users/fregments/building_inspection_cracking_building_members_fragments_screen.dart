import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../api_connection/api_connection.dart';
import 'package:http/http.dart' as http;

import 'building_inspection_contact_the_inspector_fragments_screen.dart';

class BuildingInspectionCrackingBuildingMemberFragments extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  BuildingInspectionCrackingBuildingMemberFragments(
      {Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildingInspectionCrackingBuildingMemberFragments> createState() =>
      _BuildingInspectionCrackingBuildingMemberFragmentsState();
}

class _BuildingInspectionCrackingBuildingMemberFragmentsState
    extends State<BuildingInspectionCrackingBuildingMemberFragments> {
  TextEditingController concreteSlabsLocationController =
      TextEditingController();
  TextEditingController concreteSlabsDescriptionController =
      TextEditingController();
  TextEditingController suspendedConcreteSlabsLocationController =
      TextEditingController();
  TextEditingController suspendedConcreteSlabsDescriptionController =
      TextEditingController();
  TextEditingController masonryWallsLocationController =
      TextEditingController();
  TextEditingController masonryWallsDescriptionController =
      TextEditingController();
  TextEditingController piersLocationController = TextEditingController();
  TextEditingController piersDescriptionController = TextEditingController();

  TextEditingController retainingWallsLocationController =
      TextEditingController();

  TextEditingController retainingWallsDescriptionController =
      TextEditingController();

  TextEditingController otherAreasLocationController = TextEditingController();

  TextEditingController otherAreasDescriptionController =
      TextEditingController();

  var crackingbuildingmembers = "NA";

  Future<void> updateCrackingBuildingMembersDetails(String id) async {
    try {
      var res = await http.post(
          Uri.parse(API.prepurchasecreckingbuildingmembersdetails),
          body: {
            "id": id,
            "crackingbuildingmembers": crackingbuildingmembers,
            "concreteslabslocation":
                concreteSlabsLocationController.text.trim(),
            "concreteslabsdefects":
                concreteSlabsDescriptionController.text.trim(),
            "suspendedconcreteslabslocation":
                suspendedConcreteSlabsLocationController.text.trim(),
            "suspendedconcreteslabsdefects":
                suspendedConcreteSlabsDescriptionController.text.trim(),
            "masonrywallslocation": masonryWallsLocationController.text.trim(),
            "masonrywallsdefects":
                masonryWallsDescriptionController.text.trim(),
            "pierslocation": piersLocationController.text.trim(),
            "piersdefects": piersDescriptionController.text.trim(),
            "retainingwallslocation":
                retainingWallsLocationController.text.trim(),
            "retainingwallsdefects":
                retainingWallsDescriptionController.text.trim(),
            "otherareaslocation": otherAreasLocationController.text.trim(),
            "otherareasdefects": otherAreasDescriptionController.text.trim(),
          });
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        //print("Record Inserted");

        Fluttertoast.showToast(msg: "Record Inserted");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingInspectionContactTheIspectorFragments(reportId: id)));
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
                'CRACKING TO BUILDING MEMBERS',
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

            //Is there cracking to the Building Members:

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Is there cracking to the Building Members: '),
                ),
                value: crackingbuildingmembers,
                items: [
                  DropdownMenuItem(
                    child: Text('-Select-'),
                    value: "NA",
                  ),
                  DropdownMenuItem(
                    child: Text('Yes'),
                    value: "Yes",
                  ),
                  DropdownMenuItem(
                    child: Text('No'),
                    value: "No",
                  ),
                ],
                onChanged: (crackingbuildingmembers) {
                  setState(() {
                    this.crackingbuildingmembers = crackingbuildingmembers!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),

            //Concrete Slabs
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: concreteSlabsLocationController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Concrete Slabs Location'),
                ),
              ),
            ),
            //Concrete Slabs Description
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: concreteSlabsDescriptionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Suspended Concrete Slabs Description'),
                ),
              ),
            ),
            //Suspended Concrete Slabs
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: suspendedConcreteSlabsLocationController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Suspended Concrete Slabs Location'),
                ),
              ),
            ),
            //Suspended Concrete Slabs
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: suspendedConcreteSlabsDescriptionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Suspended Concrete Slabs Description'),
                ),
              ),
            ),
            //Masonry Walls Location
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: masonryWallsLocationController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Masonry Walls Location'),
                ),
              ),
            ),
            //Masonry Walls Description
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: masonryWallsDescriptionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Masonry Walls Description'),
                ),
              ),
            ),
            //Piers Location
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: piersLocationController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Piers Location'),
                ),
              ),
            ),
            //Piers Description
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: piersDescriptionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Piers Description'),
                ),
              ),
            ),
            //Retaining Walls
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: retainingWallsLocationController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Retaining Walls Location'),
                ),
              ),
            ),
            //Retaining Walls
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: retainingWallsDescriptionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Retaining Walls Description'),
                ),
              ),
            ),
            //Other Areas
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: otherAreasLocationController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Other Areas Location'),
                ),
              ),
            ),
            //Other Areas Description
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: otherAreasDescriptionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Other Areas Description'),
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
                          updateCrackingBuildingMembersDetails(widget.reportId);
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
