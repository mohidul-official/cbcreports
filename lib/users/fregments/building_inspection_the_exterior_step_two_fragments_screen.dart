import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../api_connection/api_connection.dart';
import 'package:http/http.dart' as http;

import 'building_inspection_the_exterior_step_three_fragments_screen.dart';

class BuildingInspectorTheExteriorStepTwoFragments extends StatefulWidget {
  //const BuildingInspectionAgreementFragments({super.key});

  String reportId;
  BuildingInspectorTheExteriorStepTwoFragments(
      {Key? myKey, required this.reportId})
      : super(key: myKey);

  @override
  State<BuildingInspectorTheExteriorStepTwoFragments> createState() =>
      _BuildingInspectorTheExteriorStepTwoFragmentsState();
}

class _BuildingInspectorTheExteriorStepTwoFragmentsState
    extends State<BuildingInspectorTheExteriorStepTwoFragments> {
  /*TextEditingController timberSteelStructuresController =
      TextEditingController();

  TextEditingController stairsController = TextEditingController();

  TextEditingController balustradesController = TextEditingController();

  TextEditingController balconiesController = TextEditingController();

  TextEditingController verandasController = TextEditingController();*/

  bool viewVisible = false;
  bool viewVisibleTwo = false;
  bool viewVisibleThree = false;

  bool viewstairsVisible = false;
  bool viewstairsVisibleTwo = false;
  bool viewstairsVisibleThree = false;

  bool viewbalustradesVisible = false;
  bool viewbalustradesVisibleTwo = false;
  bool viewbalustradesVisibleThree = false;

  bool viewbalconiesVisible = false;
  bool viewbalconiesVisibleTwo = false;
  bool viewbalconiesVisibleThree = false;

  bool viewverandasVisible = false;
  bool viewverandasVisibleTwo = false;
  bool viewverandasVisibleThree = false;

  var timberimagePath = "NA";
  var timberimageName = "NA";
  var timberimageData = "NA";

  var timbertwoimagePath = "NA";
  var timbertwoimageName = "NA";
  var timbertwoimageData = "NA";

  var timberthreeimagePath = "NA";
  var timberthreeimageName = "NA";
  var timberthreeimageData = "NA";

  var timberfourimagePath = "NA";
  var timberfourimageName = "NA";
  var timberfourimageData = "NA";

  var stairsimagePath = "NA";
  var stairsimageName = "NA";
  var stairsimageData = "NA";

  var stairstwoimagePath = "NA";
  var stairstwoimageName = "NA";
  var stairstwoimageData = "NA";

  var stairsthreeimagePath = "NA";
  var stairsthreeimageName = "NA";
  var stairsthreeimageData = "NA";

  var stairsfourimagePath = "NA";
  var stairsfourimageName = "NA";
  var stairsfourimageData = "NA";

  var balustradesimagePath = "NA";
  var balustradesimageName = "NA";
  var balustradesimageData = "NA";

  var balustradestwoimagePath = "NA";
  var balustradestwoimageName = "NA";
  var balustradestwoimageData = "NA";

  var balustradesthreeimagePath = "NA";
  var balustradesthreeimageName = "NA";
  var balustradesthreeimageData = "NA";

  var balustradesfourimagePath = "NA";
  var balustradesfourimageName = "NA";
  var balustradesfourimageData = "NA";

  var balconiesimagePath = "NA";
  var balconiesimageName = "NA";
  var balconiesimageData = "NA";

  var balconiestwoimagePath = "NA";
  var balconiestwoimageName = "NA";
  var balconiestwoimageData = "NA";

  var balconiesthreeimagePath = "NA";
  var balconiesthreeimageName = "NA";
  var balconiesthreeimageData = "NA";

  var balconiesfourimagePath = "NA";
  var balconiesfourimageName = "NA";
  var balconiesfourimageData = "NA";

  var verandasimagePath = "NA";
  var verandasimageName = "NA";
  var verandasimageData = "NA";

  var limitationsyesnotwoimagePath = "NA";
  var limitationsyesnotwoimageName = "NA";
  var limitationsyesnotwoimageData = "NA";

  var limitationsyesnothreeimagePath = "NA";
  var limitationsyesnothreeimageName = "NA";
  var limitationsyesnothreeimageData = "NA";

  var limitationsyesnofourimagePath = "NA";
  var limitationsyesnofourimageName = "NA";
  var limitationsyesnofourimageData = "NA";

  var exteriordefectstimber = "NA";

  var exteriordefectsstairs = "NA";

  var exteriordefectsbalustrades = "NA";

  var exteriordefectsbalconies = "NA";
  var exteriordefectsbalconiesvalue = "NA";

  var exteriordefectsverandas = "NA";
  var exteriordefectsverandasvalue = "NA";

  ImagePicker imagePicker = ImagePicker();

  Future<void> timbergetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File timberimagePath = File(getimage.path);
        timberimageName = getimage.path.split('/').last;
        timberimageData = base64Encode(timberimagePath.readAsBytesSync());
        print(timberimagePath);
        print(timberimageName);
        print(timberimageData);
      }
    });
  }

  Future<void> timbercaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File timberimagePath = File(getimage.path);
        timberimageName = getimage.path.split('/').last;
        timberimageData = base64Encode(timberimagePath.readAsBytesSync());
        print(timberimagePath);
        print(timberimageName);
        print(timberimageData);
      }
    });
  }

  Future<void> timbertwogetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File timbertwoimagePath = File(getimage.path);

        timbertwoimageName = getimage.path.split('/').last;
        timbertwoimageData = base64Encode(timbertwoimagePath.readAsBytesSync());

        print(timbertwoimagePath);
        print(timbertwoimageName);
        print(timbertwoimageData);
      }
    });
  }

  Future<void> timbertwocaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File timbertwoimagePath = File(getimage.path);

        timbertwoimageName = getimage.path.split('/').last;
        timbertwoimageData = base64Encode(timbertwoimagePath.readAsBytesSync());

        print(timbertwoimagePath);
        print(timbertwoimageName);
        print(timbertwoimageData);
      }
    });
  }

  Future<void> timberthreegetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File timberthreeimagePath = File(getimage.path);

        timberthreeimageName = getimage.path.split('/').last;
        timberthreeimageData =
            base64Encode(timberthreeimagePath.readAsBytesSync());

        print(timberthreeimagePath);
        print(timberthreeimageName);
        print(timberthreeimageData);
      }
    });
  }

  Future<void> timberthreecaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File timberthreeimagePath = File(getimage.path);

        timberthreeimageName = getimage.path.split('/').last;
        timberthreeimageData =
            base64Encode(timberthreeimagePath.readAsBytesSync());

        print(timberthreeimagePath);
        print(timberthreeimageName);
        print(timberthreeimageData);
      }
    });
  }

  Future<void> timberfourgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File timberfourimagePath = File(getimage.path);

        timberfourimageName = getimage.path.split('/').last;
        timberfourimageData =
            base64Encode(timberfourimagePath.readAsBytesSync());

        print(timberfourimagePath);
        print(timberfourimageName);
        print(timberfourimageData);
      }
    });
  }

  Future<void> timberfourcaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File timberfourimagePath = File(getimage.path);

        timberfourimageName = getimage.path.split('/').last;
        timberfourimageData =
            base64Encode(timberfourimagePath.readAsBytesSync());

        print(timberfourimagePath);
        print(timberfourimageName);
        print(timberfourimageData);
      }
    });
  }

  Future<void> stairsgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File stairsimagePath = File(getimage.path);
        stairsimageName = getimage.path.split('/').last;
        stairsimageData = base64Encode(stairsimagePath.readAsBytesSync());
        print(stairsimagePath);
        print(stairsimageName);
        print(stairsimageData);
      }
    });
  }

  Future<void> stairscaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File stairsimagePath = File(getimage.path);
        stairsimageName = getimage.path.split('/').last;
        stairsimageData = base64Encode(stairsimagePath.readAsBytesSync());
        print(stairsimagePath);
        print(stairsimageName);
        print(stairsimageData);
      }
    });
  }

  Future<void> stairstwogetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File stairstwoimagePath = File(getimage.path);

        stairstwoimageName = getimage.path.split('/').last;
        stairstwoimageData = base64Encode(stairstwoimagePath.readAsBytesSync());

        print(stairstwoimagePath);
        print(stairstwoimageName);
        print(stairstwoimageData);
      }
    });
  }

  Future<void> stairstwocaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File stairstwoimagePath = File(getimage.path);

        stairstwoimageName = getimage.path.split('/').last;
        stairstwoimageData = base64Encode(stairstwoimagePath.readAsBytesSync());

        print(stairstwoimagePath);
        print(stairstwoimageName);
        print(stairstwoimageData);
      }
    });
  }

  Future<void> stairsthreegetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File stairsthreeimagePath = File(getimage.path);

        stairsthreeimageName = getimage.path.split('/').last;
        stairsthreeimageData =
            base64Encode(stairsthreeimagePath.readAsBytesSync());

        print(stairsthreeimagePath);
        print(stairsthreeimageName);
        print(stairsthreeimageData);
      }
    });
  }

  Future<void> stairsthreecaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File stairsthreeimagePath = File(getimage.path);

        stairsthreeimageName = getimage.path.split('/').last;
        stairsthreeimageData =
            base64Encode(stairsthreeimagePath.readAsBytesSync());

        print(stairsthreeimagePath);
        print(stairsthreeimageName);
        print(stairsthreeimageData);
      }
    });
  }

  Future<void> stairsfourgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File stairsfourimagePath = File(getimage.path);

        stairsfourimageName = getimage.path.split('/').last;
        stairsfourimageData =
            base64Encode(stairsfourimagePath.readAsBytesSync());

        print(stairsfourimagePath);
        print(stairsfourimageName);
        print(stairsfourimageData);
      }
    });
  }

  Future<void> stairsfourcaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File stairsfourimagePath = File(getimage.path);

        stairsfourimageName = getimage.path.split('/').last;
        stairsfourimageData =
            base64Encode(stairsfourimagePath.readAsBytesSync());

        print(stairsfourimagePath);
        print(stairsfourimageName);
        print(stairsfourimageData);
      }
    });
  }

  Future<void> balustradesgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File balustradesimagePath = File(getimage.path);
        balustradesimageName = getimage.path.split('/').last;
        balustradesimageData =
            base64Encode(balustradesimagePath.readAsBytesSync());
        print(balustradesimagePath);
        print(balustradesimageName);
        print(balustradesimageData);
      }
    });
  }

  Future<void> balustradescaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File balustradesimagePath = File(getimage.path);
        balustradesimageName = getimage.path.split('/').last;
        balustradesimageData =
            base64Encode(balustradesimagePath.readAsBytesSync());
        print(balustradesimagePath);
        print(balustradesimageName);
        print(balustradesimageData);
      }
    });
  }

  Future<void> balustradestwogetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File balustradestwoimagePath = File(getimage.path);

        balustradestwoimageName = getimage.path.split('/').last;
        balustradestwoimageData =
            base64Encode(balustradestwoimagePath.readAsBytesSync());

        print(balustradestwoimagePath);
        print(balustradestwoimageName);
        print(balustradestwoimageData);
      }
    });
  }

  Future<void> balustradestwocaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File balustradestwoimagePath = File(getimage.path);

        balustradestwoimageName = getimage.path.split('/').last;
        balustradestwoimageData =
            base64Encode(balustradestwoimagePath.readAsBytesSync());

        print(balustradestwoimagePath);
        print(balustradestwoimageName);
        print(balustradestwoimageData);
      }
    });
  }

  Future<void> balustradesthreegetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File balustradesthreeimagePath = File(getimage.path);

        balustradesthreeimageName = getimage.path.split('/').last;
        balustradesthreeimageData =
            base64Encode(balustradesthreeimagePath.readAsBytesSync());

        print(balustradesthreeimagePath);
        print(balustradesthreeimageName);
        print(balustradesthreeimageData);
      }
    });
  }

  Future<void> balustradesthreecaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File balustradesthreeimagePath = File(getimage.path);

        balustradesthreeimageName = getimage.path.split('/').last;
        balustradesthreeimageData =
            base64Encode(balustradesthreeimagePath.readAsBytesSync());

        print(balustradesthreeimagePath);
        print(balustradesthreeimageName);
        print(balustradesthreeimageData);
      }
    });
  }

  Future<void> balustradesfourgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File balustradesfourimagePath = File(getimage.path);

        balustradesfourimageName = getimage.path.split('/').last;
        balustradesfourimageData =
            base64Encode(balustradesfourimagePath.readAsBytesSync());

        print(balustradesfourimagePath);
        print(balustradesfourimageName);
        print(balustradesfourimageData);
      }
    });
  }

  Future<void> balustradesfourcaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File balustradesfourimagePath = File(getimage.path);

        balustradesfourimageName = getimage.path.split('/').last;
        balustradesfourimageData =
            base64Encode(balustradesfourimagePath.readAsBytesSync());

        print(balustradesfourimagePath);
        print(balustradesfourimageName);
        print(balustradesfourimageData);
      }
    });
  }

  Future<void> balconiesgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File balconiesimagePath = File(getimage.path);
        balconiesimageName = getimage.path.split('/').last;
        balconiesimageData = base64Encode(balconiesimagePath.readAsBytesSync());
        print(balconiesimagePath);
        print(balconiesimageName);
        print(balconiesimageData);
      }
    });
  }

  Future<void> balconiescaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File balconiesimagePath = File(getimage.path);
        balconiesimageName = getimage.path.split('/').last;
        balconiesimageData = base64Encode(balconiesimagePath.readAsBytesSync());
        print(balconiesimagePath);
        print(balconiesimageName);
        print(balconiesimageData);
      }
    });
  }

  Future<void> balconiestwogetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File balconiestwoimagePath = File(getimage.path);

        balconiestwoimageName = getimage.path.split('/').last;
        balconiestwoimageData =
            base64Encode(balconiestwoimagePath.readAsBytesSync());

        print(balconiestwoimagePath);
        print(balconiestwoimageName);
        print(balconiestwoimageData);
      }
    });
  }

  Future<void> balconiestwocaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File balconiestwoimagePath = File(getimage.path);

        balconiestwoimageName = getimage.path.split('/').last;
        balconiestwoimageData =
            base64Encode(balconiestwoimagePath.readAsBytesSync());

        print(balconiestwoimagePath);
        print(balconiestwoimageName);
        print(balconiestwoimageData);
      }
    });
  }

  Future<void> balconiesthreegetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File balconiesthreeimagePath = File(getimage.path);

        balconiesthreeimageName = getimage.path.split('/').last;
        balconiesthreeimageData =
            base64Encode(balconiesthreeimagePath.readAsBytesSync());

        print(balconiesthreeimagePath);
        print(balconiesthreeimageName);
        print(balconiesthreeimageData);
      }
    });
  }

  Future<void> balconiesthreecaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File balconiesthreeimagePath = File(getimage.path);

        balconiesthreeimageName = getimage.path.split('/').last;
        balconiesthreeimageData =
            base64Encode(balconiesthreeimagePath.readAsBytesSync());

        print(balconiesthreeimagePath);
        print(balconiesthreeimageName);
        print(balconiesthreeimageData);
      }
    });
  }

  Future<void> balconiesfourgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File balconiesfourimagePath = File(getimage.path);

        balconiesfourimageName = getimage.path.split('/').last;
        balconiesfourimageData =
            base64Encode(balconiesfourimagePath.readAsBytesSync());

        print(balconiesfourimagePath);
        print(balconiesfourimageName);
        print(balconiesfourimageData);
      }
    });
  }

  Future<void> balconiesfourcaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File balconiesfourimagePath = File(getimage.path);

        balconiesfourimageName = getimage.path.split('/').last;
        balconiesfourimageData =
            base64Encode(balconiesfourimagePath.readAsBytesSync());

        print(balconiesfourimagePath);
        print(balconiesfourimageName);
        print(balconiesfourimageData);
      }
    });
  }

  Future<void> verandasgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File verandasimagePath = File(getimage.path);
        verandasimageName = getimage.path.split('/').last;
        verandasimageData = base64Encode(verandasimagePath.readAsBytesSync());
        print(verandasimagePath);
        print(verandasimageName);
        print(verandasimageData);
      }
    });
  }

  Future<void> verandascaptureImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File verandasimagePath = File(getimage.path);
        verandasimageName = getimage.path.split('/').last;
        verandasimageData = base64Encode(verandasimagePath.readAsBytesSync());
        print(verandasimagePath);
        print(verandasimageName);
        print(verandasimageData);
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

  Future<void> limitationsyesnofourgetImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    //var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File limitationsyesnofourimagePath = File(getimage.path);

        limitationsyesnofourimageName = getimage.path.split('/').last;
        limitationsyesnofourimageData =
            base64Encode(limitationsyesnofourimagePath.readAsBytesSync());

        print(limitationsyesnofourimagePath);
        print(limitationsyesnofourimageName);
        print(limitationsyesnofourimageData);
      }
    });
  }

  Future<void> limitationsyesnofourcaptureImage() async {
    ///var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    var getimage = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (getimage == null) {
        return;
      } else {
        File limitationsyesnofourimagePath = File(getimage.path);

        limitationsyesnofourimageName = getimage.path.split('/').last;
        limitationsyesnofourimageData =
            base64Encode(limitationsyesnofourimagePath.readAsBytesSync());

        print(limitationsyesnofourimagePath);
        print(limitationsyesnofourimageName);
        print(limitationsyesnofourimageData);
      }
    });
  }

  exteriordefectsbalconiesCheck() {
    if (exteriordefectsbalconies == "Defects/Safety Hazards found were") {
      return DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text('Defects/Safety Hazards found were'),
        ),
        value: exteriordefectsbalconiesvalue,
        items: [
          DropdownMenuItem(
            child: Text('-Select-'),
            value: "NA",
          ),
          DropdownMenuItem(
            child: Text('Tiles are cracked.'),
            value: "Tiles are cracked.",
          ),
          DropdownMenuItem(
            child: Text('Grouting is damaged.'),
            value: "Grouting is damaged.",
          ),
        ],
        onChanged: (exteriordefectsbalconiesvalue) {
          setState(() {
            this.exteriordefectsbalconiesvalue = exteriordefectsbalconiesvalue!;
            //print(personsinattendance);
          });
        },
      );
    }
  }

  exteriordefectsverandasCheck() {
    if (exteriordefectsverandas == "Defects/Safety Hazards found were") {
      setState(() {
        exteriordefectsverandasvalue =
            "Retaining wall was weathered. It is recommended to contact a certified carpenter for further advise.";
      });

      return Text(
          'Retaining wall was weathered. It is recommended to contact a certified carpenter for further advise.');
    } else {
      setState(() {
        exteriordefectsverandasvalue = " ";
      });
    }
  }

  Future<void> updateTheExteriorDetails(String id) async {
    try {
      showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        },
      );
      var res = await http
          .post(Uri.parse(API.prepurchasetheexteriorsteptwodetails), body: {
        "id": id,
        //"exteriordefectstimber": timberSteelStructuresController.text.trim(),
        "exteriordefectstimber": exteriordefectstimber,
        //"exteriordefectsstairs": stairsController.text.trim(),
        "exteriordefectsstairs": exteriordefectsstairs,
        //"exteriordefectsbalustrades": balustradesController.text.trim(),
        "exteriordefectsbalustrades": exteriordefectsbalustrades,
        //"exteriordefectsbalconies": balconiesController.text.trim(),
        "exteriordefectsbalconies": exteriordefectsbalconies,
        "exteriordefectsbalconiesvalue": exteriordefectsbalconiesvalue,
        //"exteriordefectsverandas": verandasController.text.trim(),
        "exteriordefectsverandas": exteriordefectsverandas,
        "exteriordefectsverandasvalue": exteriordefectsverandasvalue,
        "timberimagedata": timberimageData,
        "timberimagename": timberimageName,
        "timbertwoimagedata": timbertwoimageData,
        "timbertwoimagename": timbertwoimageName,
        "timberthreeimagedata": timberthreeimageData,
        "timberthreeimagename": timberthreeimageName,
        "timberfourimagedata": timberfourimageData,
        "timberfourimagename": timberfourimageName,
        "stairsimagedata": stairsimageData,
        "stairsimagename": stairsimageName,
        "stairstwoimagedata": stairstwoimageData,
        "stairstwoimagename": stairstwoimageName,
        "stairsthreeimagedata": stairsthreeimageData,
        "stairsthreeimagename": stairsthreeimageName,
        "stairsfourimagedata": stairsfourimageData,
        "stairsfourimagename": stairsfourimageName,
        "balustradesimagedata": balustradesimageData,
        "balustradesimagename": balustradesimageName,
        "balustradestwoimagedata": balustradestwoimageData,
        "balustradestwoimagename": balustradestwoimageName,
        "balustradesthreeimagedata": balustradesthreeimageData,
        "balustradesthreeimagename": balustradesthreeimageName,
        "balustradesfourimagedata": balustradesfourimageData,
        "balustradesfourimagename": balustradesfourimageName,
        "balconiesimagedata": balconiesimageData,
        "balconiesimagename": balconiesimageName,
        "balconiestwoimagedata": balconiestwoimageData,
        "balconiestwoimagename": balconiestwoimageName,
        "balconiesthreeimagedata": balconiesthreeimageData,
        "balconiesthreeimagename": balconiesthreeimageName,
        "balconiesfourimagedata": balconiesfourimageData,
        "balconiesfourimagename": balconiesfourimageName,
        "verandasimagedata": verandasimageData,
        "verandasimagename": verandasimageName,
        "limitationsyesnotwoimagedata": limitationsyesnotwoimageData,
        "limitationsyesnotwoimagename": limitationsyesnotwoimageName,
        "limitationsyesnothreeimagedata": limitationsyesnothreeimageData,
        "limitationsyesnothreeimagename": limitationsyesnothreeimageName,
        "limitationsyesnofourimagedata": limitationsyesnofourimageData,
        "limitationsyesnofourimagename": limitationsyesnofourimageName,
      });
      var responce = jsonDecode(res.body);
      if (responce["success"] == "true") {
        Navigator.of(context).pop();
        //print("Record Inserted");

        Fluttertoast.showToast(msg: "Record Inserted");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BuildingInspectorTheExteriorStepThreeFragments(reportId: id)));
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
        viewVisibleTwo = false;
        viewVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisible.toString());

        timbertwoimagePath = "NA";
        timbertwoimageName = "NA";
        timbertwoimageData = "NA";

        timberthreeimagePath = "NA";
        timberthreeimageName = "NA";
        timberthreeimageData = "NA";

        timberfourimagePath = "NA";
        timberfourimageName = "NA";
        timberfourimageData = "NA";
      });
    } else {
      setState(() {
        viewVisible = true;
        viewVisibleTwo = false;
        viewVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisible.toString());
      });
    }
  }

  void hidetwoWidget() {
    if (viewVisibleTwo == true) {
      setState(() {
        viewVisibleTwo = false;
        viewVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());

        timberthreeimagePath = "NA";
        timberthreeimageName = "NA";
        timberthreeimageData = "NA";

        timberfourimagePath = "NA";
        timberfourimageName = "NA";
        timberfourimageData = "NA";
      });
    } else {
      setState(() {
        viewVisibleTwo = true;
        viewVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());
      });
    }
  }

  void hidethreeWidget() {
    if (viewVisibleThree == true) {
      setState(() {
        viewVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());

        timberfourimagePath = "NA";
        timberfourimageName = "NA";
        timberfourimageData = "NA";
      });
    } else {
      setState(() {
        viewVisibleThree = true;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());
      });
    }
  }

  void hidestairsWidget() {
    if (viewstairsVisible == true) {
      setState(() {
        viewstairsVisible = false;
        viewstairsVisibleTwo = false;
        viewstairsVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisible.toString());

        stairstwoimagePath = "NA";
        stairstwoimageName = "NA";
        stairstwoimageData = "NA";

        stairsthreeimagePath = "NA";
        stairsthreeimageName = "NA";
        stairsthreeimageData = "NA";

        stairsfourimagePath = "NA";
        stairsfourimageName = "NA";
        stairsfourimageData = "NA";
      });
    } else {
      setState(() {
        viewstairsVisible = true;
        viewstairsVisibleTwo = false;
        viewstairsVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisible.toString());
      });
    }
  }

  void hidestairstwoWidget() {
    if (viewstairsVisibleTwo == true) {
      setState(() {
        viewstairsVisibleTwo = false;
        viewstairsVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());

        stairsthreeimagePath = "NA";
        stairsthreeimageName = "NA";
        stairsthreeimageData = "NA";

        stairsfourimagePath = "NA";
        stairsfourimageName = "NA";
        stairsfourimageData = "NA";
      });
    } else {
      setState(() {
        viewstairsVisibleTwo = true;
        viewstairsVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());
      });
    }
  }

  void hidestairsthreeWidget() {
    if (viewstairsVisibleThree == true) {
      setState(() {
        viewstairsVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());

        stairsfourimagePath = "NA";
        stairsfourimageName = "NA";
        stairsfourimageData = "NA";
      });
    } else {
      setState(() {
        viewstairsVisibleThree = true;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());
      });
    }
  }

  void hidebalustradesWidget() {
    if (viewbalustradesVisible == true) {
      setState(() {
        viewbalustradesVisible = false;
        viewbalustradesVisibleTwo = false;
        viewbalustradesVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisible.toString());

        balustradestwoimagePath = "NA";
        balustradestwoimageName = "NA";
        balustradestwoimageData = "NA";

        balustradesthreeimagePath = "NA";
        balustradesthreeimageName = "NA";
        balustradesthreeimageData = "NA";

        balustradesfourimagePath = "NA";
        balustradesfourimageName = "NA";
        balustradesfourimageData = "NA";
      });
    } else {
      setState(() {
        viewbalustradesVisible = true;
        viewbalustradesVisibleTwo = false;
        viewbalustradesVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisible.toString());
      });
    }
  }

  void hidebalustradestwoWidget() {
    if (viewbalustradesVisibleTwo == true) {
      setState(() {
        viewbalustradesVisibleTwo = false;
        viewbalustradesVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());

        balustradesthreeimagePath = "NA";
        balustradesthreeimageName = "NA";
        balustradesthreeimageData = "NA";

        balustradesfourimagePath = "NA";
        balustradesfourimageName = "NA";
        balustradesfourimageData = "NA";
      });
    } else {
      setState(() {
        viewbalustradesVisibleTwo = true;
        viewbalustradesVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());
      });
    }
  }

  void hidebalustradesthreeWidget() {
    if (viewbalustradesVisibleThree == true) {
      setState(() {
        viewbalustradesVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());

        balustradesfourimagePath = "NA";
        balustradesfourimageName = "NA";
        balustradesfourimageData = "NA";
      });
    } else {
      setState(() {
        viewbalustradesVisibleThree = true;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());
      });
    }
  }

  void hidebalconiesWidget() {
    if (viewbalconiesVisible == true) {
      setState(() {
        viewbalconiesVisible = false;
        viewbalconiesVisibleTwo = false;
        viewbalconiesVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisible.toString());

        balconiestwoimagePath = "NA";
        balconiestwoimageName = "NA";
        balconiestwoimageData = "NA";

        balconiesthreeimagePath = "NA";
        balconiesthreeimageName = "NA";
        balconiesthreeimageData = "NA";

        balconiesfourimagePath = "NA";
        balconiesfourimageName = "NA";
        balconiesfourimageData = "NA";
      });
    } else {
      setState(() {
        viewbalconiesVisible = true;
        viewbalconiesVisibleTwo = false;
        viewbalconiesVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisible.toString());
      });
    }
  }

  void hidebalconiestwoWidget() {
    if (viewbalconiesVisibleTwo == true) {
      setState(() {
        viewbalconiesVisibleTwo = false;
        viewbalconiesVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());

        balconiesthreeimagePath = "NA";
        balconiesthreeimageName = "NA";
        balconiesthreeimageData = "NA";

        balconiesfourimagePath = "NA";
        balconiesfourimageName = "NA";
        balconiesfourimageData = "NA";
      });
    } else {
      setState(() {
        viewbalconiesVisibleTwo = true;
        viewbalconiesVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());
      });
    }
  }

  void hidebalconiesthreeWidget() {
    if (viewbalconiesVisibleThree == true) {
      setState(() {
        viewbalconiesVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());

        balconiesfourimagePath = "NA";
        balconiesfourimageName = "NA";
        balconiesfourimageData = "NA";
      });
    } else {
      setState(() {
        viewbalconiesVisibleThree = true;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());
      });
    }
  }

  void hideverandasWidget() {
    if (viewverandasVisible == true) {
      setState(() {
        viewverandasVisible = false;
        viewverandasVisibleTwo = false;
        viewverandasVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisible.toString());

        limitationsyesnotwoimagePath = "NA";
        limitationsyesnotwoimageName = "NA";
        limitationsyesnotwoimageData = "NA";

        limitationsyesnothreeimagePath = "NA";
        limitationsyesnothreeimageName = "NA";
        limitationsyesnothreeimageData = "NA";

        limitationsyesnofourimagePath = "NA";
        limitationsyesnofourimageName = "NA";
        limitationsyesnofourimageData = "NA";
      });
    } else {
      setState(() {
        viewverandasVisible = true;
        viewverandasVisibleTwo = false;
        viewverandasVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisible.toString());
      });
    }
  }

  void hideverandastwoWidget() {
    if (viewverandasVisibleTwo == true) {
      setState(() {
        viewverandasVisibleTwo = false;
        viewverandasVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());

        limitationsyesnothreeimagePath = "NA";
        limitationsyesnothreeimageName = "NA";
        limitationsyesnothreeimageData = "NA";

        limitationsyesnofourimagePath = "NA";
        limitationsyesnofourimageName = "NA";
        limitationsyesnofourimageData = "NA";
      });
    } else {
      setState(() {
        viewverandasVisibleTwo = true;
        viewverandasVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());
      });
    }
  }

  void hideverandasthreeWidget() {
    if (viewverandasVisibleThree == true) {
      setState(() {
        viewverandasVisibleThree = false;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());

        limitationsyesnofourimagePath = "NA";
        limitationsyesnofourimageName = "NA";
        limitationsyesnofourimageData = "NA";
      });
    } else {
      setState(() {
        viewverandasVisibleThree = true;
        //Fluttertoast.showToast(msg: viewVisibleTwo.toString());
      });
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
                'EXTERIOR OF THE BUILDING (STEP 2)',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Description of the Defects/Safety Hazards, Location and the Inspector’s Recommendations',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
            //Timber and Steel Structures

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Timber and Steel Structures'),
                ),
                value: exteriordefectstimber,
                items: [
                  DropdownMenuItem(
                    child: Text('-Select-'),
                    value: "NA",
                  ),
                  DropdownMenuItem(
                    child: Text('Defects/Safety Hazards found were'),
                    value: "Defects/Safety Hazards found were",
                  ),
                  DropdownMenuItem(
                    child: Text('No Defects/Safety Hazards found.'),
                    value: "No Defects/Safety Hazards found",
                  ),
                  DropdownMenuItem(
                    child: Text('Not present'),
                    value: "Not present",
                  ),
                  DropdownMenuItem(
                    child: Text('Part of common area'),
                    value: "Part of common area",
                  ),
                ],
                onChanged: (exteriordefectstimber) {
                  setState(() {
                    this.exteriordefectstimber = exteriordefectstimber!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: timberimagePath != "NA"
                  ? Image.memory(base64Decode(timberimagePath))
                  : Text('Image Not Choose Yet'),
              //child: Text('Image Goes Here'),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          timbercaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          timbergetImage();
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
                    //Fluttertoast.showToast(msg: "Add or Delete More Image");
                    //conditionCheck();
                    hideWidget();
                  },
                  child: Text('Add or Delete More Image')),
            ),

            //1st Add More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewVisible,
              replacement: const SizedBox.shrink(),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: timbertwoimageData != "NA"
                          ? Image.memory(base64Decode(timbertwoimageData))
                          : Text('Image Not Choose Yet'),
                      //child: Text('Image Goes Here'),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  timbertwocaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  timbertwogetImage();
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
                            //Fluttertoast.showToast(msg: "Add or Delete More Image");
                            //conditionCheck();
                            hidetwoWidget();
                          },
                          child: Text('Add or Delete More Image')),
                    ),
                  ],
                ),
              ),
            ),

            //2nd Add More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewVisibleTwo,
              replacement: const SizedBox.shrink(),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: timberthreeimageData != "NA"
                          ? Image.memory(base64Decode(timberthreeimageData))
                          : Text('Image Not Choose Yet'),
                      //child: Text('Image Goes Here'),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  timberthreecaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  timberthreegetImage();
                                },
                                child: Text('Choose Image')),
                          ),
                        ],
                      ),
                    ),

                    //3rd Add More Button
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: () {
                            //Fluttertoast.showToast(msg: "Add or Delete More Image");
                            //conditionCheck();
                            hidethreeWidget();
                          },
                          child: Text('Add or Delete More Image')),
                    ),
                  ],
                ),
              ),
            ),

            //3rd Add More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewVisibleThree,
              replacement: const SizedBox.shrink(),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: timberfourimageData != "NA"
                          ? Image.memory(base64Decode(timberfourimageData))
                          : Text('Image Not Choose Yet'),
                      //child: Text('Image Goes Here'),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  timberfourcaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  timberfourgetImage();
                                },
                                child: Text('Choose Image')),
                          ),
                        ],
                      ),
                    ),

                    //4th Add More Button
                    /*Container(
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton(
                            onPressed: () {
                    //Fluttertoast.showToast(msg: "Add or Delete More Image");
                              //conditionCheck();
                              hidetwoWidget();
                            },
                            child: Text('Add More Image')),
                      ),*/
                  ],
                ),
              ),
            ),

            //Stairs

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Stairs'),
                ),
                value: exteriordefectsstairs,
                items: [
                  DropdownMenuItem(
                    child: Text('-Select-'),
                    value: "NA",
                  ),
                  DropdownMenuItem(
                    child: Text('Defects/Safety Hazards found were'),
                    value: "Defects/Safety Hazards found were",
                  ),
                  DropdownMenuItem(
                    child: Text('No Defects/Safety Hazards found.'),
                    value: "No Defects/Safety Hazards found",
                  ),
                  DropdownMenuItem(
                    child: Text('Not present'),
                    value: "Not present",
                  ),
                  DropdownMenuItem(
                    child: Text('Part of common area'),
                    value: "Part of common area",
                  ),
                ],
                onChanged: (exteriordefectsstairs) {
                  setState(() {
                    this.exteriordefectsstairs = exteriordefectsstairs!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: stairsimagePath != "NA"
                  ? Image.memory(base64Decode(stairsimagePath))
                  : Text('Image Not Choose Yet'),
              //child: Text('Image Goes Here'),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          stairscaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          stairsgetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),

            //1st stairs Add More Button
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    //Fluttertoast.showToast(msg: "Add or Delete More Image");
                    //conditionCheck();
                    hidestairsWidget();
                  },
                  child: Text('Add or Delete More Image')),
            ),

            //1st stairs Add More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewstairsVisible,
              replacement: const SizedBox.shrink(),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: stairstwoimageData != "NA"
                          ? Image.memory(base64Decode(stairstwoimageData))
                          : Text('Image Not Choose Yet'),
                      //child: Text('Image Goes Here'),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  stairstwocaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  stairstwogetImage();
                                },
                                child: Text('Choose Image')),
                          ),
                        ],
                      ),
                    ),

                    //2nd stairs Add More Button
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: () {
                            //Fluttertoast.showToast(msg: "Add or Delete More Image");
                            //conditionCheck();
                            hidestairstwoWidget();
                          },
                          child: Text('Add or Delete More Image')),
                    ),
                  ],
                ),
              ),
            ),

            //2nd stairs Add More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewstairsVisibleTwo,
              replacement: const SizedBox.shrink(),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: stairsthreeimageData != "NA"
                          ? Image.memory(base64Decode(stairsthreeimageData))
                          : Text('Image Not Choose Yet'),
                      //child: Text('Image Goes Here'),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  stairsthreecaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  stairsthreegetImage();
                                },
                                child: Text('Choose Image')),
                          ),
                        ],
                      ),
                    ),

                    //3rd stairs Add More Button
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: () {
                            //Fluttertoast.showToast(msg: "Add or Delete More Image");
                            //conditionCheck();
                            hidestairsthreeWidget();
                          },
                          child: Text('Add or Delete More Image')),
                    ),
                  ],
                ),
              ),
            ),

            //3rd stairs Add More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewstairsVisibleThree,
              replacement: const SizedBox.shrink(),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: stairsfourimageData != "NA"
                          ? Image.memory(base64Decode(stairsfourimageData))
                          : Text('Image Not Choose Yet'),
                      //child: Text('Image Goes Here'),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  stairsfourcaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  stairsfourgetImage();
                                },
                                child: Text('Choose Image')),
                          ),
                        ],
                      ),
                    ),

                    //4th Add More Button
                    /*Container(
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton(
                            onPressed: () {
                    //Fluttertoast.showToast(msg: "Add or Delete More Image");
                              //conditionCheck();
                              hidetwoWidget();
                            },
                            child: Text('Add More Image')),
                      ),*/
                  ],
                ),
              ),
            ),

            //Balustrades

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Balustrades'),
                ),
                value: exteriordefectsbalustrades,
                items: [
                  DropdownMenuItem(
                    child: Text('-Select-'),
                    value: "NA",
                  ),
                  DropdownMenuItem(
                    child: Text('Defects/Safety Hazards found were'),
                    value: "Defects/Safety Hazards found were",
                  ),
                  DropdownMenuItem(
                    child: Text('No Defects/Safety Hazards found.'),
                    value: "No Defects/Safety Hazards found",
                  ),
                  DropdownMenuItem(
                    child: Text('Not present'),
                    value: "Not present",
                  ),
                  DropdownMenuItem(
                    child: Text('Part of common area'),
                    value: "Part of common area",
                  ),
                ],
                onChanged: (exteriordefectsbalustrades) {
                  setState(() {
                    this.exteriordefectsbalustrades =
                        exteriordefectsbalustrades!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: balustradesimagePath != "NA"
                  ? Image.memory(base64Decode(balustradesimagePath))
                  : Text('Image Not Choose Yet'),
              //child: Text('Image Goes Here'),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          balustradescaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          balustradesgetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),

            //1st balustrades Add More Button
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    //Fluttertoast.showToast(msg: "Add or Delete More Image");
                    //conditionCheck();
                    hidebalustradesWidget();
                  },
                  child: Text('Add or Delete More Image')),
            ),

            //1st balustrades Add More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewbalustradesVisible,
              replacement: const SizedBox.shrink(),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: balustradestwoimageData != "NA"
                          ? Image.memory(base64Decode(balustradestwoimageData))
                          : Text('Image Not Choose Yet'),
                      //child: Text('Image Goes Here'),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  balustradestwocaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  balustradestwogetImage();
                                },
                                child: Text('Choose Image')),
                          ),
                        ],
                      ),
                    ),

                    //2nd balustrades Add More Button
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: () {
                            //Fluttertoast.showToast(msg: "Add or Delete More Image");
                            //conditionCheck();
                            hidebalustradestwoWidget();
                          },
                          child: Text('Add or Delete More Image')),
                    ),
                  ],
                ),
              ),
            ),

            //2nd balustrades Add More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewbalustradesVisibleTwo,
              replacement: const SizedBox.shrink(),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: balustradesthreeimageData != "NA"
                          ? Image.memory(
                              base64Decode(balustradesthreeimageData))
                          : Text('Image Not Choose Yet'),
                      //child: Text('Image Goes Here'),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  balustradesthreecaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  balustradesthreegetImage();
                                },
                                child: Text('Choose Image')),
                          ),
                        ],
                      ),
                    ),

                    //3rd balustrades Add More Button
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: () {
                            //Fluttertoast.showToast(msg: "Add or Delete More Image");
                            //conditionCheck();
                            hidebalustradesthreeWidget();
                          },
                          child: Text('Add or Delete More Image')),
                    ),
                  ],
                ),
              ),
            ),

            //3rd balustrades Add More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewbalustradesVisibleThree,
              replacement: const SizedBox.shrink(),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: balustradesfourimageData != "NA"
                          ? Image.memory(base64Decode(balustradesfourimageData))
                          : Text('Image Not Choose Yet'),
                      //child: Text('Image Goes Here'),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  balustradesfourcaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  balustradesfourgetImage();
                                },
                                child: Text('Choose Image')),
                          ),
                        ],
                      ),
                    ),

                    //4th Add More Button
                    /*Container(
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton(
                            onPressed: () {
                    //Fluttertoast.showToast(msg: "Add or Delete More Image");
                              //conditionCheck();
                              hidetwoWidget();
                            },
                            child: Text('Add More Image')),
                      ),*/
                  ],
                ),
              ),
            ),

            //Balconies

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Balconies'),
                ),
                value: exteriordefectsbalconies,
                items: [
                  DropdownMenuItem(
                    child: Text('-Select-'),
                    value: "NA",
                  ),
                  DropdownMenuItem(
                    child: Text('Defects/Safety Hazards found were'),
                    value: "Defects/Safety Hazards found were",
                  ),
                  DropdownMenuItem(
                    child: Text('No Defects/Safety Hazards found.'),
                    value: "No Defects/Safety Hazards found",
                  ),
                  DropdownMenuItem(
                    child: Text('Not present'),
                    value: "Not present",
                  ),
                  DropdownMenuItem(
                    child: Text('Part of common area'),
                    value: "Part of common area",
                  ),
                ],
                onChanged: (exteriordefectsbalconies) {
                  setState(() {
                    this.exteriordefectsbalconies = exteriordefectsbalconies!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: exteriordefectsbalconiesCheck(),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: balconiesimagePath != "NA"
                  ? Image.memory(base64Decode(balconiesimagePath))
                  : Text('Image Not Choose Yet'),
              //child: Text('Image Goes Here'),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          balconiescaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          balconiesgetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),

            //1st balconies Add More Button
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    //Fluttertoast.showToast(msg: "Add or Delete More Image");
                    //conditionCheck();
                    hidebalconiesWidget();
                  },
                  child: Text('Add or Delete More Image')),
            ),

            //1st balconies Add More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewbalconiesVisible,
              replacement: const SizedBox.shrink(),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: balconiestwoimageData != "NA"
                          ? Image.memory(base64Decode(balconiestwoimageData))
                          : Text('Image Not Choose Yet'),
                      //child: Text('Image Goes Here'),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  balconiestwocaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  balconiestwogetImage();
                                },
                                child: Text('Choose Image')),
                          ),
                        ],
                      ),
                    ),

                    //2nd balconies Add More Button
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: () {
                            //Fluttertoast.showToast(msg: "Add or Delete More Image");
                            //conditionCheck();
                            hidebalconiestwoWidget();
                          },
                          child: Text('Add or Delete More Image')),
                    ),
                  ],
                ),
              ),
            ),

            //2nd balconies Add More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewbalconiesVisibleTwo,
              replacement: const SizedBox.shrink(),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: balconiesthreeimageData != "NA"
                          ? Image.memory(base64Decode(balconiesthreeimageData))
                          : Text('Image Not Choose Yet'),
                      //child: Text('Image Goes Here'),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  balconiesthreecaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  balconiesthreegetImage();
                                },
                                child: Text('Choose Image')),
                          ),
                        ],
                      ),
                    ),

                    //3rd balconies Add More Button
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: () {
                            //Fluttertoast.showToast(msg: "Add or Delete More Image");
                            //conditionCheck();
                            hidebalconiesthreeWidget();
                          },
                          child: Text('Add or Delete More Image')),
                    ),
                  ],
                ),
              ),
            ),

            //3rd balconies Add More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewbalconiesVisibleThree,
              replacement: const SizedBox.shrink(),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: balconiesfourimageData != "NA"
                          ? Image.memory(base64Decode(balconiesfourimageData))
                          : Text('Image Not Choose Yet'),
                      //child: Text('Image Goes Here'),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  balconiesfourcaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  balconiesfourgetImage();
                                },
                                child: Text('Choose Image')),
                          ),
                        ],
                      ),
                    ),

                    //4th Add More Button
                    /*Container(
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton(
                            onPressed: () {
                    //Fluttertoast.showToast(msg: "Add or Delete More Image");
                              //conditionCheck();
                              hidetwoWidget();
                            },
                            child: Text('Add More Image')),
                      ),*/
                  ],
                ),
              ),
            ),

            //Verandas

            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Verandas'),
                ),
                value: exteriordefectsverandas,
                items: [
                  DropdownMenuItem(
                    child: Text('-Select-'),
                    value: "NA",
                  ),
                  DropdownMenuItem(
                    child: Text('Defects/Safety Hazards found were'),
                    value: "Defects/Safety Hazards found were",
                  ),
                  DropdownMenuItem(
                    child: Text('No Defects/Safety Hazards found.'),
                    value: "No Defects/Safety Hazards found",
                  ),
                  DropdownMenuItem(
                    child: Text('Not present'),
                    value: "Not present",
                  ),
                  DropdownMenuItem(
                    child: Text('Part of common area'),
                    value: "Part of common area",
                  ),
                ],
                onChanged: (exteriordefectsverandas) {
                  setState(() {
                    this.exteriordefectsverandas = exteriordefectsverandas!;
                    //print(personsinattendance);
                  });
                },
              ),
            ),
            //The limitations were:
            Container(
              margin: EdgeInsets.all(10),
              child: exteriordefectsverandasCheck(),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: verandasimagePath != "NA"
                  ? Image.memory(base64Decode(verandasimagePath))
                  : Text('Image Not Choose Yet'),
              //child: Text('Image Goes Here'),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          verandascaptureImage();
                        },
                        child: Text('Capture Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          verandasgetImage();
                        },
                        child: Text('Choose Image')),
                  ),
                ],
              ),
            ),

            //1st verandas Add More Button
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    //Fluttertoast.showToast(msg: "Add or Delete More Image");
                    //conditionCheck();
                    hideverandasWidget();
                  },
                  child: Text('Add or Delete More Image')),
            ),

            //1st verandas Add More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewverandasVisible,
              replacement: const SizedBox.shrink(),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                    //2nd verandas Add More Button
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: () {
                            //Fluttertoast.showToast(msg: "Add or Delete More Image");
                            //conditionCheck();
                            hideverandastwoWidget();
                          },
                          child: Text('Add or Delete More Image')),
                    ),
                  ],
                ),
              ),
            ),

            //2nd verandas Add More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewverandasVisibleTwo,
              replacement: const SizedBox.shrink(),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                    //3rd verandas Add More Button
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: () {
                            //Fluttertoast.showToast(msg: "Add or Delete More Image");
                            //conditionCheck();
                            hideverandasthreeWidget();
                          },
                          child: Text('Add or Delete More Image')),
                    ),
                  ],
                ),
              ),
            ),

            //3rd verandas Add More Image
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: viewverandasVisibleThree,
              replacement: const SizedBox.shrink(),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: limitationsyesnofourimageData != "NA"
                          ? Image.memory(
                              base64Decode(limitationsyesnofourimageData))
                          : Text('Image Not Choose Yet'),
                      //child: Text('Image Goes Here'),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  limitationsyesnofourcaptureImage();
                                },
                                child: Text('Capture Image')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  limitationsyesnofourgetImage();
                                },
                                child: Text('Choose Image')),
                          ),
                        ],
                      ),
                    ),

                    //4th Add More Button
                    /*Container(
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton(
                            onPressed: () {
                    //Fluttertoast.showToast(msg: "Add or Delete More Image");
                              //conditionCheck();
                              hidetwoWidget();
                            },
                            child: Text('Add More Image')),
                      ),*/
                  ],
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
                          updateTheExteriorDetails(widget.reportId);
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
