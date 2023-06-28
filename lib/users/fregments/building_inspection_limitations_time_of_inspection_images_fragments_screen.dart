import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

//import 'package:dio/dio.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http_parser/http_parser.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';

import '../../api_connection/api_connection.dart';
import 'package:http/http.dart' as http;

import 'building_inspection_description_identification_property_fragments_screen.dart';

class BuildingIspectionLimitationsTimeOfInspectionImageFragments
    extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  BuildingIspectionLimitationsTimeOfInspectionImageFragments(
      {Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildingIspectionLimitationsTimeOfInspectionImageFragments>
      createState() =>
          _BuildingIspectionLimitationsTimeOfInspectionImageFragmentsState();
}

class _BuildingIspectionLimitationsTimeOfInspectionImageFragmentsState
    extends State<BuildingIspectionLimitationsTimeOfInspectionImageFragments> {
  List<Asset> images = <Asset>[];
  Dio dio = new Dio();
  var successCount = 1;

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 100,
          height: 100,
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];

    try {
      resultList = await MultipleImagesPicker.pickImages(
        maxImages: 10,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#4287f5",
          actionBarTitle: "Select Images",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
    });
  }

  _saveImage(String id) async {
    if (images != null) {
      showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        },
      );
      for (var i = 0; i < images.length; i++) {
        ByteData byteData = await images[i].getByteData();
        List<int> imageData = byteData.buffer.asUint8List();
        MultipartFile multipartFile = MultipartFile.fromBytes(imageData,
            filename: images[i].name, contentType: MediaType('image', 'jpg'));

        FormData formData = FormData.fromMap(
            {'id': id, 'limitationsattimeofinspectionimage': multipartFile});
        try {
          var response = await dio.post(
              API.prepurchaselimitationtimeofinspectionimage,
              data: formData);
          if (response.statusCode == 200) {
            //Navigator.of(context, rootNavigator: true).pop();
            //print(response.data);

            /*Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    BuildingInspetionDescriptionIdentificationPropertyFragments(
                        reportId: id)));*/
            if (mounted) {
              setState(() {
                Fluttertoast.showToast(
                    msg: "Success: " + successCount.toString());
                successCount++;

                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        BuildingInspetionDescriptionIdentificationPropertyFragments(
                            reportId: id)));
              });
            }
          } else {
            //Naviga
            if (mounted) {
              setState(() {
                Navigator.of(context).pop();
              });
            }

            Fluttertoast.showToast(msg: response.data);
          }
        } catch (error) {
          //Naviga
          if (mounted) {
            setState(() {
              Navigator.of(context).pop();
            });
          }
          Fluttertoast.showToast(msg: error.toString());
          //print(error.toString());
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pre Purchase Reports"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
                'Limitations to the Inspection, apart from “Access Issues” noted above, and how these limitations, have affected the Inspection and/or the preparation of the report:'),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Center(child: Text('Select Images')),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: ElevatedButton(
                onPressed: () {
                  //updateAreasGainFactorsDetails(widget.reportId);
                  loadAssets();
                },
                child: Text('Picked Images')),
          ),
          Expanded(
            child: buildGridView(),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: ElevatedButton(
                onPressed: () {
                  _saveImage(widget.reportId);
                  //updateAreasGainFactorsDetails(widget.reportId);
                },
                child: Text('Save & Next')),
          ),
        ],
      ),
    );
  }
}
