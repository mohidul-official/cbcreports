import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../api_connection/api_connection.dart';

class HomeFragmentsScreen extends StatefulWidget {
  const HomeFragmentsScreen({super.key});

  @override
  State<HomeFragmentsScreen> createState() => _HomeFragmentsScreenState();
}

class _HomeFragmentsScreenState extends State<HomeFragmentsScreen> {
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

  Future<void> createPdf(String id) async {
    try {
      var res = await http
          .post(Uri.parse(API.prepurchasecreatepdf), body: {"id": id});
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
        print("Record Deleted");
        Fluttertoast.showToast(msg: "Record Deleted");
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
        title: Text('All Reports'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Pre Purchase Inspection Reports',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 300,
              child: ListView.builder(
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
                      title: Text(purchaseRecord[index]["id"]),
                      subtitle: Text(purchaseRecord[index]["invoiceno"]),
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
                      /*trailing: IconButton(
                        onPressed: () {
                          if (purchaseRecord[index]["pdfcreate"] == "0") {
                            createPdf(purchaseRecord[index]["id"]);
                          } else {
                            downloadPdf(purchaseRecord[index]["id"]);
                            
                            //downloadRecord(purchaseRecord[index]["id"]);
                          }
                        },
                        icon: Icon(Icons.download),
                      ),*/
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Pest & Termite Inspection Reports',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 300,
              child: ListView.builder(
                itemCount: purchaseRecord.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(purchaseRecord[index]["id"]),
                      subtitle: Text(purchaseRecord[index]["invoiceno"]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
