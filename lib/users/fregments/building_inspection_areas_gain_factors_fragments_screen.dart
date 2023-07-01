import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:multiselect/multiselect.dart';

import '../../api_connection/api_connection.dart';
import 'building_inspection_description_identification_property_fragments_screen.dart';
import 'building_inspection_limitations_time_of_inspection_images_fragments_screen.dart';

class BuildingIspectionAreasGrainFactorsFragments extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  BuildingIspectionAreasGrainFactorsFragments(
      {Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildingIspectionAreasGrainFactorsFragments> createState() =>
      _BuildingIspectionAreasGrainFactorsFragmentsState();
}

class _BuildingIspectionAreasGrainFactorsFragmentsState
    extends State<BuildingIspectionAreasGrainFactorsFragments> {
  TextEditingController otherAreasInspectedController = TextEditingController();
  TextEditingController areasNotInspectedInspectedController =
      TextEditingController();
  TextEditingController areasNotFullyInspectedInspectedController =
      TextEditingController();
  TextEditingController gainedAccessController = TextEditingController();
  TextEditingController apparentDefectsController = TextEditingController();
  TextEditingController informationProvidedInspectorController =
      TextEditingController();
  TextEditingController influencingTheInspectionController =
      TextEditingController();
  //var actualareasinspected = "NA";
  List<String> actualareasinspectedselected = [];
  var actualareasinspected = "NA";
  var anotherimageTwo = "NA";
  bool viewVisible = false;
  bool viewVisibleTwo = false;

  var limitationsyesno = "No Limitations at Time of Inspection";
  var limitationsis = "NA";
  var apparentdefects = "NA";

  var apparentdefectsvalue = "NA";
  var informationprovidedinspector = "NA";
  var informationprovidedinspectorvalue = "NA";

  var imagePath = "NA";
  var imageName = "NA";
  var imageData = "NA";

  var limitationsyesnotwoimagePath = "NA";
  var limitationsyesnotwoimageName = "NA";
  var limitationsyesnotwoimageData = "NA";

  var limitationsyesnothreeimagePath = "NA";
  var limitationsyesnothreeimageName = "NA";
  var limitationsyesnothreeimageData = "NA";

  /*File? apparentConcealmentImagePath;
  String? apparentConcealmentImageName;
  String? apparentConcealmentImageData;*/

  var apparentConcealmentImagePath = "NA";
  var apparentConcealmentImageName = "NA";
  var apparentConcealmentImageData = "NA";

  ImagePicker imagePicker = ImagePicker();

  Future<void> getImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File imagePath = File(getimage.path);

        imageName = getimage.path.split('/').last;
        imageData = base64Encode(imagePath.readAsBytesSync());

        print(imagePath);
        print(imageName);
        print(imageData);
      }
    });
  }

  Future<void> captureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File imagePath = File(getimage.path);
        imageName = getimage.path.split('/').last;
        imageData = base64Encode(imagePath.readAsBytesSync());

        print(imagePath);
        print(imageName);
        print(imageData);
      }
    });
  }

  Future<void> limitationsyesnotwogetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File limitationsyesnotwoimagePath = File(getimage.path);

        limitationsyesnotwoimageName = getimage.path.split('/').last;
        limitationsyesnotwoimageData =
            base64Encode(limitationsyesnotwoimagePath.readAsBytesSync());

        print(limitationsyesnotwoimagePath);
        print(limitationsyesnotwoimageName);
        print(limitationsyesnotwoimageData);
      }
    });
  }

  Future<void> limitationsyesnotwocaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File limitationsyesnotwoimagePath = File(getimage.path);

        limitationsyesnotwoimageName = getimage.path.split('/').last;
        limitationsyesnotwoimageData =
            base64Encode(limitationsyesnotwoimagePath.readAsBytesSync());

        print(limitationsyesnotwoimagePath);
        print(limitationsyesnotwoimageName);
        print(limitationsyesnotwoimageData);
      }
    });
  }

  Future<void> limitationsyesnothreegetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File limitationsyesnothreeimagePath = File(getimage.path);

        limitationsyesnothreeimageName = getimage.path.split('/').last;
        limitationsyesnothreeimageData =
            base64Encode(limitationsyesnothreeimagePath.readAsBytesSync());

        print(limitationsyesnothreeimagePath);
        print(limitationsyesnothreeimageName);
        print(limitationsyesnothreeimageData);
      }
    });
  }

  Future<void> limitationsyesnothreecaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File limitationsyesnothreeimagePath = File(getimage.path);

        limitationsyesnothreeimageName = getimage.path.split('/').last;
        limitationsyesnothreeimageData =
            base64Encode(limitationsyesnothreeimagePath.readAsBytesSync());

        print(limitationsyesnothreeimagePath);
        print(limitationsyesnothreeimageName);
        print(limitationsyesnothreeimageData);
      }
    });
  }

  Future<void> apparentConcealmentGetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File apparentConcealmentImagePath = File(getimage.path);
        apparentConcealmentImageName = getimage.path.split('/').last;
        apparentConcealmentImageData =
            base64Encode(apparentConcealmentImagePath.readAsBytesSync());
        print(apparentConcealmentImagePath);
        print(apparentConcealmentImageName);
        print(apparentConcealmentImageData);
      }
    });
  }

  Future<void> apparentConcealmentCaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File apparentConcealmentImagePath = File(getimage.path);
        apparentConcealmentImageName = getimage.path.split('/').last;
        apparentConcealmentImageData =
            base64Encode(apparentConcealmentImagePath.readAsBytesSync());
        print(apparentConcealmentImagePath);
        print(apparentConcealmentImageName);
        print(apparentConcealmentImageData);
      }
    });
  }

  Future<void> updateAreasGainFactorsDetails(String id) async {
    try {
      showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        },
      );
      var res = await http
          .post(Uri.parse(API.prepurchaseareasgainfactorsdetails), body: {
        "id": id,
        "actualareasinspected": actualareasinspected,
        "otherareasinspected": otherAreasInspectedController.text.trim(),
        "notinspected": areasNotInspectedInspectedController.text.trim(),
        "notfullyinspected":
            areasNotFullyInspectedInspectedController.text.trim(),
        "gainaccessandreinspect": gainedAccessController.text.trim(),
        "limitationsyesno": limitationsyesno,
        "limitationsis": limitationsis,
        //"possibledefects": apparentDefectsController.text.trim(),
        "possibledefects": apparentdefects,
        "apparentdefectsvalue": apparentdefectsvalue,
        //"informationprovidedinspector":informationProvidedInspectorController.text.trim(),
        "informationprovidedinspector": informationprovidedinspector,
        "informationprovidedinspectorvalue": informationprovidedinspectorvalue,
        "otherfactorsinfluencing":
            influencingTheInspectionController.text.trim(),
        "data": imageData,
        "name": imageName,
        "limitationsyesnotwoimagedata": limitationsyesnotwoimageData,
        "limitationsyesnotwoimagename": limitationsyesnotwoimageName,
        "limitationsyesnothreeimagedata": limitationsyesnothreeimageData,
        "limitationsyesnothreeimagename": limitationsyesnothreeimageName,
        "apparentconcealmentimagedata": apparentConcealmentImageData,
        "apparentconcealmentimagename": apparentConcealmentImageName,
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        Navigator.of(context).pop();
        //print("Record Inserted");

        Fluttertoast.showToast(msg: "Record Inserted");
        /*Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingIspectionLimitationsTimeOfInspectionImageFragments(
                    reportId: id)));*/
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingInspetionDescriptionIdentificationPropertyFragments(
                    reportId: id)));
        /*otherAreasInspectedController.clear();
        areasNotInspectedInspectedController.clear();
        areasNotFullyInspectedInspectedController.clear();
        gainedAccessController.clear();
        apparentDefectsController.clear();
        informationProvidedInspectorController.clear();*/
      } else {
        Navigator.of(context).pop();
        print("Some Issue.");
        Fluttertoast.showToast(msg: "Some Issue.");
      }
    } catch (e) {
      Navigator.of(context).pop();
      print(e);

      Fluttertoast.showToast(msg: e.toString());
    }
  }

  void hideWidget() {
    if (viewVisible == true) {
      setState(() {
        viewVisible = false;
        //Fluttertoast.showToast(msg: viewVisible.toString());

        limitationsyesnotwoimagePath = "NA";
        limitationsyesnotwoimageName = "NA";
        limitationsyesnotwoimageData = "NA";
      });
    } else {
      setState(() {
        viewVisible = true;
        //Fluttertoast.showToast(msg: viewVisible.toString());
      });
    }
  }

  void hidetwoWidget() {
    if (viewVisibleTwo == true) {
      setState(() {
        viewVisibleTwo = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());

        limitationsyesnothreeimagePath = "NA";
        limitationsyesnothreeimageName = "NA";
        limitationsyesnothreeimageData = "NA";
      });
    } else {
      setState(() {
        viewVisibleTwo = true;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());
      });
    }
  }

  conditionCheck() {
    if (limitationsyesno == "The limitations were") {
      return DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text('The limitations were:'),
        ),
        value: limitationsis,
        items: [
          DropdownMenuItem(
            child: Text('-Select-'),
            value: "NA",
          ),
          DropdownMenuItem(
            child: Text(
                'Subfloor was on slope, A thorough\n inspection of the full subfloor\n was not possible. There might\n be few structural or timber\n pest issues which went unnoticed.\n\n'),
            value:
                "Subfloor was on slope, A thorough inspection of the full subfloor was not possible. There might be few structural or timber pest issues which went unnoticed.",
          ),
          DropdownMenuItem(
            child: Text(
                'A thorough inspection was not possible\n due to obstructions from heat/cooling\n pipes. There might be few structural\n or timber pest issues which\n went unnoticed.\n\n'),
            value:
                "A thorough inspection was not possible due to obstructions from heat/cooling pipes. There might be few structural or timber pest issues which went unnoticed.",
          ),
          DropdownMenuItem(
            child: Text(
                'A thorough inspection was not\n possible due to wet conditions under\n the subfloor. There might be few\n structural or timber pest issues\n which went unnoticed.\n\n'),
            value:
                "A thorough inspection was not possible due to wet conditions under the subfloor. There might be few structural or timber pest issues which went unnoticed.",
          ),
        ],
        onChanged: (limitationsis) {
          setState(() {
            this.limitationsis = limitationsis!;
            //print(personsinattendance);
          });
        },
      );
    }
  }

  apparentdefectsCheck() {
    if (apparentdefects ==
        "Evidence of apparent concealed defect(s) was seen and details were") {
      setState(() {
        apparentdefectsvalue =
            "Dwelling was recently painted. It could have done to conceal few previous defects.";
      });

      return Text(
          'Dwelling was recently painted. It could have done to conceal few previous defects.');
    } else {
      setState(() {
        apparentdefectsvalue = " ";
      });
    }
  }

  informationprovidedinspectorCheck() {
    if (informationprovidedinspector ==
        "Additional Information provided to inspector was") {
      return DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text('Additional Information provided to inspector was'),
        ),
        value: informationprovidedinspectorvalue,
        items: [
          DropdownMenuItem(
            child: Text('-SELECT-'),
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
        onChanged: (informationprovidedinspectorvalue) {
          setState(() {
            this.informationprovidedinspectorvalue =
                informationprovidedinspectorvalue!;
            //print(personsinattendance);
          });
        },
      );
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
                'Areas Inspected and Restrictions to the Inspection',
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
            //The Actual Areas Inspected were

            Container(
              margin: EdgeInsets.all(10),
              child: DropDownMultiSelect(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('The Actual Areas Inspected were'),
                ),
                options: [
                  'The Building Interior',
                  'The Building Exterior',
                  'The Roof Space',
                  'The Roof Exterior',
                  'The Subfloor',
                  'The Site'
                ],
                selectedValues: actualareasinspectedselected,
                onChanged: (List<String> actualareasinspectedx) {
                  setState(() {
                    actualareasinspectedselected = actualareasinspectedx;
                    actualareasinspected =
                        actualareasinspectedselected.join(", ");
                  });
                },
              ),
            ),

            //Other Areas Inspected were:
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: otherAreasInspectedController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Other Areas Inspected were:'),
                ),
              ),
            ),
            //	Restrictions

            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Restrictions',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            //Areas NOT Inspected Including Reason(s) were
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: areasNotInspectedInspectedController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Areas NOT Inspected Including Reasons were'),
                ),
              ),
            ),
            //Areas NOT Fully Inspected Including Reason(s) were
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: areasNotFullyInspectedInspectedController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label:
                      Text('Areas NOT Fully Inspected Including Reasons were'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Recommendations to Gain Access and Reinspect',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            //The Area(s) and/or Section(s) to which Access should be gained or fully gained are
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: gainedAccessController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                      'The Area(s) and/or Section(s) to which Access should be gained or fully gained are'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Factors that Influenced the Inspection/Report Outcome',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Limitations to the Inspection, apart from “Access Issues” noted above, and how these limitations, have affected the Inspection and/or the preparation of the report:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
            //The Actual Areas Inspected were
            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  //label: Text(''),
                ),
                value: limitationsyesno,
                items: [
                  DropdownMenuItem(
                    child: Text('The limitations were'),
                    value: "The limitations were",
                  ),
                  DropdownMenuItem(
                    child: Text('No Limitations at Time of Inspection'),
                    value: "No Limitations at Time of Inspection",
                  ),
                ],
                onChanged: (limitationsyesno) {
                  setState(() {
                    this.limitationsyesno = limitationsyesno!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: conditionCheck(),
            ),

            Container(
              margin: EdgeInsets.all(10),
              child: imageData != "NA"
                  ? Image.memory(base64Decode(imageData))
                  : Text('Image Not Choose Yet'),
              //child: Text('Image Goes Here'),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          captureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          getImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),

            //1st Add More Button
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    Fluttertoast.showToast(msg: "Add More Image");
                    //conditionCheck();
                    hideWidget();
                  },
                  child: Text('Add More Image')),
            ),

            //1st Add More Image
            Container(
              child: Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: viewVisible,
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: limitationsyesnotwoimageData != "NA"
                              ? Image.memory(
                                  base64Decode(limitationsyesnotwoimageData))
                              : Text('Image Not Choose Yet'),
                          //child: Text('Image Goes Here'),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: ElevatedButton(
                                    onPressed: () {
                                      limitationsyesnotwocaptureImage();
                                    },
                                    child: Text('Capture Image')),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: ElevatedButton(
                                    onPressed: () {
                                      limitationsyesnotwogetImage();
                                    },
                                    child: Text('Choose Image')),
                              ),
                            ],
                          ),
                        ),

                        //2nd Add More Button
                        Container(
                          margin: EdgeInsets.all(10),
                          child: ElevatedButton(
                              onPressed: () {
                                Fluttertoast.showToast(msg: "Add More Image");
                                //conditionCheck();
                                hidetwoWidget();
                              },
                              child: Text('Add More Image')),
                        ),
                      ],
                    ),
                  )),
            ),

            //2nd Add More Image
            Container(
              child: Visibility(
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                visible: viewVisibleTwo,
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: limitationsyesnothreeimageData != "NA"
                            ? Image.memory(
                                base64Decode(limitationsyesnothreeimageData))
                            : Text('Image Not Choose Yet'),
                        //child: Text('Image Goes Here'),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    limitationsyesnothreecaptureImage();
                                  },
                                  child: Text('Capture Image')),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    limitationsyesnothreegetImage();
                                  },
                                  child: Text('Choose Image')),
                            ),
                          ],
                        ),
                      ),

                      //3rd Add More Button
                      /*Container(
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton(
                            onPressed: () {
                              Fluttertoast.showToast(msg: "Add More Image");
                              //conditionCheck();
                              hideWidgetTwo();
                            },
                            child: Text('Add More Image')),
                      ),*/
                    ],
                  ),
                ),
              ),
            ),
            //Details of Apparent concealment of possible defects:
            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                      'Details of Apparent concealment of possible defects:'),
                ),
                value: apparentdefects,
                items: [
                  DropdownMenuItem(
                    child: Text('-Select-'),
                    value: "NA",
                  ),
                  DropdownMenuItem(
                    child: Text(
                        'Evidence of apparent concealed\n defect(s) was seen and details were\n\n '),
                    value:
                        "Evidence of apparent concealed defect(s) was seen and details were",
                  ),
                  DropdownMenuItem(
                    child: Text(
                        'No visual sign of apparent\n concealment observed'),
                    value: "No visual sign of apparent concealment observed",
                  ),
                ],
                onChanged: (apparentdefects) {
                  setState(() {
                    this.apparentdefects = apparentdefects!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: apparentdefectsCheck(),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: apparentConcealmentImageData != "NA"
                  ? Image.memory(base64Decode(apparentConcealmentImageData))
                  : Text('Image Not Choose Yet'),
              //child: Text('Image Goes Here'),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          apparentConcealmentCaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          apparentConcealmentGetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),
            //Information provided to the Inspector that has a bearing on the Inspection and/or Report and from whom and when that information was provided:
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                  'Information provided to the Inspector that has a bearing on the Inspection and/or Report and from whom and when that information was provided:'),
            ),

            //Information provided to the Inspector that has a bearing on the Inspection and/or Report and from whom and when that information was provided:
            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  //label: Text('Details of Apparent concealment of possible defects:'),
                ),
                value: informationprovidedinspector,
                items: [
                  DropdownMenuItem(
                    child: Text('-Select-'),
                    value: "NA",
                  ),
                  DropdownMenuItem(
                    child: Text(
                        'Additional Information provided to\ninspector was\n'),
                    value: "Additional Information provided to inspector was",
                  ),
                  DropdownMenuItem(
                    child:
                        Text('There was no additional information\n provided'),
                    value: "There was no additional information provided",
                  ),
                ],
                onChanged: (informationprovidedinspector) {
                  setState(() {
                    this.informationprovidedinspector =
                        informationprovidedinspector!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: informationprovidedinspectorCheck(),
            ),
            //Details of Other Factors influencing the inspection:
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: influencingTheInspectionController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                      'Details of Other Factors influencing the inspection: '),
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
                          updateAreasGainFactorsDetails(widget.reportId);
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
