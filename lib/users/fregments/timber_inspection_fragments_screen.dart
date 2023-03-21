import 'dart:convert';

import 'package:cbcreports/users/fregments/timber_inspection_step_two_fragments_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../api_connection/api_connection.dart';
import 'package:http/http.dart' as http;

class TimberInspectionFragmentsScreen extends StatefulWidget {
  const TimberInspectionFragmentsScreen({super.key});

  @override
  State<TimberInspectionFragmentsScreen> createState() =>
      _TimberInspectionFragmentsScreenState();
}

class _TimberInspectionFragmentsScreenState
    extends State<TimberInspectionFragmentsScreen> {
  TextEditingController clientNameController = TextEditingController();
  TextEditingController accountToController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController faxController = TextEditingController();
  TextEditingController invoiceNoController = TextEditingController();
  Future<void> insertRecord() async {
    try {
      var res = await http
          .post(Uri.parse(API.timberpestinspectionsteponedetails), body: {
        "accountto": accountToController.text.trim(),
        "phone": phoneController.text.trim(),
        "fax": faxController.text.trim(),
        "clientname": clientNameController.text.trim(),
        "invoiceno": invoiceNoController.text.trim(),
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == true) {
        String id = responce["id"];
        print("Report Id:" + id);
        //print("Record Inserted");
        Fluttertoast.showToast(msg: "Record Inserted\nReport Id:" + id);
        //Fluttertoast.showToast(msg: "Record Inserted");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                TimberInspectionStepTwoFragmentsScreen(reportId: id)));
        clientNameController.clear();
        accountToController.clear();
        phoneController.clear();
        faxController.clear();
        invoiceNoController.clear();
      } else {
        //print("Some Issue.");

        Fluttertoast.showToast(msg: "Some Issue");
      }
    } catch (e) {
      print(e.toString());
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
                'Step 1:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
