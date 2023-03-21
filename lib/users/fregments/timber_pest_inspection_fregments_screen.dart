import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../api_connection/api_connection.dart';
import 'package:http/http.dart' as http;

class TimberPestInpectionFragentsScreen extends StatefulWidget {
  const TimberPestInpectionFragentsScreen({super.key});

  @override
  State<TimberPestInpectionFragentsScreen> createState() =>
      _TimberPestInpectionFragentsScreenState();
}

class _TimberPestInpectionFragentsScreenState
    extends State<TimberPestInpectionFragentsScreen> {
  List timberPestRecord = [];

  pdfBtnText(String pdfCreate) {
    if (pdfCreate == "0") {
      var pdftext = Text("Create");
      return pdftext;
    } else {
      var pdftext = Text("Download");
      return pdftext;

      //downloadRecord(timberPestRecord[index]["id"]);
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
      var res =
          await http.post(Uri.parse(API.timberpestcreatepdf), body: {"id": id});
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
          .post(Uri.parse(API.timberpestreportpdf), body: {"id": id});
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
          .post(Uri.parse(API.deletetimberpestreport), body: {"id": id});
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
      var responce = await http.get(Uri.parse(API.viewtimberpestreport));
      setState(() {
        timberPestRecord = jsonDecode(responce.body);
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
        title: Text('Timber & Pest Inspection Reports'),
        //automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: timberPestRecord.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: IconButton(
                onPressed: () {
                  //downloadRecord(timberPestRecord[index]["id"]);
                  deleteRecord(timberPestRecord[index]["id"]);
                },
                icon: Icon(Icons.delete),
              ),
              title: Text('Report ID: ' + timberPestRecord[index]["id"]),
              subtitle: Text('Client Name: ' +
                  timberPestRecord[index]["clientname"] +
                  '\nInvoice No.: ' +
                  timberPestRecord[index]["invoiceno"]),
              trailing: ElevatedButton(
                onPressed: () {
                  /*if (timberPestRecord[index]["pdfcreate"] == "0") {
                    createPdf(timberPestRecord[index]["id"]);
                  } else {
                    downloadPdf(timberPestRecord[index]["id"]);

                    //downloadRecord(timberPestRecord[index]["id"]);
                  }*/
                },
                child: pdfBtnText(timberPestRecord[index]["pdfcreate"]),
                //child: Text('Demo Text'),
              ),
            ),
          );
        },
      ),
    );
  }
}
