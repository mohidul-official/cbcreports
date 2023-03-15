import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../../api_connection/api_connection.dart';
import 'building_inspection_pdf_download_fragments_screen.dart';
import 'dashboard_of_fregments.dart';

class BuildInspectionPdfCreateFragments extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  //String pdfcreate;
  BuildInspectionPdfCreateFragments({Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildInspectionPdfCreateFragments> createState() =>
      _BuildInspectionPdfCreateFragmentsState();
}

class _BuildInspectionPdfCreateFragmentsState
    extends State<BuildInspectionPdfCreateFragments> {
  Future<void> createPdf(String id) async {
    try {
      var res = await http
          .post(Uri.parse(API.prepurchasecreatepdf), body: {"id": id});
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        print("Pdf Created Successfully");
        Fluttertoast.showToast(msg: "Pdf Created Successfully");

        downloadRecord(id);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingInspectionPdfDownloadFragments(reportId: id)));
      } else {
        print("Some Issue.");
        Fluttertoast.showToast(msg: "Some Issue.");
      }
    } catch (e) {
      print(e);

      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future<void> downloadRecord(String id) async {
    try {
      var res = await http
          .post(Uri.parse(API.prepurchasereportpdf), body: {"id": id});
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        print("Pdf Created Successfully");
        Fluttertoast.showToast(msg: "Pdf Created Successfully");
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
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  'Report Submitted Successfully',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  'Create The Pdf File Of This Report',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          createPdf(widget.reportId);
                        },
                        child: Text('Create Pdf'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DashboardOfFragments()));
                        },
                        child: Text('Go To Home'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
