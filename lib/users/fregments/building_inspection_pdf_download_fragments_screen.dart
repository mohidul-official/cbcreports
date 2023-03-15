import 'dart:convert';

import 'package:cbcreports/users/fregments/dashboard_of_fregments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../api_connection/api_connection.dart';
import 'home_fregments_screen.dart';

class BuildingInspectionPdfDownloadFragments extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  //String pdfcreate;
  BuildingInspectionPdfDownloadFragments({Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildingInspectionPdfDownloadFragments> createState() =>
      _BuildingInspectionPdfDownloadFragmentsState();
}

class _BuildingInspectionPdfDownloadFragmentsState
    extends State<BuildingInspectionPdfDownloadFragments> {
  downloadPdf(String id) {
    //String url ="${API.prepurchasereportpdfurl}report_id13.pdf";
    String url = API.prepurchasereportpdfurl + "report_id" + id + ".pdf";
    //String url ="https://images.ctfassets.net/cjwb7umaxoxv/713rPUyTZ0bvn5YcwjLiN0/0013ddf191cba9084aa06c86d561ab01/1_Sqb5VpjIx7EcJkngTRSNFA__1_.png";
    //print(url);
    FileDownloader.downloadFile(
        url: url,
        onProgress: (name, progress) {
          Fluttertoast.showToast(msg: "Downloading...");
        },
        onDownloadCompleted: (value) {
          Fluttertoast.showToast(
              msg: "Download Successfull. View Your File From $value");
          print("path $value");
        },
        onDownloadError: (String error) {
          print('DOWNLOAD ERROR: $error');

          Fluttertoast.showToast(
              msg: "File Not Found...DOWNLOAD ERROR: $error");
        });
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
                  'Pdf Created Successfully',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  'Download The Pdf File Of This Report',
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
                          downloadPdf(widget.reportId);
                        },
                        child: Text('Download Pdf'),
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
