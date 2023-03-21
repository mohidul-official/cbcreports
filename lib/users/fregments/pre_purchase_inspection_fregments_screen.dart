import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../api_connection/api_connection.dart';
import 'package:http/http.dart' as http;

class PrePurchaseInspectionFragmentsScreen extends StatefulWidget {
  const PrePurchaseInspectionFragmentsScreen({super.key});

  @override
  State<PrePurchaseInspectionFragmentsScreen> createState() =>
      _PrePurchaseInspectionFragmentsScreenState();
}

class _PrePurchaseInspectionFragmentsScreenState
    extends State<PrePurchaseInspectionFragmentsScreen> {
  List purchaseRecord = [];

  pdfBtnText(String pdfCreate) {
    if (pdfCreate == "0") {
      var pdftext = Text("Create");
      return pdftext;
    } else {
      var pdftext = Text("Download");
      return pdftext;

      //downloadRecord(purchaseRecord[index]["id"]);
    }
  }

  downloadPdf(String id) {
    String url = API.prepurchasereportpdfurl + "report_id" + id + ".pdf";

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

  Future<void> createPdf(String id) async {
    try {
      var res = await http
          .post(Uri.parse(API.prepurchasecreatepdf), body: {"id": id});
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        print("Pdf Created Successfully");
        Fluttertoast.showToast(msg: "Pdf Created Successfully");
        downloadRecord(id);
        getRecord();
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
        getRecord();
      } else {
        print("Some Issue.");
        Fluttertoast.showToast(msg: "Some Issue.");
      }
    } catch (e) {
      print(e);

      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future<void> deleteRecord(String id) async {
    try {
      var res = await http
          .post(Uri.parse(API.deleteprepurchasereport), body: {"id": id});
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        //print("Record Deleted");
        Fluttertoast.showToast(msg: "Record Deleted");
        getRecord();
      } else {
        //print("Some Issue.");
        Fluttertoast.showToast(msg: "Some Issue.");
      }
    } catch (e) {
      //print(e);

      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future<void> getRecord() async {
    try {
      var responce = await http.get(Uri.parse(API.viewprepurchasereport));
      setState(() {
        purchaseRecord = jsonDecode(responce.body);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getRecord();
    //super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pre Purchase Inspection Reports'),
        //automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: purchaseRecord.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: IconButton(
                onPressed: () {
                  //downloadRecord(purchaseRecord[index]["id"]);
                  deleteRecord(purchaseRecord[index]["id"]);
                },
                icon: Icon(Icons.delete),
              ),
              title: Text('Report ID: ' + purchaseRecord[index]["id"]),
              subtitle: Text('Client Name: ' +
                  purchaseRecord[index]["clientname"] +
                  '\nInvoice No.: ' +
                  purchaseRecord[index]["invoiceno"]),
              trailing: ElevatedButton(
                onPressed: () {
                  if (purchaseRecord[index]["pdfcreate"] == "0") {
                    createPdf(purchaseRecord[index]["id"]);
                  } else {
                    downloadPdf(purchaseRecord[index]["id"]);

                    //downloadRecord(purchaseRecord[index]["id"]);
                  }
                },
                child: pdfBtnText(purchaseRecord[index]["pdfcreate"]),
              ),
            ),
          );
        },
      ),
    );
  }
}
