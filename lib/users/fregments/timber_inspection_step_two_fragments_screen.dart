import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../api_connection/api_connection.dart';
import 'package:http/http.dart' as http;

class TimberInspectionStepTwoFragmentsScreen extends StatefulWidget {
  //const TimberInspectionStepTwoFragmentsScreen({super.key});

  String reportId;
  TimberInspectionStepTwoFragmentsScreen({Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<TimberInspectionStepTwoFragmentsScreen> createState() =>
      _TimberInspectionStepTwoFragmentsScreenState();
}

class _TimberInspectionStepTwoFragmentsScreenState
    extends State<TimberInspectionStepTwoFragmentsScreen> {
  TextEditingController propertyAddressController = TextEditingController();
  TextEditingController purchaserContactAddressController =
      TextEditingController();
  TextEditingController purchaserNameController = TextEditingController();
  TextEditingController venderController = TextEditingController();
  TextEditingController propertySuburbController = TextEditingController();
  TextEditingController purchaserPhoneController = TextEditingController();
  TextEditingController purchaserMobileController = TextEditingController();
  TextEditingController purchaserFaxController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController propertyPostCodeController = TextEditingController();
  Future<void> timberInspectionStepTwo(String id) async {
    try {
      var res = await http
          .post(Uri.parse(API.timberpestinspectionsteptwodetails), body: {
        "id": id,
        "vendor": venderController.text.trim(),
        "purchaser": purchaserNameController.text.trim(),
        "purchasercontactaddress":
            purchaserContactAddressController.text.trim(),
        "purchaserphone": purchaserPhoneController.text.trim(),
        "purchasermobile": purchaserMobileController.text.trim(),
        "purchaserfax": purchaserFaxController.text.trim(),
        "purchaseremailaddress": emailAddressController.text.trim(),
        "propertyaddress": propertyAddressController.text.trim(),
        "propertysuburb": propertySuburbController.text.trim(),
        "propertypostcode": propertyPostCodeController.text.trim(),
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        //print("Record Inserted");

        Fluttertoast.showToast(msg: "Record Inserted");
        /*Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingInspectionCrackingBuildingMemberFragments(
                    reportId: id)));*/
        /*undersideFlooringSystemController.clear();
        undersideFlooringSystemController.clear();
        piersPostsSupportsController.clear();
        termiteShieldingController.clear();
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
        title: Text('Timber & Pest Inspection Reports'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Step 2:',
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
            //Vendor Name
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: venderController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Enter Vendor'),
                ),
              ),
            ),
            //Purchaser Name
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: purchaserNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Enter Purchaser Name'),
                ),
              ),
            ),
            //Purchaser Contact Address
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: purchaserContactAddressController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Purchaser Contact Address'),
                ),
              ),
            ),
            //Phone
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: purchaserPhoneController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Enter Phone Number'),
                ),
              ),
            ),
            //Mobile
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: purchaserMobileController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Enter Mobile Number'),
                ),
              ),
            ),
            //Fax
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: purchaserFaxController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Enter Fax Details'),
                ),
              ),
            ),
            //Email Address
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: emailAddressController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Enter Email Address'),
                ),
              ),
            ),
            //Address of Property Inspected
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: propertyAddressController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Address of Property Inspected'),
                ),
              ),
            ),
            //Suburb
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: propertySuburbController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Enter Suburb'),
                ),
              ),
            ),
            //Post Code
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: propertyPostCodeController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Enter Suburb'),
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
                          timberInspectionStepTwo(widget.reportId);
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
