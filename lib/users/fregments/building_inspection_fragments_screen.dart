import 'dart:convert';

import 'package:cbcreports/api_connection/api_connection.dart';
import 'package:cbcreports/users/fregments/building_inspection_agreement_detailsfragments_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class BuildingInspectionFragmentsScreen extends StatefulWidget {
  const BuildingInspectionFragmentsScreen({super.key});

  @override
  State<BuildingInspectionFragmentsScreen> createState() =>
      _BuildingInspectionFragmentsScreenState();
}

class _BuildingInspectionFragmentsScreenState
    extends State<BuildingInspectionFragmentsScreen> {
  TextEditingController propertyAddressController = TextEditingController();
  TextEditingController clientNameController = TextEditingController();
  TextEditingController purchaserNameController = TextEditingController();
  TextEditingController venderController = TextEditingController();
  TextEditingController accountToController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController faxController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController invoiceNoController = TextEditingController();
  Future<void> insertRecord() async {
    try {
      var res = await http.post(Uri.parse(API.ppadministrationdetails), body: {
        "propertyaddress": propertyAddressController.text.trim(),
        "clientname": clientNameController.text.trim(),
        "purchaser": purchaserNameController.text.trim(),
        "vendor": venderController.text.trim(),
        "accountto": accountToController.text.trim(),
        "phone": phoneController.text.trim(),
        "fax": faxController.text.trim(),
        "emailaddress": emailAddressController.text.trim(),
        "invoiceno": invoiceNoController.text.trim(),
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == true) {
        String id = responce["id"];
        print("Report Id:" + id);
        //print("Record Inserted");
        Fluttertoast.showToast(msg: "Report Id:" + id);
        Fluttertoast.showToast(msg: "Record Inserted");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingInspectionAgreementFragments(reportId: id)));

        propertyAddressController.clear();
        clientNameController.clear();
        purchaserNameController.clear();
        venderController.clear();
        accountToController.clear();
        phoneController.clear();
        faxController.clear();
        emailAddressController.clear();
        invoiceNoController.clear();
      } else {
        //print("Some Issue.");

        Fluttertoast.showToast(msg: "Some Issue");
      }
    } catch (e) {
      //print(e);
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pre Purchase Inspection Reports'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Administration Details',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            //property address
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: propertyAddressController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Enter Property Address'),
                ),
              ),
            ),
            //client name
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: clientNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Enter Client Name'),
                ),
              ),
            ),
            //Purchaser Name
            /*Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: purchaserNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Enter Purchaser Name'),
                ),
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
            //Account to
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: accountToController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Enter Account to'),
                ),
              ),
            ),
            //Phone
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Enter Phone Number'),
                ),
              ),
            ),
            //Fax
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: faxController,
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
            ),*/
            //Invoice No
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: invoiceNoController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Enter Invoice No'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    insertRecord();
                  },
                  child: Text('Save & Next')),
            ),
          ],
        ),
      ),
    );
  }
}
